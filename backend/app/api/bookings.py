from typing import List
from datetime import date
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from app.core.database import get_db
from app.models import Booking, Room, Product
from app.schemas.booking import BookingCreate, BookingUpdate, BookingResponse
from app.schemas.room import RoomResponse
from app.api.deps import get_current_active_user, get_admin_user
from typing import Optional

router = APIRouter(prefix="/bookings", tags=["Bookings"])

def calculate_booking_price(booking_data: BookingCreate, db: Session) -> float:
    """Calculate total price based on booking type"""
    if booking_data.room_id:
        room = db.query(Room).filter(Room.id == booking_data.room_id).first()
        if not room:
            raise HTTPException(status_code=404, detail="Room not found")
        
        if booking_data.check_in and booking_data.check_out:
            nights = (booking_data.check_out - booking_data.check_in).days
            return float(room.base_price) * nights
        return float(room.base_price)
    
    elif booking_data.product_id:
        product = db.query(Product).filter(Product.id == booking_data.product_id).first()
        if not product:
            raise HTTPException(status_code=404, detail="Product not found")
        return float(product.price) * booking_data.guests
    
    raise HTTPException(status_code=400, detail="Invalid booking data")

@router.get("", response_model=List[BookingResponse])
def get_bookings(
    skip: int = Query(0, ge=0),
    limit: int = Query(100, ge=1, le=100),
    status: str = None,
    db: Session = Depends(get_db)
):
    """Get all bookings - no auth required for demo"""
    query = db.query(Booking)
    
    if status:
        query = query.filter(Booking.status == status)
    
    return query.offset(skip).limit(limit).all()

@router.get("/{booking_id}", response_model=BookingResponse)
def get_booking(
    booking_id: int,
    db: Session = Depends(get_db)
):
    booking = db.query(Booking).filter(Booking.id == booking_id).first()
    if not booking:
        raise HTTPException(status_code=404, detail="Booking not found")
    
    return booking

@router.post("", response_model=BookingResponse, status_code=201)
def create_booking(
    booking_data: BookingCreate,
    db: Session = Depends(get_db)
):
    """Create booking without authentication - for guests"""
    try:
        # Extract guest info
        guest_name = booking_data.guest_name
        guest_email = booking_data.guest_email
        guest_phone = booking_data.guest_phone
        
        # Create special_requests from guest info
        special_requests = None
        if guest_name and guest_email and guest_phone:
            special_requests = f"Guest: {guest_name}, Email: {guest_email}, Phone: {guest_phone}"
        
        # Use provided total_price or calculate it
        if booking_data.total_price:
            total_price = float(booking_data.total_price)
        else:
            total_price = calculate_booking_price(booking_data, db)
        
        # Create booking
        booking = Booking(
            booking_type=booking_data.booking_type,
            room_id=booking_data.room_id,
            product_id=booking_data.product_id,
            check_in=booking_data.check_in,
            check_out=booking_data.check_out,
            booking_date=booking_data.booking_date,
            guests=booking_data.guests,
            user_id=None,
            total_price=total_price,
            special_requests=special_requests,
            status='pending'
        )
        db.add(booking)
        db.commit()
        db.refresh(booking)
        return booking
    except Exception as e:
        db.rollback()
        print(f"Error creating booking: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@router.put("/{booking_id}", response_model=BookingResponse)
def update_booking(
    booking_id: int,
    booking_data: BookingUpdate,
    db: Session = Depends(get_db)
):
    """Update booking - no auth required for demo"""
    booking = db.query(Booking).filter(Booking.id == booking_id).first()
    if not booking:
        raise HTTPException(status_code=404, detail="Booking not found")
    
    for key, value in booking_data.model_dump(exclude_unset=True).items():
        setattr(booking, key, value)
    
    db.commit()
    db.refresh(booking)
    return booking

@router.delete("/{booking_id}", status_code=204)
def delete_booking(
    booking_id: int,
    db: Session = Depends(get_db),
    admin = Depends(get_admin_user)
):
    booking = db.query(Booking).filter(Booking.id == booking_id).first()
    if not booking:
        raise HTTPException(status_code=404, detail="Booking not found")
    
    db.delete(booking)
    db.commit()
    return None

@router.get("/availability/rooms")
def check_room_availability(
    check_in: date,
    check_out: date,
    guests: int = 1,
    db: Session = Depends(get_db)
):
    """Check available rooms for given dates"""
    # Get all active rooms
    all_rooms = db.query(Room).filter(Room.is_active == True, Room.capacity >= guests).all()
    
    # Get booked room IDs for the date range
    booked_rooms = db.query(Booking.room_id).filter(
        Booking.room_id.isnot(None),
        Booking.status.in_(["pending", "confirmed"]),
        Booking.check_in < check_out,
        Booking.check_out > check_in
    ).all()
    
    booked_ids = [r[0] for r in booked_rooms]
    available_rooms = [r for r in all_rooms if r.id not in booked_ids]
    
    return available_rooms

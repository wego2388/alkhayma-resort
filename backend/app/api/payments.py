from typing import List
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from app.core.database import get_db
from app.models import Payment, Booking
from app.schemas.payment import PaymentCreate, PaymentResponse
from app.api.deps import get_current_active_user, get_admin_user
import uuid

router = APIRouter(prefix="/payments", tags=["Payments"])

@router.get("", response_model=List[PaymentResponse])
def get_payments(
    skip: int = Query(0, ge=0),
    limit: int = Query(100, ge=1, le=100),
    db: Session = Depends(get_db),
    current_user = Depends(get_current_active_user)
):
    query = db.query(Payment).join(Booking)
    
    # Non-admin users see only their payments
    if current_user.role != "admin":
        query = query.filter(Booking.user_id == current_user.id)
    
    return query.offset(skip).limit(limit).all()

@router.get("/{payment_id}", response_model=PaymentResponse)
def get_payment(
    payment_id: int,
    db: Session = Depends(get_db),
    current_user = Depends(get_current_active_user)
):
    payment = db.query(Payment).join(Booking).filter(Payment.id == payment_id).first()
    if not payment:
        raise HTTPException(status_code=404, detail="Payment not found")
    
    # Check ownership
    booking = db.query(Booking).filter(Booking.id == payment.booking_id).first()
    if current_user.role != "admin" and booking.user_id != current_user.id:
        raise HTTPException(status_code=403, detail="Not authorized")
    
    return payment

@router.post("", response_model=PaymentResponse, status_code=201)
def create_payment(
    payment_data: PaymentCreate,
    db: Session = Depends(get_db),
    current_user = Depends(get_current_active_user)
):
    # Verify booking exists and belongs to user
    booking = db.query(Booking).filter(Booking.id == payment_data.booking_id).first()
    if not booking:
        raise HTTPException(status_code=404, detail="Booking not found")
    
    if current_user.role != "admin" and booking.user_id != current_user.id:
        raise HTTPException(status_code=403, detail="Not authorized")
    
    # Create payment with transaction ID
    payment = Payment(
        **payment_data.model_dump(),
        transaction_id=f"TXN-{uuid.uuid4().hex[:12].upper()}",
        status="completed"
    )
    
    # Update booking status
    booking.status = "confirmed"
    
    db.add(payment)
    db.commit()
    db.refresh(payment)
    return payment

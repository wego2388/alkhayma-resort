from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from sqlalchemy import func, extract
from app.core.database import get_db
from app.models import Booking, Room, Product
from datetime import datetime, timedelta

router = APIRouter(prefix="/stats", tags=["Statistics"])

@router.get("/dashboard")
def get_dashboard_stats(db: Session = Depends(get_db)):
    """Get comprehensive dashboard statistics"""
    
    # Total bookings
    total_bookings = db.query(Booking).count()
    
    # Active bookings (confirmed)
    active_bookings = db.query(Booking).filter(Booking.status == 'confirmed').count()
    
    # Pending bookings
    pending_bookings = db.query(Booking).filter(Booking.status == 'pending').count()
    
    # Total revenue
    total_revenue = db.query(func.sum(Booking.total_price)).filter(
        Booking.status.in_(['confirmed', 'completed'])
    ).scalar() or 0
    
    # Revenue this month
    current_month = datetime.now().month
    current_year = datetime.now().year
    monthly_revenue = db.query(func.sum(Booking.total_price)).filter(
        extract('month', Booking.created_at) == current_month,
        extract('year', Booking.created_at) == current_year,
        Booking.status.in_(['confirmed', 'completed'])
    ).scalar() or 0
    
    # Bookings by type
    bookings_by_type = db.query(
        Booking.booking_type,
        func.count(Booking.id).label('count')
    ).group_by(Booking.booking_type).all()
    
    # Recent bookings (last 7 days)
    week_ago = datetime.now() - timedelta(days=7)
    recent_bookings = db.query(Booking).filter(
        Booking.created_at >= week_ago
    ).count()
    
    # Bookings by status
    bookings_by_status = db.query(
        Booking.status,
        func.count(Booking.id).label('count')
    ).group_by(Booking.status).all()
    
    # Total rooms and products
    total_rooms = db.query(Room).count()
    active_rooms = db.query(Room).filter(Room.is_active == True).count()
    total_products = db.query(Product).count()
    active_products = db.query(Product).filter(Product.is_active == True).count()
    
    # Revenue by month (last 6 months)
    monthly_data = []
    for i in range(5, -1, -1):
        date = datetime.now() - timedelta(days=i*30)
        month = date.month
        year = date.year
        revenue = db.query(func.sum(Booking.total_price)).filter(
            extract('month', Booking.created_at) == month,
            extract('year', Booking.created_at) == year,
            Booking.status.in_(['confirmed', 'completed'])
        ).scalar() or 0
        monthly_data.append({
            'month': date.strftime('%b'),
            'revenue': float(revenue)
        })
    
    return {
        'overview': {
            'total_bookings': total_bookings,
            'active_bookings': active_bookings,
            'pending_bookings': pending_bookings,
            'total_revenue': float(total_revenue),
            'monthly_revenue': float(monthly_revenue),
            'recent_bookings': recent_bookings
        },
        'bookings_by_type': [
            {'type': item[0], 'count': item[1]} 
            for item in bookings_by_type
        ],
        'bookings_by_status': [
            {'status': item[0], 'count': item[1]} 
            for item in bookings_by_status
        ],
        'inventory': {
            'total_rooms': total_rooms,
            'active_rooms': active_rooms,
            'total_products': total_products,
            'active_products': active_products
        },
        'monthly_revenue': monthly_data
    }

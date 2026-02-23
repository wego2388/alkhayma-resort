from pydantic import BaseModel
from typing import Optional
from datetime import date, datetime
from decimal import Decimal

class BookingBase(BaseModel):
    booking_type: str
    room_id: Optional[int] = None
    product_id: Optional[int] = None
    check_in: Optional[date] = None
    check_out: Optional[date] = None
    booking_date: Optional[datetime] = None
    guests: int = 1
    special_requests: Optional[str] = None

class BookingCreate(BookingBase):
    pass

class BookingUpdate(BaseModel):
    status: Optional[str] = None
    special_requests: Optional[str] = None

class BookingResponse(BookingBase):
    id: int
    user_id: int
    total_price: Decimal
    status: str
    created_at: datetime
    
    class Config:
        from_attributes = True

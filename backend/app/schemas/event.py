from pydantic import BaseModel
from typing import Optional
from datetime import datetime
from decimal import Decimal

class EventBase(BaseModel):
    name: str
    name_ar: str
    description: Optional[str] = None
    description_ar: Optional[str] = None
    category: str  # yoga, zumba, birthday, occasion
    price: Decimal
    image_url: Optional[str] = None
    duration: Optional[int] = None
    schedule_time: Optional[str] = None
    schedule_days: Optional[str] = None
    max_guests: Optional[int] = None
    location: Optional[str] = None
    location_ar: Optional[str] = None

class EventCreate(EventBase):
    pass

class EventUpdate(BaseModel):
    name: Optional[str] = None
    name_ar: Optional[str] = None
    description: Optional[str] = None
    description_ar: Optional[str] = None
    category: Optional[str] = None
    price: Optional[Decimal] = None
    image_url: Optional[str] = None
    duration: Optional[int] = None
    schedule_time: Optional[str] = None
    schedule_days: Optional[str] = None
    max_guests: Optional[int] = None
    location: Optional[str] = None
    location_ar: Optional[str] = None
    is_active: Optional[bool] = None

class EventResponse(EventBase):
    id: int
    is_active: bool
    created_at: datetime
    
    class Config:
        from_attributes = True

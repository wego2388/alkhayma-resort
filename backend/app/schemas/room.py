from pydantic import BaseModel, Field, field_validator
from typing import Optional, List
from datetime import datetime
from decimal import Decimal

class RoomBase(BaseModel):
    name: str
    name_ar: str
    description: Optional[str] = None
    description_ar: Optional[str] = None
    type: Optional[str] = "standard"
    capacity: int
    price_per_night: Decimal = Field(alias="base_price")
    image_url: Optional[str] = None
    amenities: Optional[List[str]] = []
    is_active: Optional[bool] = True
    
    class Config:
        populate_by_name = True

class RoomCreate(RoomBase):
    pass

class RoomUpdate(BaseModel):
    name: Optional[str] = None
    name_ar: Optional[str] = None
    description: Optional[str] = None
    description_ar: Optional[str] = None
    type: Optional[str] = None
    capacity: Optional[int] = None
    base_price: Optional[Decimal] = None
    image_url: Optional[str] = None
    amenities: Optional[List[str]] = None
    is_active: Optional[bool] = None

class RoomResponse(RoomBase):
    id: int
    is_active: bool
    created_at: datetime
    
    class Config:
        from_attributes = True

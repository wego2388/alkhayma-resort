from pydantic import BaseModel
from typing import Optional
from datetime import datetime
from decimal import Decimal

class ProductBase(BaseModel):
    name: str
    name_ar: str
    description: Optional[str] = None
    description_ar: Optional[str] = None
    type: str
    price: Decimal
    image_url: Optional[str] = None
    duration: Optional[int] = None

class ProductCreate(ProductBase):
    pass

class ProductUpdate(BaseModel):
    name: Optional[str] = None
    name_ar: Optional[str] = None
    description: Optional[str] = None
    description_ar: Optional[str] = None
    type: Optional[str] = None
    price: Optional[Decimal] = None
    image_url: Optional[str] = None
    duration: Optional[int] = None
    is_active: Optional[bool] = None

class ProductResponse(ProductBase):
    id: int
    is_active: bool
    created_at: datetime
    
    class Config:
        from_attributes = True

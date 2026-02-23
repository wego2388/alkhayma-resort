from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class ReviewBase(BaseModel):
    rating: int
    comment: Optional[str] = None
    comment_ar: Optional[str] = None

class ReviewCreate(ReviewBase):
    room_id: Optional[int] = None
    product_id: Optional[int] = None

class ReviewResponse(ReviewBase):
    id: int
    user_id: int
    room_id: Optional[int]
    product_id: Optional[int]
    is_approved: bool
    created_at: datetime
    
    class Config:
        from_attributes = True

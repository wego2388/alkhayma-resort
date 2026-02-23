from pydantic import BaseModel
from typing import Optional
from datetime import datetime
from decimal import Decimal

class PaymentBase(BaseModel):
    booking_id: int
    amount: Decimal
    payment_method: str

class PaymentCreate(PaymentBase):
    pass

class PaymentResponse(PaymentBase):
    id: int
    status: str
    transaction_id: Optional[str]
    payment_date: datetime
    
    class Config:
        from_attributes = True

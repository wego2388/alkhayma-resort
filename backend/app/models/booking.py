from sqlalchemy import Column, Integer, String, Date, Numeric, Text, TIMESTAMP, ForeignKey
from sqlalchemy.sql import func
from app.core.database import Base

class Booking(Base):
    __tablename__ = "bookings"
    
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id", ondelete="CASCADE"))
    room_id = Column(Integer, ForeignKey("rooms.id", ondelete="SET NULL"), nullable=True)
    product_id = Column(Integer, ForeignKey("products.id", ondelete="SET NULL"), nullable=True)
    booking_type = Column(String(50), nullable=False)
    check_in = Column(Date, nullable=True)
    check_out = Column(Date, nullable=True)
    booking_date = Column(TIMESTAMP, nullable=True)
    guests = Column(Integer, default=1)
    total_price = Column(Numeric(10, 2), nullable=False)
    status = Column(String(50), default="pending")
    special_requests = Column(Text)
    created_at = Column(TIMESTAMP, server_default=func.now())
    updated_at = Column(TIMESTAMP, server_default=func.now(), onupdate=func.now())

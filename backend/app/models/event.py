from sqlalchemy import Column, Integer, String, Text, Numeric, Boolean, TIMESTAMP, Time
from sqlalchemy.sql import func
from app.core.database import Base

class Event(Base):
    __tablename__ = "events"
    
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(255), nullable=False)
    name_ar = Column(String(255), nullable=False)
    description = Column(Text)
    description_ar = Column(Text)
    category = Column(String(50), nullable=False)  # yoga, zumba, birthday, occasion
    price = Column(Numeric(10, 2), nullable=False)
    image_url = Column(Text)
    duration = Column(Integer)  # in minutes
    schedule_time = Column(String(50))  # e.g., "7:00 AM"
    schedule_days = Column(String(100))  # e.g., "Sunday,Tuesday,Thursday"
    max_guests = Column(Integer)
    location = Column(String(255))
    location_ar = Column(String(255))
    is_active = Column(Boolean, default=True)
    created_at = Column(TIMESTAMP, server_default=func.now())
    updated_at = Column(TIMESTAMP, server_default=func.now(), onupdate=func.now())

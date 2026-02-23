from sqlalchemy import Column, Integer, String, Text, Numeric, Boolean, TIMESTAMP
from sqlalchemy.sql import func
from app.core.database import Base

class Product(Base):
    __tablename__ = "products"
    
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(255), nullable=False)
    name_ar = Column(String(255), nullable=False)
    description = Column(Text)
    description_ar = Column(Text)
    type = Column(String(50), nullable=False)
    price = Column(Numeric(10, 2), nullable=False)
    image_url = Column(Text)
    duration = Column(Integer)
    is_active = Column(Boolean, default=True)
    created_at = Column(TIMESTAMP, server_default=func.now())
    updated_at = Column(TIMESTAMP, server_default=func.now(), onupdate=func.now())

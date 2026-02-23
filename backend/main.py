from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.core.config import settings
from app.core.database import engine, Base
from app.api import auth, rooms, products, bookings, payments, reviews, stats

# Create tables
Base.metadata.create_all(bind=engine)

app = FastAPI(
    title="Al Khayma Resort API",
    description="Resort Management System with Bilingual Support",
    version="1.0.0",
    docs_url="/docs",
    redoc_url="/redoc"
)

# CORS
origins = settings.CORS_ORIGINS.split(",")
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include routers
app.include_router(auth.router, prefix="/api")
app.include_router(rooms.router, prefix="/api")
app.include_router(products.router, prefix="/api")
app.include_router(bookings.router, prefix="/api")
app.include_router(payments.router, prefix="/api")
app.include_router(reviews.router, prefix="/api")
app.include_router(stats.router, prefix="/api")

@app.get("/")
def root():
    return {
        "message": "Welcome to Al Khayma Resort API",
        "message_ar": "مرحباً بك في واجهة برمجة منتجع الخيمة",
        "docs": "/docs",
        "version": "1.0.0",
        "endpoints": {
            "auth": "/api/auth",
            "rooms": "/api/rooms",
            "products": "/api/products",
            "bookings": "/api/bookings",
            "payments": "/api/payments",
            "reviews": "/api/reviews"
        }
    }

@app.get("/health")
def health_check():
    return {"status": "healthy", "database": "connected"}

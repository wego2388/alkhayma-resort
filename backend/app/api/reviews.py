from typing import List
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from app.core.database import get_db
from app.models import Review
from app.schemas.review import ReviewCreate, ReviewResponse
from app.api.deps import get_current_active_user, get_admin_user

router = APIRouter(prefix="/reviews", tags=["Reviews"])

@router.get("", response_model=List[ReviewResponse])
def get_reviews(
    skip: int = Query(0, ge=0),
    limit: int = Query(100, ge=1, le=100),
    room_id: int = None,
    product_id: int = None,
    approved_only: bool = True,
    db: Session = Depends(get_db)
):
    query = db.query(Review)
    
    if room_id:
        query = query.filter(Review.room_id == room_id)
    if product_id:
        query = query.filter(Review.product_id == product_id)
    if approved_only:
        query = query.filter(Review.is_approved == True)
    
    return query.offset(skip).limit(limit).all()

@router.get("/{review_id}", response_model=ReviewResponse)
def get_review(review_id: int, db: Session = Depends(get_db)):
    review = db.query(Review).filter(Review.id == review_id).first()
    if not review:
        raise HTTPException(status_code=404, detail="Review not found")
    return review

@router.post("", response_model=ReviewResponse, status_code=201)
def create_review(
    review_data: ReviewCreate,
    db: Session = Depends(get_db),
    current_user = Depends(get_current_active_user)
):
    if not review_data.room_id and not review_data.product_id:
        raise HTTPException(
            status_code=400,
            detail="Either room_id or product_id must be provided"
        )
    
    review = Review(
        **review_data.model_dump(),
        user_id=current_user.id
    )
    db.add(review)
    db.commit()
    db.refresh(review)
    return review

@router.put("/{review_id}/approve", response_model=ReviewResponse)
def approve_review(
    review_id: int,
    db: Session = Depends(get_db),
    admin = Depends(get_admin_user)
):
    review = db.query(Review).filter(Review.id == review_id).first()
    if not review:
        raise HTTPException(status_code=404, detail="Review not found")
    
    review.is_approved = True
    db.commit()
    db.refresh(review)
    return review

@router.delete("/{review_id}", status_code=204)
def delete_review(
    review_id: int,
    db: Session = Depends(get_db),
    current_user = Depends(get_current_active_user)
):
    review = db.query(Review).filter(Review.id == review_id).first()
    if not review:
        raise HTTPException(status_code=404, detail="Review not found")
    
    # Check ownership or admin
    if current_user.role != "admin" and review.user_id != current_user.id:
        raise HTTPException(status_code=403, detail="Not authorized")
    
    db.delete(review)
    db.commit()
    return None

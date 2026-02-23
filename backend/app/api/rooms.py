from typing import List, Optional
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from app.core.database import get_db
from app.models import Room
from app.schemas.room import RoomCreate, RoomUpdate, RoomResponse
from app.api.deps import get_admin_user

router = APIRouter(prefix="/rooms", tags=["Rooms"])

@router.get("", response_model=List[RoomResponse])
def get_rooms(
    skip: int = Query(0, ge=0),
    limit: int = Query(100, ge=1, le=100),
    type: Optional[str] = None,
    is_active: bool = True,
    db: Session = Depends(get_db)
):
    query = db.query(Room)
    if type:
        query = query.filter(Room.type == type)
    if is_active is not None:
        query = query.filter(Room.is_active == is_active)
    return query.offset(skip).limit(limit).all()

@router.get("/{room_id}", response_model=RoomResponse)
def get_room(room_id: int, db: Session = Depends(get_db)):
    room = db.query(Room).filter(Room.id == room_id).first()
    if not room:
        raise HTTPException(status_code=404, detail="Room not found")
    return room

@router.post("", response_model=RoomResponse, status_code=201)
def create_room(
    room_data: RoomCreate,
    db: Session = Depends(get_db),
    admin = Depends(get_admin_user)
):
    room = Room(**room_data.model_dump())
    db.add(room)
    db.commit()
    db.refresh(room)
    return room

@router.put("/{room_id}", response_model=RoomResponse)
def update_room(
    room_id: int,
    room_data: RoomUpdate,
    db: Session = Depends(get_db),
    admin = Depends(get_admin_user)
):
    room = db.query(Room).filter(Room.id == room_id).first()
    if not room:
        raise HTTPException(status_code=404, detail="Room not found")
    
    for key, value in room_data.model_dump(exclude_unset=True).items():
        setattr(room, key, value)
    
    db.commit()
    db.refresh(room)
    return room

@router.delete("/{room_id}", status_code=204)
def delete_room(
    room_id: int,
    db: Session = Depends(get_db),
    admin = Depends(get_admin_user)
):
    room = db.query(Room).filter(Room.id == room_id).first()
    if not room:
        raise HTTPException(status_code=404, detail="Room not found")
    
    db.delete(room)
    db.commit()
    return None

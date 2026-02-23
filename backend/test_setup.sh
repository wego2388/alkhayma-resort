#!/bin/bash

echo "🚀 Testing Al Khayma Backend Setup..."

# Check if .env exists
if [ ! -f .env ]; then
    echo "❌ .env file not found"
    exit 1
fi

echo "✅ Environment file exists"

# Check Python version
python_version=$(python3 --version 2>&1)
echo "✅ Python: $python_version"

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
fi

echo "✅ Virtual environment ready"

# Activate and install dependencies
source venv/bin/activate
echo "📦 Installing dependencies..."
pip install -q -r requirements.txt

echo "✅ Dependencies installed"

# Test imports
python3 << EOF
try:
    from app.core.config import settings
    from app.models import User, Room, Product
    from app.schemas import UserResponse, RoomResponse
    print("✅ All imports successful")
except Exception as e:
    print(f"❌ Import error: {e}")
    exit(1)
EOF

echo ""
echo "🎉 Backend setup complete!"
echo "📝 Next steps:"
echo "   1. Start PostgreSQL: docker-compose up -d postgres"
echo "   2. Run migrations: psql -U alkhayma_user -d alkhayma_resort -f ../database/schema.sql"
echo "   3. Seed data: psql -U alkhayma_user -d alkhayma_resort -f ../database/seed.sql"
echo "   4. Start server: uvicorn main:app --reload"

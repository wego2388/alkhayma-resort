#!/bin/bash

echo "🚀 Starting Al Khayma Resort..."
echo ""

# Check if PostgreSQL container is running
if ! docker ps | grep -q alkhayma_db; then
    echo "❌ PostgreSQL container not running!"
    echo "Run: docker ps -a | grep alkhayma_db"
    exit 1
fi

echo "✅ PostgreSQL is running"
echo ""

# Start Backend
echo "🔧 Starting Backend on http://localhost:8000"
cd backend
source venv/bin/activate
uvicorn main:app --host 0.0.0.0 --port 8000 --reload &
BACKEND_PID=$!
cd ..

sleep 3

# Start Frontend
echo "🎨 Starting Frontend on http://localhost:5173"
cd frontend
npm run dev &
FRONTEND_PID=$!
cd ..

echo ""
echo "✅ System is running!"
echo ""
echo "🌐 Access:"
echo "   Frontend:  http://localhost:5173"
echo "   Backend:   http://localhost:8000"
echo "   API Docs:  http://localhost:8000/docs"
echo ""
echo "🔐 Login:"
echo "   admin@alkhayma.com / admin123"
echo ""
echo "Press Ctrl+C to stop all services"
echo ""

# Wait for Ctrl+C
trap "echo ''; echo '🛑 Stopping services...'; kill $BACKEND_PID $FRONTEND_PID 2>/dev/null; exit" INT
wait

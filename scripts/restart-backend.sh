#!/bin/bash

echo "🔄 Restarting Backend..."

# Kill existing uvicorn
pkill -f "uvicorn main:app" 2>/dev/null
sleep 2

# Start backend
cd /home/wego/Desktop/alkhayma-resort-final/backend
source venv/bin/activate
nohup uvicorn main:app --host 0.0.0.0 --port 8000 --reload > /tmp/backend.log 2>&1 &

sleep 3

# Test
if curl -s http://localhost:8000/health | grep -q "healthy"; then
    echo "✅ Backend restarted successfully!"
    echo "📝 Logs: tail -f /tmp/backend.log"
else
    echo "❌ Backend failed to start"
    echo "📝 Check logs: tail -f /tmp/backend.log"
fi

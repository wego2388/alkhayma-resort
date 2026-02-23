#!/bin/bash
cd /home/wego/Desktop/alkhayma-resort-final/backend
source venv/bin/activate
uvicorn main:app --host 0.0.0.0 --port 8000 --reload

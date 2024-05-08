#!/bin/bash

# Debugging purposes
# whoami && arch && uname && cat /etc/*-release && df -h && free -h &&

export DISPLAY=:99

Xvfb $DISPLAY -screen 0 2048x1200x16 -ac &

pip install requests selenium

# Start Xvfb and Multilogin X agent
/opt/mlx/agent.bin &

# Wait for a while so the launcher is properly installed
sleep 20

# Run Python automation script
cd /app/mlx-app && python3 main.py

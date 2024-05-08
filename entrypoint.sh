#!/bin/bash

# Debugging purposes
# whoami && arch && uname && cat /etc/*-release && df -h && free -h &&

pip install requests selenium

# Start Xvfb and Multilogin X agent
xvfb-run /opt/mlx/agent.bin &

# Wait for a while so the launcher is properly installed
sleep 20

# Run Python automation script
cd /app/mlx-app && python3 main.py

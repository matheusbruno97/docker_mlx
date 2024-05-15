#!/bin/bash

pip install --user requests selenium

curl --location --fail --output mlxdeb.deb "https://mlxdists.s3.eu-west-3.amazonaws.com/mlx/1.15.0/multiloginx-amd64.deb" && \
sudo dpkg -i mlxdeb.deb

# Run Python automation script
cd /home/mlx-user/app/ &&

# Start Xvfb and Multilogin X agent
xvfb-run /opt/mlx/agent.bin & sleep 15 && python3 main.py

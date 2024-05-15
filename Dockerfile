FROM ubuntu:22.04 AS base

RUN apt-get update -y && \
apt-get install -y \
xvfb \
dbus-x11 \
libayatana-appindicator3-dev \
libasound2 \
python3 \
python3-pip \
curl && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

FROM base as environment

RUN useradd -m mlx-user && \
    chown -R mlx-user:mlx-user .
RUN mkdir /tmp/.X11-unix
RUN chown root:root /tmp/.X11-unix && \
    chmod 1777 /tmp/.X11-unix

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

FROM environment AS copyfiles

USER mlx-user
WORKDIR /home/mlx-user/app

COPY ./env.py /home/mlx-user/app
COPY ./main.py /home/mlx-user/app
COPY ./mlx_functions.py /home/mlx-user/app

FROM copyfiles AS entrypoint

ENTRYPOINT ["/entrypoint.sh"]

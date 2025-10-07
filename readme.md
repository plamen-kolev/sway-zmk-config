# Podman
podman volume create --driver local -o o=bind -o type=none  -o device="/home/hallagat/Projects/zmk/sway" zmk-config-sway
podman volume create --driver local -o o=bind -o type=none  -o device="/home/hallagat/Projects/modules-zmk/parent/" zmk-modules
podman build -t zmk -f Dockerfile /home/hallagat/Projects/main-zmk/.devcontainer

west build -s /workspaces/zmk/app -d build/left -b nice_nano_v2 $additional -- -DSHIELD=sway_left -DZMK_CONFIG="/workspaces/sway/config"

west build -s /workspaces/zmk/app -d build/left -b nice_nano_v2 $additional -- -DSHIELD=sway_right -DZMK_CONFIG="/workspaces/sway/config"


cp /workspaces/zmk/build/left/zephyr/zmk.uf2 /workspaces/sway/build/left.uf2
cp /workspaces/zmk/build/right/zephyr/zmk.uf2 /workspaces/sway/build/right.uf2


# docker
sudo systemctl --user enable docker.socket
docker volume create --driver local -o o=bind -o type=none -o  device="/home/hallagat/Projects/zmk/sway" zmk-config-sway
docker volume create --driver local -o o=bind -o type=none  -o device="/home/hallagat/Projects/modules-zmk/parent/" zmk-modules


# Requirements
1. Thumb keys should work the same across all layers
2. 
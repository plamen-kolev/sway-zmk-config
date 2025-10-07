# docker run -it --rm --security-opt label=disable --workdir /workspaces/zmk \
#  -v /home/hallagat/Projects/zmk/aurora:/workspaces/aurora \
#  -v /home/hallagat/Projects/zmk/sway:/workspaces/sway \
#  -v /home/hallagat/Projects/main-zmk:/workspaces/zmk  \
#  -v /home/hallagat/Projects/modules-zmk:/workspaces/modules \
#  -p 3000:3000 zmk \
#  /bin/bash -x /workspaces/sway/scripts/build.sh


podman run -it --rm --security-opt label=disable --workdir /workspaces/zmk \
 -v /home/hallagat/Projects/zmk/aurora:/workspaces/aurora \
 -v /home/hallagat/Projects/zmk/sway:/workspaces/sway \
 -v /home/hallagat/Projects/main-zmk:/workspaces/zmk  \
 -v /home/hallagat/Projects/modules-zmk:/workspaces/modules \
 -p 3000:3000 zmk \
 /bin/bash -x /workspaces/sway/scripts/build.sh


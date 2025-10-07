
cd /workspaces/zmk
#;/workspaces/modules/parent/nice-view-gem
#/workspaces/modules/parent/cirque-input-module
# /workspaces/modules/parent/zmk-output-behavior-listener;
# /workspaces/modules/parent/zmk-drv2605-driver;

# ;/workspaces/modules/parent/zmk-drv2605-driver;/workspaces/modules/parent/zmk-output-behavior-listener;
# export modules=-DZMK_EXTRA_MODULES="/workspaces/modules/parent/zmk-keyboard-sway;/workspaces/modules/parent/cirque-input-module"
# export MODULES=-DZMK_EXTRA_MODULES="/workspaces/modules/parent/zmk-keyboard-sway;/workspaces/modules/parent/nice-view-gem;"
export MODULES=-DZMK_EXTRA_MODULES="/workspaces/modules/parent/zmk-keyboard-sway;"
# export MODULES=-DZMK_EXTRA_MODULES="/workspaces/modules/parent/nice-view-gem;"
export ENVIRONMENT=""
export SNIPPETS="--snippet studio-rpc-usb-uart"
# export SNIPPETS="--snippet zmk-usb-logging;studio-rpc-usb-uart"
# export snippets="--snippet zmk-usb-logging"
# export modules=""
# export modules=-DZMK_EXTRA_MODULES="/workspaces/modules/parent/cirque-input-module"

export PRISTINE="-p"
# export PRISTINE=""

export USER_FOLDER="/workspaces/sway"
# export KEYMAP=$USER_FOLDER/config/keymaps/sway.keymap

west build $PRISTINE \
    $SNIPPETS \
    $ENVIRONMENT \
    -s /workspaces/zmk/app \
    -d build/sway/left -b nice_nano_v2 -- \
    -DSHIELD="sway_left nice_view" \
    -DZMK_CONFIG="$USER_FOLDER/config" $MODULES

cp /workspaces/zmk/build/sway/left/zephyr/zmk.uf2 $USER_FOLDER/build/sway-left.uf2


west build $PRISTINE \
    $SNIPPETS \
    $ENVIRONMENT \
    -s /workspaces/zmk/app \
    -d build/sway/right \
    -b nice_nano_v2 -- \
    -DSHIELD="sway_right nice_view" \
    -DZMK_CONFIG="$USER_FOLDER/config" $MODULES

cp /workspaces/zmk/build/sway/right/zephyr/zmk.uf2 $USER_FOLDER/build/sway-right.uf2

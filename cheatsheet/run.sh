CHEATSHEET_DIR=/home/hallagat/Projects/zmk/sway/cheatsheet
ZMK_KEYBOARD_MODULE_DIR=/home/hallagat/Projects/modules-zmk/parent/zmk-keyboard-sway
SWAY_CONFIG_DIR=/home/hallagat/Projects/zmk/sway/config

# inotifywait -q -m -e close_write $ZMK_KEYBOARD_MODULE_DIR |
# while read -r filename event; do

(

	cd /home/hallagat/Projects/keymap-drawer; 
	poetry run keymap --config $CHEATSHEET_DIR/sway.config.yaml parse --columns 20 -z $SWAY_CONFIG_DIR/sway.keymap > $CHEATSHEET_DIR/sway.yaml

	poetry run keymap --config $CHEATSHEET_DIR/sway.config.yaml draw --dts-layout $ZMK_KEYBOARD_MODULE_DIR/boards/shields/sway/sway-layouts.dtsi $CHEATSHEET_DIR/sway.yaml > $CHEATSHEET_DIR/sway.svg
	# poetry run keymap draw --dts-layout $ZMK_KEYBOARD_MODULE_DIR/boards/shields/sway/sway-layouts.dtsi $CHEATSHEET_DIR/sway.yaml > $CHEATSHEET_DIR/sway.svg
	rsvg-convert -f pdf -o $CHEATSHEET_DIR/sway.pdf $CHEATSHEET_DIR/sway.svg 
)


(

	cd /home/hallagat/Projects/keymap-drawer; 
	poetry run keymap --config $CHEATSHEET_DIR/sway.config.yaml parse --columns 20 -z $SWAY_CONFIG_DIR/keymaps/sway-stock.keymap > $CHEATSHEET_DIR/sway-stock.yaml

	poetry run keymap --config $CHEATSHEET_DIR/sway.config.yaml draw --dts-layout $ZMK_KEYBOARD_MODULE_DIR/boards/shields/sway/sway-layouts.dtsi $CHEATSHEET_DIR/sway-stock.yaml > $CHEATSHEET_DIR/sway-stock.svg
	# poetry run keymap draw --dts-layout $ZMK_KEYBOARD_MODULE_DIR/boards/shields/sway/sway-layouts.dtsi $CHEATSHEET_DIR/sway.yaml > $CHEATSHEET_DIR/sway.svg
	rsvg-convert -f pdf -o $CHEATSHEET_DIR/sway-stock.pdf $CHEATSHEET_DIR/sway-stock.svg 
)

# done



# poetry run keymap parse -c 10 -z /home/hallagat/Projects/zmk/sway/config/sway.keymap > /home/hallagat/Projects/zmk/sway/cheatsheet/sway.yaml
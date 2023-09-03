#!/bin/sh
echo "Checking if US intl layout needs the diaeresis fix..."
linenumber="$(grep -n -A 58 -F "xkb_symbols \"intl\" {" /usr/share/X11/xkb/symbols/us | grep -F "key <AC11> { [dead_acute, dead_diaeresis, apostrophe,        quotedbl ] };" | cut -d - -f 1)"
if [ -z "$linenumber" ]
then
	echo "Could not find string in layout file to change it."
else
	echo "Altering /usr/share/X11/xkb/symbols/us (needs superuser)..."
	sudo cp /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us.bak
    if [ $? -eq 0 ]
	then
		echo "Backup file created at /usr/share/X11/xkb/symbols/us.bak"
		sudo sed -i "${linenumber}s/dead_acute, dead_diaeresis, apostrophe,        quotedbl/dead_acute,   quotedbl,    apostrophe,   dead_diaeresis/" /usr/share/X11/xkb/symbols/us
		echo "Intl layout modified."
	else
		echo "Cannot create backup file, layout file remains unaltered."
	fi
fi
echo "Creating $HOME/.XCompose file..."
cp .XCompose $HOME/
echo "Done!"


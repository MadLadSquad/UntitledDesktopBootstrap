#!/bin/sh
if test -z "$DESKTOP_SESSION"; then
	DESKTOP_SESSION="UntitledDesktop"
	export DESKTOP_SESSION
fi

if test -z "$XDG_CURRENT_DESKTOP"; then
	XDG_CURRENT_DESKTOP="UDE"
	export XDG_CURRENT_DESKTOP
fi

xftdir=$(ude-setup-xdg-global)
ude-setup-user-dirs

# Preparing and loading X resources from here
XRESOURCES=""
test -r "$xftdir/Xft.xrdb" && XRESOURCES="$XRESOURCES /etc/xdg/UntitledDesktop/Xft.xrdb"
test -r "$HOME/.Xdefaults" && XRESOURCES="$XRESOURCES $HOME/.Xdefaults"

HOMECONFIGDIR="$XDG_CONFIG_HOME"/UntitledDesktop
test -r "$HOMECONFIGDIR/Xft.xrdb" && XRESOURCES="$XRESOURCES $HOMECONFIGDIR/Xft.xrdb"

# Root cursor settings
test -r "$HOMECONFIGDIR/Xcursor.xrdb" && XRESOURCES="$XREOURCES $HOMECONFIGDIR/Xcursor.xrdb"

# User cursor setting overrides
test -r "$HOME/.Xresources" && XRESOURCES="$XRESOURCES $HOME/.Xresources"

# No idea why we're catting /dev/null and XRESOURCES but it is what it is
cat /dev/null "$XRESOURCES" | xrdb -merge -

# Load modmap
test -r "$HOME"/.Xmodmap && xmodmap "$HOME/.Xmodmap"

# TODO: Start UDE session
exec echo "Session should be started here, but we don't have a session manager right now, so you will only get this message :D"

# If exec fails
exit 1

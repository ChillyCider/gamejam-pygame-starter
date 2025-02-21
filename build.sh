#!/bin/sh

APP_NAME="$1"
TITLE="$2"
UME_BLOCK="$3"
WIDTH="$4"
HEIGHT="$5"
DIR="$6"

if [ "x$APP_NAME" = "x" -o "x$TITLE" = "x" -o "x$UME_BLOCK" = "x" -o "x$WIDTH" = "x" -o "x$HEIGHT" = "x" -o "x$DIR" = "x" ]; then
    echo "usage: $0 APP_NAME TITLE UME_BLOCK WIDTH HEIGHT DIR" >&2
    echo "APP_NAME is used to name the asset pack." >&2
    echo "TITLE is used for the window caption." >&2
    echo "UME_BLOCK should be 0 if you don't want to wait for user to click before starting." >&2
    echo "WIDTH is the game width" >&2
    echo "HEIGHT is the game height" >&2
    echo "DIR is the game directory, which should have a main.py file." >&2
    exit 1
fi

pygbag --app_name "$APP_NAME" --title "$TITLE" --ume_block "$UME_BLOCK" --width "$WIDTH" --height "$HEIGHT" --build "$DIR"
sed -e 's/https:\/\/pygame-web.github.io\/archives\/[0-9\.]*\///' "$DIR/build/web/index.html" > "$DIR/build/web/newindex.html"
mv "$DIR/build/web/newindex.html" "$DIR/build/web/index.html"
cp -r -t "$DIR/build/web" "pygbag-cdnfiles/"*

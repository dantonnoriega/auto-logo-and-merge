#!/bin/bash

BLANK=''

LOGO=$1
PHONE=${2:-$BLANK}
WEBSITE=${3:-$BLANK}

echo "LOGO = $LOGO"
echo "PHONE = $PHONE"
echo "WEBSITE = $WEBSITE"

# phone number
convert -size 1280x100 xc:white -font Arial -pointsize 72 -gravity center \
  -stroke black -annotate 0 "$PHONE" \
  img/phone.png;

# website
convert -size 1280x100 xc:white -font TimesNewRoman -pointsize 72 -gravity center \
  -stroke black -annotate 0 "$WEBSITE" \
  img/website.png;

# convert logo
convert $LOGO -resize 1280x720\> \
  -gravity center -background white -extent 1280x img/logo_resize.png;

# add buffer between logo and text
convert -size 1280x50 xc:none img/buffer.png;

# combine
montage img/logo_resize.png img/buffer.png img/phone.png img/website.png \
  -mode Concatenate -tile 1x4 img/concat.png;

# make it 1920x1080
convert img/concat.png -gravity center -background white -extent 1920x1080 img/logo_static.png

rmtrash img/logo_resize.png img/buffer.png img/phone.png img/website.png img/concat.png;


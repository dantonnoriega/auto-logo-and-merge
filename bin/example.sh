#!/bin/zsh
cd ../img;
rmtrash text*; rmtrash output*; rmtrash input*; rmtrash resize*;

# phone number
convert -size 1280x100 xc:white -font Arial -pointsize 72 -gravity center \
  -stroke black -annotate 0 '949 555 5555' \
  phone.png;

# website
convert -size 1280x100 xc:white -font TimesNewRoman -pointsize 72 -gravity center \
  -stroke black -annotate 0 'www.somewebsite.com' \
  website.png;

convert P1BHs.png -resize 1280x720\> \
  -gravity center -background white -extent 1280x resize_logo.png

# add buffer between logo and text
convert -size 1280x50 xc:none buffer.png

# combine
montage resize_logo.png buffer.png phone.png website.png \
  -mode Concatenate -tile 1x4 concat.png

#!/bin/bash

VIDEO=$1
OUTPUT=$2

echo "VIDEO = $VIDEO"
echo "OUTPUT = $OUTPUT"

# generate static, 10 sec still
# NOTE input are relative but OUTPUTS must have a './'
ffmpeg -y -loop 1 -i ./img/logo_static.png -c:v libx264 \
  -t 10 -pix_fmt yuv420p -vf scale=1280:720 ./mp4/02-logo-static.mp4;

# convert the movie clip
ffmpeg -y -i $VIDEO -c:v libx264 \
  -pix_fmt yuv420p -vf scale=1280:720 ./mp4/01-video-recode.mp4;

# check for file list. remove if exists.
if \[ -f files.txt \];
then
  rmtrash files.txt;
fi

# build the file list
echo "file '$(pwd)/mp4/01-video-recode.mp4'\nfile '$(pwd)/mp4/02-logo-static.mp4'" > 'files.txt'

# merge
ffmpeg -f concat -safe 0 -i $(pwd)/files.txt -c copy $OUTPUT;

rmtrash ./mp4/01-video-recode.mp4 ./mp4/02-logo-static.mp4 ./img/logo_static.png files.txt;

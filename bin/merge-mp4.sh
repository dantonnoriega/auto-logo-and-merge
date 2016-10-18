#!/bin/bash

VIDEO=$1
OUTPUT=$2
AUDIO=$3

echo "VIDEO = $VIDEO"
echo "OUTPUT = $OUTPUT"
echo "AUDIO = $AUDIO"

# generate static, 10 sec still
# NOTE input are relative but OUTPUTS must have a './'
ffmpeg -y -loop 1 -i img/logo_static.png -c:v libx264 \
  -t 10 -pix_fmt yuv420p -vf scale=1920:1080 mp4/02-logo-static.mp4;

# convert the movie clip
ffmpeg -y -i $VIDEO -c:v libx264 \
  -pix_fmt yuv420p -vf scale=1920:1080 mp4/01-video-recode.mp4;

# check for file list. remove if exists.
if \[ -f files.txt \];
then
  rmtrash files.txt;
fi

# build the file list
echo "file 'mp4/01-video-recode.mp4'\nfile 'mp4/02-logo-static.mp4'" > 'files.txt'

# merge
ffmpeg -f concat -safe 0 -i files.txt -c copy mp4/video-noaudio.mp4;

ffmpeg -i mp4/video-noaudio.mp4 -i $AUDIO -c copy -map 0:0 -map 1:0 $OUTPUT;

rmtrash mp4/01-video-recode.mp4 mp4/02-logo-static.mp4 img/logo_static.png mp4/video-noaudio.mp4 files.txt;

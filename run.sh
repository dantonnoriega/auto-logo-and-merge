#!/bin/bash

# run through

# default variables
BLANK=''
OUTPUT_DEFAULT=./mp4/merged.mp4

# global variables
LOGO=$1
VIDEO=$2
AUDIO=$3
OUTPUT=${4:-$OUTPUT_DEFAULT}
PHONE=${5:-$BLANK}
WEBSITE=${6:-$BLANK}

echo "Paramaters:"
echo "LOGO = $LOGO"
echo "VIDEO = $VIDEO"
echo "AUDIO = $AUDIO"
echo "OUTPUT = $OUTPUT"
echo "PHONE = $PHONE"
echo "WEBSITE = $WEBSITE"

sh bin/gen-logo.sh "$LOGO" "$PHONE" "$WEBSITE"
sh bin/merge-mp4.sh "$VIDEO" "$OUTPUT" "$AUDIO"


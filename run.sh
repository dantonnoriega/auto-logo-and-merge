#!/bin/bash

# run through

# default variables
BLANK=''
OUTPUT_DEFAULT=/mp4/merged.mp4

# global variables
LOGO=$1
VIDEO=$2
OUTPUT=${3:-$OUTPUT_DEFAULT}
PHONE=${4:-$BLANK}
WEBSITE=${5:-$BLANK}

echo "Paramaters:"
echo "LOGO = $LOGO"
echo "VIDEO = $VIDEO"
echo "OUTPUT = $OUTPUT"
echo "PHONE = $PHONE"
echo "WEBSITE = $WEBSITE"

sh ./bin/gen-logo.sh $LOGO $PHONE $WEBSITE
sh ./bin/merge-mp4.sh $VIDEO $OUTPUT


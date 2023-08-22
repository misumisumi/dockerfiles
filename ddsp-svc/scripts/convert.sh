#! /usr/bin/env bash
DIR=$1
OUTPUTDIR=$2
MODEL=$3
SPKID=${4:-1}
TONE=${5:-12}
[ ! -d "$OUTPUTDIR" ] && mkdir -p "$OUTPUTDIR"

find "$DIR" -name '*.wav' | while read -r file; do
  python main.py -i "$file" -m "$MODEL" -o "$OUTPUTDIR/$(basename "$file")" -k "$TONE" -id "$SPKID" -eak 0 -d cuda:0
done
# %s/%s.wav|%s/%s.npy|%s/%s.wav.npy|%s/%s.wav.npy|%s
#!/usr/bin/env bash

[ -f filelist.txt ] && rm filelist.txt

touch filelist.txt
speakers=(jvs014 jvs015)
sp_id=0

for sp in ${speakers[@]}; do
  find $sp/0_gt_wavs | sort -R | while read -r line; do
    fname=$(basename $line)
    echo "$PWD/$line|$PWD/$sp/3_feature768/${fname%.*}.npy|$PWD/$sp/2a_f0/${fname}.npy|$PWD/$sp/2b-f0nsf/${fname}.npy|${sp_id}" >>filelist.txt
  done
  sp_id=$((sp_id + 1))
done
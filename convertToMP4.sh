#!/bin/zsh

progname=$0

usage() {
  cat <<EOF
Usage: $progname [-a] [-v] input_file output_file
EOF
  exit 0
}

ffmpeg -i $1 -c:v copy -c:a copy $2

#!/bin/bash

LIBS=""; OBJS=""; OUTPUT_NAME=""; OUTPUT_DIR=""; CURRENT_ARG=""

for i in "$@"; do
  if [[ "$i" == *"--"* ]]; then
    if [[ "$i" != "$CURRENT_ARG" ]]; then CURRENT_ARG=$i; fi; continue
  fi

  if [ "$CURRENT_ARG" == "--src_libs" ]; then LIBS+="$i "; fi
  if [ "$CURRENT_ARG" == "--src_objs" ]; then OBJS+="$i "; fi
  if [ "$CURRENT_ARG" == "--output_name" ]; then OUTPUT_NAME="$i"; fi
  if [ "$CURRENT_ARG" == "--output_dir" ]; then OUTPUT_DIR="$i"; fi
done

OBJS=$(echo "${OBJS}" | xargs)

mkdir -p "$OUTPUT_DIR"

ar -crs "$OUTPUT_DIR/lib$OUTPUT_NAME.a" ${OBJS}

IFS=' ' read -ra SPLIT_LIBS <<< "$LIBS"

if [ "${#SPLIT_LIBS[@]}" -gt 0 ]; then
  for i in "${SPLIT_LIBS[@]}"; do
    (cd "$OUTPUT_DIR" && ar -x "$i")
  done

  ar -q "$OUTPUT_DIR/lib$OUTPUT_NAME.a" "$OUTPUT_DIR"/*.o
fi

find "$OUTPUT_DIR" -type f ! -name '*.a' -delete
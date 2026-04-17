#!/bin/bash

OUTPUT_FILE="Content.tar"
SPLIT_SIZE="20M"

split -b "$SPLIT_SIZE" "$OUTPUT_FILE" "${OUTPUT_FILE}.part"

i=1
for f in "${OUTPUT_FILE}.part"* ; do
    [ -e "$f" ] || continue 
    
    mv "$f" "${OUTPUT_FILE}.part$i"
    echo "Created ${OUTPUT_FILE}.part$i"
    ((i++))
done

echo "Done! Generated $((i-1)) parts."
#!/bin/bash

# Check if an argument (screenshot file path) is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <screenshot_file>"
    exit 1
fi

SCREENSHOT_PATH="$1"
OUTPUT_FILE="ocr_output"

# Perform OCR using Tesseract
tesseract "$SCREENSHOT_PATH" "$OUTPUT_FILE" -l eng

# Check if OCR was successful
if [ $? -eq 0 ]; then
    echo "OCR completed successfully. Output copied to clipboard."
    # Copy OCR output to clipboard
    xclip -selection clipboard "$OUTPUT_FILE.txt"
else
    echo "OCR failed."
fi

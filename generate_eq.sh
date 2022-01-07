#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "usage: ./generate_signature.sh source_name target_name"
    exit 1
fi

AUTOEQ_HOME="$HOME/AutoEq"
SOURCE_NAME="$1"
TARGET_NAME="$2"

SOURCE_DIR="$AUTOEQ_HOME/measurements/oratory1990/data/onear/$SOURCE_NAME"
TARGET_FILE="$AUTOEQ_HOME/results/oratory1990/harman_over-ear_2018/$TARGET_NAME/$TARGET_NAME.csv"
RESULTS_DIR="./results"
OUTPUT_DIR="$RESULTS_DIR/$SOURCE_NAME - $TARGET_NAME"
COMPENSATION_FILE="$AUTOEQ_HOME/compensation/harman_over-ear_2018_wo_bass.csv"

if [ "$SOURCE_NAME" == "$TARGET_NAME" ]; then
    echo "Cannot EQ to same target: '$SOURCE_NAME' to '$TARGET_NAME'"
    exit 1
fi

echo "Generating EQ from '$SOURCE_NAME' to '$TARGET_NAME'"

if [ -d "$OUTPUT_DIR" ] 
then
    echo "Output directory '$OUTPUT_DIR' exists - skipping."
    exit 0
fi

if [ ! -d "$SOURCE_DIR" ] 
then
    echo "Source directory '$SOURCE_DIR' not found."
    exit 1
fi

if [ ! -f "$TARGET_FILE" ] 
then
    echo "Target file '$TARGET_FILE' not found."
    exit 1
fi

mkdir -p $RESULTS_DIR

echo "Activating python virtual environment: '$AUTOEQ_HOME/venv/bin/activate'"
source "$AUTOEQ_HOME/venv/bin/activate"

echo "Running AutoEQ"
python3 "$AUTOEQ_HOME/autoeq.py" \
    --input_dir="$SOURCE_DIR" \
    --output_dir="$OUTPUT_DIR" \
    --compensation="$COMPENSATION_FILE" \
    --sound_signature="$TARGET_FILE" \
    --equalize --parametric_eq --max_filters=5+5 --ten_band_eq --bass_boost=4 --convolution_eq --fs=44100,48000
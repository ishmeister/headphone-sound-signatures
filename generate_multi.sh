#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "usage: ./generate_all.sh sources_file targets_file"
    exit 1
fi

AUTOEQ_HOME="$HOME/AutoEq"
SOURCES_FILE="$1"
TARGETS_FILE="$2"

if [ ! -f "$SOURCES_FILE" ] 
then
    echo "$SOURCES_FILE not found"
    exit 1
fi

if [ ! -f "$TARGETS_FILE" ] 
then
    echo "$TARGETS_FILE not found"
    exit 1
fi

echo "Activating python virtual environment: '$AUTOEQ_HOME/venv/bin/activate'"
source "$AUTOEQ_HOME/venv/bin/activate"

while read source_name; do
    echo "Source: '$source_name'"

    while read target_name; do
        echo "  Target: '$target_name'"
        bash generate_eq.sh "$source_name" "$target_name"
        return_code=$?
        if [ $return_code -ne 0 ]; then
            echo "FAILED: $source_name to $target_name"
        fi
    done <"$TARGETS_FILE"
    
done <"$SOURCES_FILE"
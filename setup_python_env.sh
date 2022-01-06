#!/bin/bash
AUTOEQ_HOME="$HOME/AutoEq"

if [ ! -d "$AUTOEQ_HOME/venv" ] 
then
    echo "Creating python virtual environment"
    python3 -m venv "$AUTOEQ_HOME/venv"
fi

echo "Activating python virtual environment"
source "$AUTOEQ_HOME/venv/bin/activate"

echo "Updating python pip"
python3 -m pip install -U pip

echo "Installing python dependencies"
python3 -m pip install -U -r "$AUTOEQ_HOME/requirements.txt"
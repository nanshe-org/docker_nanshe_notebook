#!/bin/bash


# Place the Jupyter runtime directory in the user's home directory.
export JUPYTER_RUNTIME_DIR="$HOME/.local/share/jupyter/runtime"


exec "$@"

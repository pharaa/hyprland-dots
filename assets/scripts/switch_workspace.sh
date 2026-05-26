#!/usr/bin/bash
set -euo pipefail

NUM="$1"
hyprctl dispatch "hl.dsp.focus({ workspace = $NUM })"
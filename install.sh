#!/usr/bin/env bash
#
# Install Copilot CLI skills into the skills directory.
#
# Usage:
#   ./install.sh [--force] [skill ...]
#
# With no skill names, installs every skill in this repo. Name one or more
# skills (e.g. "writing-coach classic-style") to install only those.
#
# Options:
#   --force              Overwrite existing installed copies
#   -h, --help           Show this help
#
# Environment:
#   COPILOT_SKILLS_DIR   Override the target skills directory
#                        (default: ~/.copilot/skills)
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="${COPILOT_SKILLS_DIR:-$HOME/.copilot/skills}"

# A directory is a skill if it contains a SKILL.md.
ALL_SKILLS=()
for d in "$SCRIPT_DIR"/*/; do
  [ -f "${d}SKILL.md" ] && ALL_SKILLS+=("$(basename "$d")")
done

FORCE=0
REQUESTED=()
for arg in "$@"; do
  case "$arg" in
    --force) FORCE=1 ;;
    -h|--help)
      grep '^#' "$0" | sed 's/^#\s\?//'
      exit 0
      ;;
    -*)
      echo "Unknown option: $arg" >&2
      exit 2
      ;;
    *) REQUESTED+=("$arg") ;;
  esac
done

# Default to all skills when none named.
if [ "${#REQUESTED[@]}" -eq 0 ]; then
  REQUESTED=("${ALL_SKILLS[@]}")
fi

mkdir -p "$SKILLS_DIR"

installed=0
for skill in "${REQUESTED[@]}"; do
  src="$SCRIPT_DIR/$skill"
  dest="$SKILLS_DIR/$skill"
  if [ ! -f "$src/SKILL.md" ]; then
    echo "Skip '$skill': no SKILL.md found (not a skill in this repo)." >&2
    continue
  fi
  if [ -e "$dest" ] && [ "$FORCE" -ne 1 ]; then
    echo "Skip '$skill': $dest already exists. Re-run with --force to overwrite." >&2
    continue
  fi
  rm -rf "$dest"
  cp -R "$src" "$dest"
  echo "Installed '$skill' to $dest"
  installed=$((installed + 1))
done

if [ "$installed" -gt 0 ]; then
  echo "Restart Copilot CLI to load the skill(s)."
fi

#!/bin/bash
# Switch the dashboard theme: ./switch.sh <theme> | default
# Sets the colours (custom.css imports assets/<theme>.css) and, when presets/<theme>.json exists,
# the logo and activity pictures (branding.json). Refresh the dashboard afterwards.
set -euo pipefail
cd "$(dirname "$0")"
theme="${1:-}"
if [ "$theme" = "default" ]; then
  : > custom.css
  rm -f branding.json
elif [ -n "$theme" ] && [ -f "assets/$theme.css" ]; then
  printf '@import url("assets/%s.css");\n' "$theme" > custom.css
  if [ -f "presets/$theme.json" ]; then cp "presets/$theme.json" branding.json; else rm -f branding.json; fi
else
  echo "Usage: $0 <theme> | default" >&2
  echo "Themes: $(ls assets/*.css 2>/dev/null | xargs -n1 basename | sed 's/\.css$//' | grep -v '^base$' | tr '\n' ' ')" >&2
  exit 1
fi
echo "Theme set to $theme. Refresh the dashboard."

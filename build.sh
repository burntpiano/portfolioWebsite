#!/usr/bin/env bash

#This script is just for dynamically updating the static sites when a change is made
#Updating by hand would be a chore

set -euo pipefail

BODY_DIR='body'
PARTIALS_DIR='partials'
DIST_DIR='dist'
ROOT_DIR='.'

mkdir -p "$DIST_DIR"

for page in "$BODY_DIR"/*.html; do
  pageName=$(basename "$page")
  if [[ "$pageName" == "index.html" ]]; then
    outPath="$ROOT_DIR/$pageName"
    else
    outPath="$DIST_DIR/$pageName"
  fi
  sed "/{{NAV}}/{
  r $PARTIALS_DIR/nav.html
  d
  }" "$page" > "$outPath"
  echo "Successfully built $outPath"
done

#!/usr/bin/env bash

#This script is just for dynamically updating the static sites when a change is made
#Updating by hand would be a chore

set -euo pipefail

STAGING_DIR='staging'
PARTIALS_DIR='partials'
BODY_DIR='body'
ROOT_DIR='.'

mkdir -p "$BODY_DIR"

for page in "$STAGING_DIR"/*.html; do
  pageName=$(basename "$page")
  if [[ "$pageName" == "index.html" ]]; then
    outPath="$ROOT_DIR/$pageName"
    else
    outPath="$BODY_DIR/$pageName"
  fi
  sed "/{{NAV}}/{
  r $PARTIALS_DIR/nav.html
  d
  }" "$page" > "$outPath"
  echo "Successfully built $outPath"
done

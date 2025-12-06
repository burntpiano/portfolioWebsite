#!/usr/bin/env bash

#This script is just for dynamically updating the static sites when a change is made
#Updating by hand would be a chore

set -euo pipefail

BODY_DIR='body'
PARTIALS_DIR='partials'
DIST_DIR='dist'

mkdir -p "$DIST_DIR"

NAV_CONTENT=$(<"$PARTIALS_DIR/nav.html")

for page in "$BODY_DIR"/*.html; do
  pageName=$("basename $page")
  sed "s|{{NAV}}|$NAV_CONTENT|" "$page" > "$DIST_DIR/$pageName"
  echo "Successfully built $DIST_DIR/$pageName"
done


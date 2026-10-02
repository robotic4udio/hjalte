#!/bin/bash
# Makes web-sized copies of every project's and blog post's image:
#   images/thumbs/<file-name>.jpg       for cards (1000 px)
#   images/thumbs/<file-name>-hero.jpg  for the top of its own page (1800 px)
# The site uses them when they exist and the original image otherwise, so run this after
# adding a project or post, or after changing its "image:". Existing copies are kept;
# pass --force to make them all again. Uses sips (macOS).

set -euo pipefail
cd "$(dirname "$0")/.."

force=0
[ "${1:-}" = "--force" ] && force=1

mkdir -p images/thumbs

for file in _projects/*.md _posts/*.md _drafts/*.md; do
    [ -f "$file" ] || continue

    name=$(basename "$file" .md)
    # Posts are named YYYY-MM-DD-title.md: drop the date
    name=$(echo "$name" | sed -E 's/^[0-9]{4}-[0-9]{2}-[0-9]{2}-//')

    image=$(sed -n '/^---$/,/^---$/p' "$file" | grep -m1 '^image:' | sed -E "s/^image:[[:space:]]*//; s/^['\"]//; s/['\"][[:space:]]*$//" || true)
    [ -n "$image" ] || continue

    source=".$image"
    if [ ! -f "$source" ]; then
        echo "missing: $source (from $file)" >&2
        continue
    fi

    card="images/thumbs/$name.jpg"
    hero="images/thumbs/$name-hero.jpg"

    if [ $force = 1 ] || [ ! -f "$card" ] || [ "$source" -nt "$card" ]; then
        sips -s format jpeg -s formatOptions 78 -Z 1000 "$source" --out "$card" > /dev/null
        echo "made $card"
    fi
    if [ $force = 1 ] || [ ! -f "$hero" ] || [ "$source" -nt "$hero" ]; then
        sips -s format jpeg -s formatOptions 76 -Z 1800 "$source" --out "$hero" > /dev/null
        echo "made $hero"
    fi
done

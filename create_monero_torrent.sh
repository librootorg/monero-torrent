#!/bin/bash

#todo the this:-or_this trick
OUTPUT_DIR="downloads"
TORRENT_DIR="watch"

# afaict the only important thing for hash determinism is piece size
PIECE_SIZE=512

mkdir -p "$OUTPUT_DIR"
mkdir -p "$TORRENT_DIR"

# reinvent the wheel and download/verify binaries
curl -sL https://www.getmonero.org/downloads/hashes.txt -o "$OUTPUT_DIR/hashes.txt"
curl -sL https://raw.githubusercontent.com/monero-project/monero/master/utils/gpg_keys/binaryfate.asc -o "$OUTPUT_DIR/binaryfate.asc"
gpg --import "$OUTPUT_DIR/binaryfate.asc"
gpg --verify "$OUTPUT_DIR/hashes.txt"

version=$(awk '/monero-source-v/ {print $2}' "$OUTPUT_DIR/hashes.txt" | awk -F".tar.bz2" '{print $1}' | awk -F"-" '{print $3}')
torrent="Monero-project-torrent-$version"

mkdir -p "$OUTPUT_DIR/$torrent"

mv "$OUTPUT_DIR/hashes.txt" "$OUTPUT_DIR/$torrent/"
mv "$OUTPUT_DIR/binaryfate.asc" "$OUTPUT_DIR/$torrent/"

for file in $(awk '/monero-/ {print $2}' "$OUTPUT_DIR/$torrent/hashes.txt"); do
  # dont re-download if exists
  [ -f "$OUTPUT_DIR/$torrent/$file" ] && continue
  echo "Downloading $file..."
  dir=cli
  if [[ $file =~ gui ]]; then
      dir=gui
  fi
  url=https://dlsrc.getmonero.org/${dir}/${file}
  curl -sLO --output-dir "$OUTPUT_DIR/$torrent" "$url"
done

cd "$OUTPUT_DIR/$torrent"

grep 'monero-' hashes.txt | sha256sum -c || {
  echo "One or more hashes failed"
  exit 1
}

cd ../..

#transmission-create -s "$PIECE_SIZE" -o "$TORRENT_DIR/$torrent.torrent" --anonymize "$OUTPUT_DIR/$torrent"
# prints the magnet link
#transmission-show -m "$TORRENT_DIR/$torrent.torrent"

#transmission-show "$TORRENT_DIR/$torrent.torrent"

py3createtorrent -p 512 -o watch/ -c "Multi file torrent for the Monero project" -v $OUTPUT_DIR/$torrent

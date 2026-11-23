#!/usr/bin/env bash
# Download the images and PDFs from the old WordPress site into this repo.
# Run once from the repo root, while paolobecciu.com still points at WordPress:
#   bash bin/fetch-wordpress-media.sh
# Deliberately NOT downloaded:
#   - the 2026 CV PDF (it lists referees' email addresses; export a new cv.pdf instead)
#   - the two Springer publisher PDFs from 2018 (publisher copyright)
#   - the "Human stuff" gallery (identifiable children)
set -euo pipefail

BASE="https://paolobecciu.com/wp-content/uploads"
cd "$(dirname "$0")/.."

get() { # get <remote path under uploads/> <local destination>
  local src="$BASE/$1" dest="$2"
  if [[ -s "$dest" ]]; then echo "skip  $dest (exists)"; return; fi
  mkdir -p "$(dirname "$dest")"
  if curl -fsSL --retry 2 -o "$dest" "$src"; then echo "ok    $dest"; else echo "FAIL  $src"; rm -f "$dest"; fi
}

# Site images (the home portrait, assets/img/prof_pic.jpg, is never downloaded or replaced here)
get 2024/01/paolo_bermuda-1.jpg                           assets/img/research/paolo_bermuda.jpg
get 2020/08/buzzardsa-2.jpg                                assets/img/research/buzzard_sa.jpg
get 2018/06/cropped-cormorants15.jpg                       assets/img/research/cormorants.jpg
get 2026/07/currbiol_cover_barn_owl.jpg                    assets/img/publication_preview/currbiol_cover_barn_owl.jpg

# Own conference paper
get 2019/03/becciu_et_al-2012_conf-paper_proceedingsmedmaravis.pdf  assets/pdf/becciu2012_medmaravis.pdf

# Photography (names must match _data/photos.yml)
for f in 2018/08/penguin2.jpg 2023/12/gulls-2.jpg 2018/08/spoonbills.jpg 2018/08/terns-3.jpg \
         2018/08/stilt2.jpg 2023/12/kea-3.jpg 2018/08/king.jpg 2018/08/penguin1.jpg \
         2018/08/blackstart.jpg 2018/08/bluethroat.jpg 2023/12/kea-10.jpg \
         2018/08/salamander.jpg 2023/12/sealion_pups-1.jpg 2018/08/gazel-1.jpg \
         2018/08/flowers.jpg 2018/08/proteaking.jpg \
         2018/11/autumn-cz-1.jpg 2018/11/autumn-cz-2.jpg 2018/08/wildsa.jpg; do
  get "$f" "assets/img/photos/$(basename "$f")"
done

echo
echo "Done. Large originals (e.g. wildsa.jpg, 3797x5654) can be resized before committing:"
echo "  mogrify -resize '2400x2400>' assets/img/photos/*.jpg"

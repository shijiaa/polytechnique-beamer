#!/bin/sh
cd "$(readlink -m "$0/../../")" # chdir to the root directory of the package archive

TEXMFLOCAL="$(kpsewhich -var-value TEXMFLOCAL)"
PACKAGE="$TEXMFLOCAL/tex/latex/beamerx/"
FONTS="$TEXMFLOCAL/fonts/truetype/"
PERMS="Dg+s,ug+w,o-w,+X"
mkdir -p "$PACKAGE" "$FONTS"
rsync --recursive --exclude-from=install/.exclude --delete-excluded --chmod=$PERMS source/ $PACKAGE/
rsync --recursive --update --chmod=$PERMS fonts/ $FONTS/
texhash || mktexlsr
#!/usr/bin/env bash
# Rommayo: pinned, checksum-verified installer. Source: https://github.com/quentinmayo/Rommayo/blob/0be79241008ecb44c28f632fa0099b55f6f04a16/scripts/install.sh
set -euo pipefail
work=$(mktemp -d)
trap 'rm -rf -- "$work"' EXIT
curl --fail --location --silent --show-error --retry 2 --connect-timeout 15 --max-time 60 'https://raw.githubusercontent.com/quentinmayo/Rommayo/0be79241008ecb44c28f632fa0099b55f6f04a16/scripts/install.sh' -o "$work/install.sh"
if command -v sha256sum >/dev/null; then digest=$(sha256sum "$work/install.sh"); else digest=$(shasum -a 256 "$work/install.sh"); fi
if [ "${digest%% *}" != '3356effbdf79738ad091dae8413dbe774c68b24ca32d70599177a88850b8ff58' ]; then printf 'Installer checksum mismatch. Nothing was installed.\n' >&2; exit 1; fi
bash "$work/install.sh" "$@"

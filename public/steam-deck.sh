#!/usr/bin/env bash
# Rommayo: pinned, checksum-verified installer. Source: https://github.com/quentinmayo/Rommayo/blob/1780eda1e114ac48868860082dbe720e67a81cf2/scripts/install.sh
set -euo pipefail
work=$(mktemp -d)
trap 'rm -rf -- "$work"' EXIT
curl --fail --location --silent --show-error --retry 2 --connect-timeout 15 --max-time 60 'https://raw.githubusercontent.com/quentinmayo/Rommayo/1780eda1e114ac48868860082dbe720e67a81cf2/scripts/install.sh' -o "$work/install.sh"
if command -v sha256sum >/dev/null; then digest=$(sha256sum "$work/install.sh"); else digest=$(shasum -a 256 "$work/install.sh"); fi
if [ "${digest%% *}" != '246ac1e7308b4a36749f43c5f71252c1e8b278a4fe886aba146dba74bfc1ba7e' ]; then printf 'Installer checksum mismatch. Nothing was installed.\n' >&2; exit 1; fi
bash "$work/install.sh" --steam-deck "$@"

#!/usr/bin/env bash
# Rommayo: pinned, checksum-verified installer. Source: https://github.com/quentinmayo/Rommayo/blob/074365f4bcc935930bbcf44c34907f678585dd5e/scripts/install.sh
set -euo pipefail
work=$(mktemp -d)
trap 'rm -rf -- "$work"' EXIT
curl --fail --location --silent --show-error --retry 2 --connect-timeout 15 --max-time 60 'https://raw.githubusercontent.com/quentinmayo/Rommayo/074365f4bcc935930bbcf44c34907f678585dd5e/scripts/install.sh' -o "$work/install.sh"
if command -v sha256sum >/dev/null; then digest=$(sha256sum "$work/install.sh"); else digest=$(shasum -a 256 "$work/install.sh"); fi
if [ "${digest%% *}" != 'd3a8d5033c5c60686d0af84629a10ed6ce271fa3d3005b2420842b8d87ea66b4' ]; then printf 'Installer checksum mismatch. Nothing was installed.\n' >&2; exit 1; fi
bash "$work/install.sh" "$@"

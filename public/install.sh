#!/usr/bin/env bash
# Rommayo: pinned, checksum-verified installer. Source: https://github.com/quentinmayo/Rommayo/blob/db4577ca5a9ef61ede5a99cf0b62f7aec6c90450/scripts/install.sh
set -euo pipefail
work=$(mktemp -d)
trap 'rm -rf -- "$work"' EXIT
curl --fail --location --silent --show-error --retry 2 --connect-timeout 15 --max-time 60 'https://raw.githubusercontent.com/quentinmayo/Rommayo/db4577ca5a9ef61ede5a99cf0b62f7aec6c90450/scripts/install.sh' -o "$work/install.sh"
if command -v sha256sum >/dev/null; then digest=$(sha256sum "$work/install.sh"); else digest=$(shasum -a 256 "$work/install.sh"); fi
if [ "${digest%% *}" != '6838d2a7aad5c69c5b4812afb2d5ef8130f0e52c00773caac3b2690bef4cc8fd' ]; then printf 'Installer checksum mismatch. Nothing was installed.\n' >&2; exit 1; fi
bash "$work/install.sh" "$@"

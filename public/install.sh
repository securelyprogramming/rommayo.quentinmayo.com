#!/usr/bin/env bash
# Rommayo: pinned, checksum-verified installer. Source: https://github.com/quentinmayo/Rommayo/blob/edd2489e6da5ad7e91cf5e78239dbc87767b6ba0/scripts/install.sh
set -euo pipefail
work=$(mktemp -d)
trap 'rm -rf -- "$work"' EXIT
curl --fail --location --silent --show-error --retry 2 --connect-timeout 15 --max-time 60 'https://raw.githubusercontent.com/quentinmayo/Rommayo/edd2489e6da5ad7e91cf5e78239dbc87767b6ba0/scripts/install.sh' -o "$work/install.sh"
if command -v sha256sum >/dev/null; then digest=$(sha256sum "$work/install.sh"); else digest=$(shasum -a 256 "$work/install.sh"); fi
if [ "${digest%% *}" != '16e8f887f69f7b8bb25a330ef901d661fce5b72e19002b0276a985add4dd0a3a' ]; then printf 'Installer checksum mismatch. Nothing was installed.\n' >&2; exit 1; fi
bash "$work/install.sh" "$@"

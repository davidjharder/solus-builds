#!/bin/bash
#
# Some of this is shamelessly copied from ermo's work on Serpent Onboarding: https://github.com/serpent-os/onboarding

# Help messgage
if [[ -n "${1}" ]]; then
    cat << EOF

Usage: onboard-me.sh

Set up solus things:
- Install system.devel, since it can't be a rundep
- Initialize solbuild
- Clone common
- Create Makefile symlinks

Run this script from the root of you packaging directory

EOF
    exit 0
fi

# Prerequisites that cannot be behandled by the package manager
sudo eopkg install --component system.devel

# Initialize Setup
sudo solbuild init

# Clone common
git clone https://dev.getsol.us/source/common.git

# Create Makefile symlinks
ln -sv common/Makefile.common .
ln -sv common/Makefile.toplevel Makefile
ln -sv common/Makefile.iso .


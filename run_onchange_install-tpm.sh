#!/bin/sh
# Re-runs if this file changes — ensures tpm is cloned
TPM_DIR="$HOME/.tmux/plugins/tpm"
[ -d "$TPM_DIR" ] || git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"

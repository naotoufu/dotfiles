#!/usr/bin/env bash
set -euo pipefail

# macOS bootstrap for Rust-based CLI replacements (via Homebrew)
# Installs: eza, fd, rg, bat, sd, du/dust, df/duf, ps procs, top bottom, ping gping,
# traceroute trippy, curl xh, httpie (Rustではないが便利), etc.
#
# Usage:
#   chmod +x bootstrap.sh
#   ./bootstrap.sh
#
# Optional:
#   WITH_ALIASES=1 ./bootstrap.sh   # append useful aliases to your shell rc

WITH_ALIASES="${WITH_ALIASES:-0}"

log() { printf "\033[1;32m[bootstrap]\033[0m %s\n" "$*"; }
warn() { printf "\033[1;33m[warn]\033[0m %s\n" "$*"; }
die() { printf "\033[1;31m[error]\033[0m %s\n" "$*" >&2; exit 1; }

command -v sw_vers >/dev/null 2>&1 || die "This script is for macOS."
log "macOS detected: $(sw_vers -productVersion)"

# Install Homebrew if missing
if ! command -v brew >/dev/null 2>&1; then
  log "Homebrew not found. Installing..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # shellcheck disable=SC2016
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

command -v brew >/dev/null 2>&1 || die "brew is not available after installation."
log "Homebrew OK: $(brew --version | head -n 1)"

log "Updating brew..."
brew update

# Core Rust-based replacements
FORMULAE=(
  # ls -> eza
  eza
  # find -> fd
  fd
  # grep -> ripgrep (rg)
  ripgrep
  # cat -> bat
  bat
  # sed -> sd
  sd
  # du -> dust
  dust
  # df -> duf
  duf
  # ps -> procs
  procs
  # top/htop -> bottom (btm)
  bottom
  # ping -> gping (pretty ping)
  gping
  # traceroute -> trippy (trip)
  trippy
  # curl -> xh (http client)
  xh
  # ls/dir tree -> broot (interactive nav)
  broot
  # rm -> rip (safe-ish rm; still be careful)
  rip
  # hexdump -> hexyl
  hexyl
  # strings/grep logs -> tailspin (tspin)
  tailspin
)

# Helpful (not necessarily Rust, but common in the same "modern CLI" toolbox)
EXTRA_FORMULAE=(
  git
  zsh-completions
  fzf
  jq
  yq
)

install_formula() {
  local f="$1"
  if brew list --formula "$f" >/dev/null 2>&1; then
    log "Already installed: $f"
  else
    log "Installing: $f"
    brew install "$f"
  fi
}

log "Installing Rust-based CLI replacements..."
for f in "${FORMULAE[@]}"; do
  install_formula "$f"
done

log "Installing extra useful tools..."
for f in "${EXTRA_FORMULAE[@]}"; do
  install_formula "$f"
done

# Optional aliases
append_aliases() {
  local rc="$1"
  [ -f "$rc" ] || touch "$rc"

  # Avoid duplicating blocks
  if grep -q "BEGIN rust-cli-aliases" "$rc"; then
    log "Aliases block already present in $rc (skipping)"
    return
  fi

  log "Appending aliases to $rc"
  cat >>"$rc" <<'EOF'

# BEGIN rust-cli-aliases
# eza (ls replacement)
alias ls='eza'
alias ll='eza -lh --git'
alias la='eza -lah --git'
alias lt='eza --tree --level=2'

# fd (find replacement)
alias f='fd'

# ripgrep
alias rg='rg --smart-case'

# bat (cat replacement) - keep cat as-is if you prefer
alias cat='bat'

# sd (sed replacement) - syntax: sd 'from' 'to' <files>
alias sdr='sd'

# bottom
alias top='btm'

# duf (df replacement)
alias df='duf'

# dust (du replacement)
alias du='dust'

# procs (ps replacement)
alias ps='procs'

# xh (curl-like HTTP)
alias http='xh'
# END rust-cli-aliases
EOF
}

if [ "$WITH_ALIASES" = "1" ]; then
  # Decide shell rc
  if [ -n "${ZSH_VERSION:-}" ] || [ "${SHELL:-}" = "/bin/zsh" ] || [ "${SHELL:-}" = "/usr/bin/zsh" ]; then
    append_aliases "$HOME/.zshrc"
    warn "Restart your shell or run: source ~/.zshrc"
  else
    append_aliases "$HOME/.bashrc"
    warn "Restart your shell or run: source ~/.bashrc"
  fi
else
  log "Skipping aliases (set WITH_ALIASES=1 to enable)."
fi

log "Done."
log "Installed commands (try): eza, fd, rg, bat, sd, dust, duf, procs, btm, gping, trip, xh, broot"

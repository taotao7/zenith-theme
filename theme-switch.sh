#!/usr/bin/env bash
# Unified Theme Switcher — switch between zenith and cassette-futurism
# Usage: ./theme-switch.sh [zenith|cassette|toggle] [dark|light|toggle]
#   First arg: theme name (defaults to toggle between themes)
#   Second arg: color mode (defaults to toggle)
#
# State files:
#   ~/.tmux/theme_state  — "dark" or "light"
#   ~/.tmux/theme_name   — "zenith" or "cassette-futurism"
set -euo pipefail

TMUX_STATE="$HOME/.tmux/theme_state"
THEME_NAME_STATE="$HOME/.tmux/theme_name"

current_mode() {
  cat "$TMUX_STATE" 2>/dev/null || echo "dark"
}

current_theme() {
  cat "$THEME_NAME_STATE" 2>/dev/null || echo "zenith"
}

# Parse theme arg
THEME="${1:-toggle}"
if [ "$THEME" = "toggle" ]; then
  [ "$(current_theme)" = "zenith" ] && THEME="cassette-futurism" || THEME="zenith"
elif [ "$THEME" = "cassette" ]; then
  THEME="cassette-futurism"
fi

if [ "$THEME" != "zenith" ] && [ "$THEME" != "cassette-futurism" ]; then
  echo "Usage: $0 [zenith|cassette|toggle] [dark|light|toggle]"
  echo "  Theme: zenith, cassette (cassette-futurism), toggle"
  echo "  Mode:  dark, light, toggle"
  exit 1
fi

# Parse mode arg
MODE="${2:-toggle}"
if [ "$MODE" = "toggle" ]; then
  [ "$(current_mode)" = "dark" ] && MODE="light" || MODE="dark"
fi

if [ "$MODE" != "dark" ] && [ "$MODE" != "light" ]; then
  echo "Usage: $0 [zenith|cassette|toggle] [dark|light|toggle]"
  exit 1
fi

mkdir -p "$(dirname "$TMUX_STATE")"
echo "$MODE" > "$TMUX_STATE"
echo "$THEME" > "$THEME_NAME_STATE"

echo "Switching to: $THEME ($MODE)"

# ── Ghostty ──
GHOSTTY_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ghostty/config"
if [ -f "$GHOSTTY_CONFIG" ]; then
  sed -i '' "s/^theme = .*/theme = dark:${THEME}-dark,light:${THEME}-light/" "$GHOSTTY_CONFIG" 2>/dev/null || true
  echo "  ✓ Ghostty → ${THEME}-${MODE}"
fi

# ── Tmux ──
if command -v tmux &>/dev/null && tmux list-sessions &>/dev/null; then
  tmux source-file "$HOME/.tmux.conf" 2>/dev/null || true
  if [ "$THEME" = "zenith" ]; then
    [ "$MODE" = "dark" ] && tmux display-message " 🌙 ZENITH DARK" || tmux display-message " ☀️  ZENITH LIGHT"
  else
    [ "$MODE" = "dark" ] && tmux display-message " 📼 CASSETTE DARK" || tmux display-message " 📻 CASSETTE LIGHT"
  fi
  echo "  ✓ Tmux → ${THEME}-${MODE}"
fi

# ── Neovim (all running instances) ──
if [ "$THEME" = "zenith" ]; then
  NVIM_CMD="set background=$MODE | colorscheme zenith"
else
  NVIM_CMD="set background=$MODE | colorscheme cassette-futurism"
fi

for sock in /tmp/nvim.*/0 "${XDG_RUNTIME_DIR:-/tmp}"/nvim.*/0; do
  [ -S "$sock" ] 2>/dev/null || continue
  nvim --server "$sock" --remote-send "<Cmd>${NVIM_CMD}<CR>" 2>/dev/null || true
done
echo "  ✓ Neovim → ${THEME} background=$MODE"

echo "Done! Now using $THEME in $MODE mode."

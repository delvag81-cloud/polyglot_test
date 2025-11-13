#!/usr/bin/env bash
set -e

BASE_URL="https://example.com/dist"
for arg in "$@"; do
  case $arg in
    --base-url=*)
      BASE_URL="${arg#*=}"
      ;;
  esac
done

ask() {
  read -p "$1 [y/N]: " ans
  case "$ans" in
    y|Y|yes|YES) return 0 ;;
    *) return 1 ;;
  esac
}

echo "=== macOS polyglot installer ==="
echo "Base URL: $BASE_URL"

if ! command -v brew &>/dev/null; then
  if ask "Homebrew не найден. Установить?"; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
fi

if ask "Установить Python?"; then brew install python; fi
if ask "Установить Node.js?"; then brew install node; fi
if ask "Установить PHP?"; then brew install php; fi
if ask "Установить Temurin JDK?"; then brew install temurin; fi
if ask "Установить Ruby?"; then brew install ruby; fi

if ask "Установить Rust?"; then
  if ! command -v rustc &>/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf "$BASE_URL/rustup-init.sh" -o rustup-init.sh
    chmod +x rustup-init.sh
    ./rustup-init.sh -y
    rm rustup-init.sh
  fi
fi

if ask "Установить Go?"; then brew install go; fi

echo "Готово."
echo "Версии окружения (если установлены):"
python3 --version || true
node -v || true
php -v || true
java -version || true
ruby -v || true
rustc -V || true
go version || true
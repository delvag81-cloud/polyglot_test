#!/usr/bin/env bash
set -euo pipefail

LANG_NAME="$1"       # имя языка (python, node и т.п.)
RESULT_FILE="$2"     # путь к result.txt
STATUS_FILE="$3"     # путь к status.txt
OUT_FILE="$4"        # выходной json

python3 - "$LANG_NAME" "$RESULT_FILE" "$STATUS_FILE" "$OUT_FILE" << 'PY'
import json
import sys
from pathlib import Path

lang, result_path, status_path, out_path = sys.argv[1:5]

text = Path(result_path).read_text(encoding="utf-8", errors="replace")
status = Path(status_path).read_text(encoding="utf-8", errors="replace").strip()

data = {
    "language": lang,
    "status": status,
    "output": text,
}

Path(out_path).write_text(json.dumps(data, ensure_ascii=False), encoding="utf-8")
PY
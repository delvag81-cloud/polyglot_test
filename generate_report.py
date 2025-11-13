import glob
import html
import json
from pathlib import Path


TEMPLATE = Path("report_template.html").read_text(encoding="utf-8")

logos = {
    "python": "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/python.svg",
    "node": "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/nodedotjs.svg",
    "php": "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/php.svg",
    "java": "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/coffeescript.svg",
    "ruby": "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/ruby.svg",
    "rust": "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/rust.svg",
    "go": "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/go.svg",
}

blocks: list[str] = []

for f in glob.glob("reports/*/*.json"):
    data = json.loads(Path(f).read_text(encoding="utf-8"))
    lang = data["language"]
    status = data["status"]
    output = data["output"]

    css = "ok" if status == "OK" else "fail"
    logo = logos.get(lang, "")
    output_html = html.escape(output)

    block = f"""
<div class="card">
  <div class="header">
    <img src="{logo}" />
    <div class="lang-name">{lang.upper()}</div>
  </div>
  <div class="{css}">{status}</div>
  <pre>{output_html}</pre>
</div>
"""
    blocks.append(block)

final_html = TEMPLATE.replace("<!-- RESULTS_INSERT_HERE -->", "\n".join(blocks))
Path("report.html").write_text(final_html, encoding="utf-8")

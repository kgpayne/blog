
html:
	poetry run sphinx-build -b html . _build/html

serve:
	python -m http.server --bind 127.0.0.1 8000 -d _build/html
.PHONY: setup run-notebook lint

setup:
	python -m venv .venv && . .venv/bin/activate && pip install -r requirements.txt

run-notebook:
	jupyter nbconvert --to notebook --execute BankEDA.ipynb --output executed_BankEDA.ipynb

lint:
	flake8 src || true

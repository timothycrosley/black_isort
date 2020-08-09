#!/bin/bash
set -euxo pipefail

poetry run cruft check
poetry run mypy --ignore-missing-imports black_isort/
poetry run isort --multi-line=3 --trailing-comma --force-grid-wrap=0 --use-parentheses --line-width=100 --check --diff --recursive black_isort/ tests/
poetry run black --check -l 100 black_isort/ tests/
poetry run flake8 black_isort/ tests/ --max-line 100 --ignore F403,F401,W503,E203
poetry run safety check
poetry run bandit -r black_isort/

#!/bin/bash
set -euxo pipefail

poetry run isort --multi-line=3 --trailing-comma --force-grid-wrap=0 --use-parentheses --line-width=100 black_isort/ tests/
poetry run black black_isort/ tests/ -l 100

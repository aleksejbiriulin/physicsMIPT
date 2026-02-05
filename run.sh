#!/bin/bash
# run.sh: Установка зависимостей и запуск файлов M2/main.py, M5/main.ipynb, M7/main.py
# Библиотеки: numpy, matplotlib, pandas, scipy (из импортов)
# Для Ubuntu/Linux (MIPT-style). Сохрани как run.sh, chmod +x run.sh, ./run.sh

set -e  # Остановка при ошибке

echo "🔧 Создание виртуального окружения..."
python3 -m venv .venv
source .venv/bin/activate

echo "📦 Установка библиотек..."
pip install --upgrade pip
pip install numpy matplotlib pandas scipy jupyter ipykernel

echo "🚀 Запуск M2/main.py..."
python M2_main.py

echo "📓 Запуск M5_main.ipynb (Jupyter)..."
jupyter notebook M5_main.ipynb --no-browser --ip=127.0.0.1 --port=8888
# Ctrl+C для остановки, или открой http://localhost:8888

echo "🚀 Запуск M7/main.py..."
python M7_main.py

echo "✅ Готово! requirements.txt сохранен."
pip freeze > requirements.txt
deactivate

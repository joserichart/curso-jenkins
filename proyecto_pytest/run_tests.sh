#!/bin/bash

echo "activando el entorno virtual"
python3 -m venv venv
source venv/Scripts/activate

echo "instalando dependencias"
pipx install --upgrade pip
pipx install -r requirements.txt

echo "ejecutando pruebas con pytest"
pytest tests/  --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "pruebas finalizadas resultados en reports"
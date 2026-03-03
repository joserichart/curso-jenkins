#!/bin/bash

echo " Iniciando ejecucion de pruebas en Jenkis"

# Verificar si el entorno virtual existe
if [ ! -d "venv" ]; then
    echo "Entorno virtual no encontrado. Creandolo"
    python3 -m venv venv
fi

# Activar el entorno virtual correctamente
if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
elif [ -f "venv/Scripts/activate" ]; then # Para Windows
    source venv/Scripts/activate
else
    echo " Error: No se pudo activar el entorno virtual"
    exit 1
fi

# Verificar si pip esta instalado correctamente
echo "instalando dependencias"

pip install --upgrade pip --braak-system-packages
pip install -r requirements.txt --break-system-packages

# ejecutar las pruebas
echo " Ejecutando Pruebas con Pytest"
venv/bin/python -m pytest tests/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "pruebas finalizadas resultados en reports"
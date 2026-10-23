#!/bin/bash
# Fecha de escritura: 23/10/2026
# Autor: Vania Pasapera Rebaza
# Descripción: Script de base de operaciones (caso “Misión: Operación KPC")
echo ""
echo "Montando base de operaciones: operación KPC..."
mkdir -p operacion_KPC/{datos_crudos,datos_procesados,resultados,scripts,logs,referencias}
touch operacion_KPC/datos_crudos/LEEME.txt
touch operacion_KPC/logs/registro.log
find operacion_KPC | sort
echo "Base de operaciones lista. Esperando secuencias..."

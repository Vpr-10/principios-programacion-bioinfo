#!/bin/bash
# Fecha de escritura: 23/10/2026
# Autor: Vania Pasapera Rebaza
# Descripción: Script de base de operaciones (caso “Misión: Operación KPC")
mkdir operación_KPC
echo "Montando base de operaciones: operación KPC..."
mkdir -p operación_KPC/{datos_crudos,datos_procesados,resultados,scripts,logs,referencias}
touch operación_KPC/datos_crudos/LEEME.txt
touch operación_KPC/logs/registro.log
find operación_KPC | sort
echo "Base de operaciones lista. Esperando secuencias..."

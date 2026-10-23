#!/bin/bash
# Fecha de escritura: 23/10/2026
# Autor: Vania Pasapera Rebaza
# Descripción: Script de reconocimiento del terreno (caso “Misión: Operación KPC”)

echo "=========================================="
echo "  INFORME DE RECONOCIMIENTO DEL SERVIDOR  "
echo "=========================================="
echo "Agente (usuario): $(whoami)"
echo "Fecha y hora: $(date)"
echo "Ubicación actual: $(pwd)"
echo "Espacio ocupado: $(du -sh)"
echo ""
echo "Archivos encontrados en el terreno:"
ls -lh

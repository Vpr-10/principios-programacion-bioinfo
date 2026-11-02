#!/bin/bash
# Fecha de escritura: 30/10/2026
# Autora: Vania Pasapera Rebaza
# Descripción: Script de decodificación (caso “Misión: Operación KPC”)

read -p "Archivo del aislado: " archivo
id="${archivo%.fasta}"
read -p "Genes detectados: " genes
primero="${genes%%,*}"
ultimo="${genes##*,}"
resto="${genes#*,}"

echo ""
echo "=== INFORME DE RESISTENCIA — $id ==="
echo ""
echo "Gen principal       : $primero"
echo "Último gen          : $ultimo"
echo "Resto de la lista   : $resto"

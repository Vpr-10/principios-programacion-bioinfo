#!/bin/bash
# Fecha de escritura: 30/10/2026
# Autora: Vania Pasapera Rebaza
# Descripción: Script de medición de precisión (caso “Misión: Operación KPC”)

read -p "ID del aislado: " id
adn=$(grep -A1 "$id" operacion_KPC/datos_crudos/aislados_uci.fasta | tail -n 1)
echo "Secuencia: $adn"
echo "Longitud exacta: ${#adn}"
echo "Posible inicio 5': ${adn:0:3}"
echo "Extremo 3': ${adn: -3}"

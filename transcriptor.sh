#!/bin/bash
# Fecha de escritura: 30/10/2026
# Autora: Vania Pasapera Rebaza
# Descripción: Script de transcripción (caso “Misión: Operación KPC”)

read -p "ID del aislado: " id
adn=$(grep -A1 "$id" operacion_KPC/datos_crudos/aislados_uci.fasta | tail -n 1)
arn="${adn//T/U}"
echo "=== TRANSCRIPCIÓN: ADN → ARNm — $id ==="
echo "ADN (5'→3') : $adn"
echo "ARN (5'→3') : $arn"
echo "Longitud ADN: ${#adn} bases"
echo "Longitud ARN: ${#arn} bases"

#¿Por qué la longitud no cambia después de la transcripción?
#Porque solo se sustituye cada nucleótido de timina (T) por uno de uracilo (U).


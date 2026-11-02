#!/bin/bash
# Fecha de escritura: 01/11/2026
# Autora: Vania Pasapera Rebaza
# Descripción: Script de informe para el comité de infecciones (caso “Misión: Operación KPC”)

reporte="operacion_KPC/resultados/reporte_${id}.txt"

echo "" >> $reporte

echo "============================================" > $reporte
echo "         INFORME — Operación KPC            " >> $reporte
echo "============================================" >> $reporte

read -p "ID del aislado: " id >> $reporte
echo "Aislado: $id" >> $reporte
read -p "Lista de genes: " genes >> $reporte
echo "Lista de genes: $genes" >> $reporte
read -p "Fecha de análisis: " date >> $reporte
echo "Generado el $(date)" >> $reporte

echo "" >> $reporte

echo "============================================" >> $reporte
echo "      FASE 1 — MEDICIÓN DE PRECISIÓN        " >> $reporte
echo "============================================" >> $reporte

adn=$(grep -A1 "$id" operacion_KPC/datos_crudos/aislados_uci.fasta | tail -n 1) >> $reporte

echo "Longitud exacta: ${#adn}" >> $reporte
echo "Posible inicio 5': ${adn:0:3}" >> $reporte
echo "Extremo 3': ${adn: -3}" >> $reporte

echo "" >> $reporte

echo "=================================================" >> $reporte
echo "  FASE 2 — TRANSCRIPCIÓN: ADN → ARNm — $id  " >> $reporte
echo "=================================================" >> $reporte

arn="${adn//T/U}" >> $reporte

echo "ADN (5'→3') : $adn" >> $reporte
echo "ARN (5'→3') : $arn" >> $reporte
echo "Longitud ADN: ${#adn} bases" >> $reporte
echo "Longitud ARN: ${#arn} bases" >> $reporte

#¿Por qué la longitud no cambia después de la transcripción? >> $reporte
#Porque solo se sustituye cada nucleótido de timina (T) por uno de uracilo (U). >> $reporte

echo "" >> $reporte

echo "============================================" >> $reporte
echo "          FASE 3 — DECODIFICACIÓN           " >> $reporte
echo "============================================" >> $reporte

primero="${genes%%,*}" >> $reporte
ultimo="${genes##*,}" >> $reporte
resto="${genes#*,}" >> $reporte

echo "Gen principal       : $primero" >> $reporte
echo "Último gen          : $ultimo" >> $reporte
echo "Resto de la lista   : $resto" >> $reporte

echo "" >> $reporte

cat $reporte

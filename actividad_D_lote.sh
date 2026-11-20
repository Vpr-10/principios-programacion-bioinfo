#!/bin/bash
# Fecha de escritura: 20/11/2026
# Autora: Vania Pasapera Rebaza.
# Descripción: Script para calcular la longitud de cuatro secuencias de ADN
# en arrays paralelos, su versión de ARN y el total de bases, sin escribir cada operación
# por separado.

# Declarar los arrays.
SECUENCIAS=("ATCGATCG" "GCTAGCTAGCTAGCTA" "AAAATTTTCCCCGGGG" "ATCGATCGATCGATCG")

# Agregar una secuencia con +=.
SECUENCIAS+=("GCTAATCGGCTA")
IDS=("seq_ecoli" "seq_salm" "seq_klebs" "seq_pseudo")
BASES_TOTALES=0
NUM_SECUENCIAS="${#SECUENCIAS[@]}"

# Imprimir cada secuencia: su identificador, longitud y versión de ARN.
for i in "${!SECUENCIAS[@]}"
do
    SEQ="${SECUENCIAS[$i]}"
    ID="${IDS[$i]}"
    LONG="${#SEQ}"
    ARN="${SEQ//T/U}"

    echo "seq_$ID: $LONG bp | ARN: $ARN"
    BASES_TOTALES=$((BASES_TOTALES + LONG))
done

echo "Bases totales: $BASES_TOTALES"

PROMEDIO=$(($BASES_TOTALES / $NUM_SECUENCIAS))
echo "Promedio: $PROMEDIO bp"

# Promedio esperado: Menor. La secuencia agregada contiene 12 bp,
# un valor por debajo del promedio anteriormente obtenido (14 bp).


#!/bin/bash
# analizador_secuencias_array.sh
# Analiza múltiples secuencias de ADN almacenadas en un array.
# Integra: arrays, for, ${#}, ${//}, subcadenas y aritmética.
# Uso: bash analizador_secuencias_array.sh

SECUENCIAS=(
    "ATCGATCG"
    "GCTAGCTAGCTAGCTA"
    "AAAATTTTCCCCGGGG"
    "ATCGATCGATCGATCG"
    "GCGCGCGCGCGCGCGCGCGC"
)
IDENTIFICADORES=("seq_ecoli" "seq_salm" "seq_klebs" "seq_pseudo" "seq_staph")

echo ""
echo "======================================================"
echo "       ANALIZADOR DE SECUENCIAS - MODO BATCH          "
echo "======================================================"
echo ""
echo "Total de secuencias a analizar: ${#SECUENCIAS[@]}"
echo ""

LONGITUD_MAX=0
ID_MAX=""
BASES_TOTALES=0
NUM_LARGAS=0

for I in ${!SECUENCIAS[@]}
do
   SEQ="${SECUENCIAS[$I]}"
   ID="${IDENTIFICADORES[$I]}"
   LONGITUD=${#SEQ}
   ARN="${SEQ//T/U}"
   CODON_INICIO="${SEQ:0:3}"
   BASES_TOTALES=$((BASES_TOTALES + LONGITUD))

   echo "--- Secuencia $((I+1)): $ID ---"
   echo "ADN          : $SEQ"
   echo "ARN          : $ARN"
   echo "Longitud     : $LONGITUD bp"
   echo "Codón inicio : $CODON_INICIO"

   # Detectar si el codón es de inicio.
   if [ "$CODON_INICIO" = "ATG" ]
   then
       echo "Inicio ATG: Detectado"
   else
       echo "Inicio ATG: No detectado"
   fi

   # Clasificar por longitud
   if [ $LONGITUD -gt 15 ]
   then
       echo "Categoría: Larga (>15 bp)"
       NUM_LARGAS=$((NUM_LARGAS + 1))
   else
       echo "Categoría: Corta (≤15 bp)"
   fi

   # Guardar la más larga.
   if [ $LONGITUD -gt $LONGITUD_MAX ]
   then
       LONGITUD_MAX=$LONGITUD
       ID_MAX=$ID
   fi
   echo ""
done

PROMEDIO=$((BASES_TOTALES / ${#SECUENCIAS[@]}))

echo "========================================================"
echo "                  RESUMEN ESTADÍSTICO                   "
echo "========================================================"
echo "Total secuencias analizadas : ${#SECUENCIAS[@]}"
echo "Bases totales               : $BASES_TOTALES bp"
echo "Longitud promedio           : $PROMEDIO bp"
echo "Secuencia más larga         : $ID_MAX ($LONGITUD_MAX bp)"
echo "Secuencias largas (>15 bp)  : $NUM_LARGAS"

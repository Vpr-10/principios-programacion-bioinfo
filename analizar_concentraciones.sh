#!/bin/bash
# analizar_concentraciones.sh
# Evalúa concentraciones de ADN y clasifica las muestras
# Uso: bash analizar_concentraciones.sh

MUESTRAS=("Muestra_01" "Muestra_02" "Muestra_03" "Muestra_04" "Muestra_05")
CONCENTRACIONES=(26 70 80 35 150)
UMBRAL_MIN=50
UMBRAL_MAX=100

echo "========================================="
echo "   ANÁLISIS DE CUANTIFICACIÓN DE ADN     "
echo "========================================="
echo ""
echo "Umbral mínimo: $UMBRAL_MIN ng/uL"
echo "Umbral máximo: $UMBRAL_MAX ng/uL"
echo ""

APTAS=0
NO_APTAS=0

for I in ${!MUESTRAS[@]}
do
    MUESTRA="${MUESTRAS[$I]}"
    CONC="${CONCENTRACIONES[$I]}"

   if [ $CONC -ge $UMBRAL_MIN ] && [ $CONC -le $UMBRAL_MAX ]
   then
       ESTADO="APTA"
       APTAS=$((APTAS + 1))
   elif [ $CONC -lt $UMBRAL_MIN ]
   then
       ESTADO="DILUIDA"
       NO_APTAS=$((NO_APTAS + 1))
   else
       ESTADO="CONCENTRADA"
       NO_APTAS=$((NO_APTAS + 1))
   fi

   echo "$ESTADO | ${MUESTRA} -> ${CONC} ng/uL"
done

echo ""
echo "--------------------------------------------"
echo "Muestras aptas   : $APTAS / ${#MUESTRAS[@]}"
echo "Muestras no aptas: $NO_APTAS / ${#MUESTRAS[@]}"

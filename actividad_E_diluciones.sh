#!/bin/bash
# Fecha de escritura: 20/11/2026
# Autora: Vania Pasapera Rebaza.
# Descripción: Script para  prepara una serie de diluciones y un análisis de lecturas
# procesadas por bloques.

# Serie de diluciones.

for ((D=1; D<=8; D*=2))
do
    echo "Dilución 1:$D"
done

# Procesamiento de lecturas.

TOTAL_LECTURAS=400000
BLOQUE=100000
LECTURAS_PROCESADAS=0

for ((L=BLOQUE; L<=TOTAL_LECTURAS; L+=BLOQUE))
do
   PORCENTAJE=$((L * 100 / TOTAL_LECTURAS))
   echo "Lecturas procesadas: $L / $TOTAL_LECTURAS ($PORCENTAJE%)"
done





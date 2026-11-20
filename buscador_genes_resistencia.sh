#!/bin/bash
# buscador_genes_resistencia.sh
# Busca y clasifica genes de resistencia antimicrobiana.
# Uso: bash buscador_genes_resistencia.sh

# Base de datos de genes de resistencia.
GENES_BD=("blaKPC" "blaNDM" "blaOXA" "mecA" "vanA" "tetM" "ermB" "qnrS")
MECANISMOS=("Beta-lactamasa" "Metalo-beta-lactamasa" "Oxacilinasa" \
            "PBP2a MRSA" "D-Ala ligasa VRE" "Ribosoma (tet)" \
            "Metilasa ARN 23S" "Protección de girasa")
ANTIBIOTICOS=("Carbapenems" "Carbapenems" "Carbapenems" \
              "Meticilina" "Vancomicina" "Tetraciclinas" \
              "Macrólidos" "Quinolonas")

# Genes encontrados en las muestras del laboratorio.
MUESTRAS_GENES=("mecA" "blaNDM" "gyrA" "blaKPC" "vanA" "ompK35" "ermB")
MUESTRAS_ID=("MRSA-01" "KP-NDM-02" "EC-03" "KP-KPC-04" "EF-05" "KP-06" "SA-07")

echo "================================================="
echo "      SISTEMA DE DETECCIÓN DE RESISTENCIAS       "
echo " Análisis de $((${#MUESTRAS_GENES[@]})) Muestras "
echo "================================================="
echo ""

RESISTENTES=0
NO_RESISTENTES=0

for M in ${!MUESTRAS_GENES[@]}
do
    GEN_MUESTRA="${MUESTRAS_GENES[$M]}"
    ID_MUESTRA="${MUESTRAS_ID[$M]}"
    ENCONTRADO=false

    echo "Muestra: $ID_MUESTRA - Gen detectado: $GEN_MUESTRA"

    # Buscar el gen en la base de datos.
    for B in ${!GENES_BD[@]}
    do
        if [ "$GEN_MUESTRA" = "${GENES_BD[$B]}" ]
        then
             echo "GEN DE RESISTENCIA CONFIRMADO"
             echo "Mecanismo   : ${MECANISMOS[$B]}"
             echo "Resistente a: ${ANTIBIOTICOS[$B]}"
             ENCONTRADO=true
             RESISTENTES=$((RESISTENTES + 1))
             break
        fi
    done

    if [ "$ENCONTRADO" = false ]
    then
        echo "Gen no asociado a resistencia conocida"
        NO_RESISTENTES=$((NO_RESISTENTES + 1))
    fi
    echo ""
done

echo "======================================================"
echo "                REPORTE EPIDEMIOLÓGICO                "
echo "======================================================"
echo "Muestras analizadas      : ${#MUESTRAS_GENES[@]}"
echo "Con genes de resistencia : $RESISTENTES"
echo "Sin genes de resistencia : $NO_RESISTENTES"
PORCENTAJE=$((RESISTENTES * 100 / ${#MUESTRAS_GENES[@]}))
echo "Tasa de resistencia      : $PORCENTAJE%"

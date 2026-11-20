#!/bin/bash
# crear_estructura_experimento.sh
# Crea estructura de directorios y archivos para un experimento de PCR.
# Uso: bash crear_estructura_experimento.sh <nombre_experimento> <num_muestras>

EXPERIMENTO="${1:-Experimento_PCR}"
NUM_MUESTRAS="${2:-10}"

echo "=== CREANDO ESTRUCTURA DE EXPERIMENTO ==="
echo "Experimento: $EXPERIMENTO"
echo "Muestras   : $NUM_MUESTRAS"
echo ""

# Crear directorio raíz.
mkdir -p "$EXPERIMENTO"

# Crear subdirectorios.
for DIR in raw_data processed results logs
do
    mkdir -p "$EXPERIMENTO/$DIR"
    echo "Creado: $EXPERIMENTO/$DIR/"
done

echo ""
echo "Creando archivos de muestra..."

# Crear archivos para cada mustra con formato de 3 dígitos.
for ((I=1; I<=NUM_MUESTRAS; I++))
do
    NOMBRE=$(printf "Muestra_%03d" $I)
    touch "$EXPERIMENTO/raw_data/${NOMBRE}.fastq"
    echo "-> ${NOMBRE}.fastq"
done

echo ""
echo "Estructura creada. Total: $NUM_MUESTRAS archivos."
echo "$(find $EXPERIMENTO -type f | wc -l) archivos en total."

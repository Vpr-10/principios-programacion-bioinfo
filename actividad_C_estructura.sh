#!/bin/bash
# Fecha de escritura: 20/11/2026
# Autora: Vania Pasapera Rebaza
# Descripción: Script para crear la estructura de carpetas y los archivos de entrada
# para comenzar un experimento de PCR con cinco muestras.

EXPERIMENTO="Experimento_RNA"
mkdir -p "$EXPERIMENTO"

# Crear subcarpetas.
for DIR in raw_data processed results logs
do
   mkdir -p "$EXPERIMENTO/$DIR"
   echo "Creado: $EXPERIMENTO/$DIR/"
done

# Crear archivos.
for ((i=1; i<=5; i++))
do
    touch "$EXPERIMENTO/raw_data/muestra_${i}.fastq"
    echo "Archivo: muestra_${i}.fastq"
done

echo "Archivos en raw_data: $(ls $EXPERIMENTO/raw_data | wc -l)"

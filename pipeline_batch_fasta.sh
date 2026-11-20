#!/bin/bash
# pipeline de análisis FASTA de modo batch (procesamiento por lotes).
#
# Uso: bash pipeline_batch_fasta.sh [directorio_datos] [directorio_salida]
# Ejm: bash pipeline_batch_fasta.sh ./datos ./resultados
#
# Integra: arrays, for lista, for C-style, variables de entorno,
#          $?, $$, expansión de comandos, aritmética y reportes.
#
# Autora: Vania Pasapera Rebaza.
# Versión: 1.0

# ====================================================
#       BLOQUE 1 - CONFIGURACIÓN DEL PIPELINE
# ====================================================
SCRIPT=$(basename "$0")
PID=$$
FECHA=$(date +"%Y-%m-%d")
HORA_INICIO=$(date +"%H:%M:%S")
USUARIO=$(whoami)

DIR_DATOS="${1:-.}"
DIR_SALIDA="${2:-resultados_batch_${FECHA}}"
REPORTE="$DIR_SALIDA/reporte_batch_${FECHA}_${PID}.txt"

# =====================================================
#           BLOQUE 2 - VALIDACIÓN DEL ENTORNO
# =====================================================
echo ""
echo "================================================="
echo "        PIPELINE BATCH - ANÁLISIS FASTA          "
echo "          $(date +"%Y-%m-%d %H:%M:%S")           "
echo "================================================="
echo ""

# Verificar directorio de datos.
if [ ! -d "$DIR_DATOS" ]
then
    echo "Directorio no encontrado: $DIR_DATOS"
    exit 1
fi

# Recopilar archivos FASTA en un array.
ARCHIVOS_FASTA=($(ls "$DIR_DATOS"/*.fasta 2>/dev/null))

if [ ${#ARCHIVOS_FASTA[@]} -eq 0 ]
then
    echo "No se encontraron archivos .fasta en: $DIR_DATOS"
    echo "Creando archivos de demostración..."

    # Crear archivos de demo para la práctica.
    for ORG in ecoli salmonella klebsiella pseudomonas mycobacterium
    do
        DEMO="$DIR_DATOS/${ORG}_demo.fasta"
        echo ">seq_${ORG}_1 [organism=${ORG}]" > "$DEMO"
        echo "ATCGATCGATCGATCGATCGATCGATCGATCG" >> "$DEMO"
        echo ">seq_${ORG}_2 [organism=${ORG}]" >> "$DEMO"
        echo "GCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTA" >> "$DEMO"
    done

    # Recargar el array.
    ARCHIVOS_FASTA=($(ls "$DIR_DATOS"/*.fasta 2>/dev/null))
    echo "Creados ${#ARCHIVOS_FASTA[@]} archivos de demo."
fi

# Crear directorio de salida.
mkdir -p "$DIR_SALIDA"

echo "Configuración del pipeline:"
echo "Directorio de datos: $DIR_DATOS"
echo "Directorio salida  : $DIR_SALIDA"
echo "Archivos a procesar: ${#ARCHIVOS_FASTA[@]}"
echo "PID del pipeline   : $PID"
echo ""

# =====================================================
#            BLOQUE 3 - INICIALIZAR REPORTE
# =====================================================
cat > "$REPORTE" << EOF
=======================================================
            REPORTE BATCH DE ANÁLISIS FASTA
Pipeline: $SCRIPT | PID: $PID
Usuario $USUARIO | Fecha: $FECHA | Inicio: $HORA_INICIO
=======================================================

Archivos procesados:${#ARCHIVOS_FASTA[@]}
Directorio fuente: $DIR_DATOS

=======================================================
                RESULTADOS POR ARCHIVO
=======================================================
EOF

# =====================================================
#           BLOQUE 4 - PROCESAMIENTO EN LOTE
# =====================================================
TOTAL_ARCHIVOS=${#ARCHIVOS_FASTA[@]}
ARCHIVOS_OK=0
ARCHIVOS_ERROR=0
TOTAL_SECUENCIAS=0
TOTAL_BASES=0

echo "Iniciando procesamiento en lote..."
echo ""

# Barra de progreso - usamos bucle C-style para control preciso.
for ((IDX=0; IDX<TOTAL_ARCHIVOS; IDX++))
do
    ARCHIVO="${ARCHIVOS_FASTA[$IDX]}"
    NOMBRE=$(basename "$ARCHIVO" .fasta)
    PROGRESO=$(( (IDX + 1) * 100 / TOTAL_ARCHIVOS ))

    echo "  [$((IDX+1))/$TOTAL_ARCHIVOS] ($PROGRESO%) Procesando: $NOMBRE"

    # Verificar que el archivo tiene contenido.
    if [ ! -s "$ARCHIVO" ]
    then
        echo "Archivo vacío - omitido"
        ARCHIVOS_ERROR=$((ARCHIVOS_ERROR + 1))
        echo "  $NOMBRE: VACÍO - omitido" >> "$REPORTE"
        continue
    fi

    # Análisis del archivo.
    NUM_SEQS=$(grep -c "^>" "$ARCHIVO" 2>/dev/null)
    CODIGO_GREP=$?

    if [ $CODIGO_GREP -ne 0 ]
    then
        echo "Error al analizar el archivo"
        ARCHIVOS_ERROR=$((ARCHIVOS_ERROR + 1))
        echo "$NOMBRE: ERROR en análisis" >> "$REPORTE"
        continue
    fi
    # Calcular bases totales (sin cabeceras ni newlines).
    BASES=$(grep -v "^>" "$ARCHIVO" | tr -d '\n' | wc -c)
    TAMANIO_KB=$(( $(wc -c < "$ARCHIVO") / 1024 + 1 ))

    # Longitud promedio.
    if [ $NUM_SEQS -gt 0 ]
    then
        LONGITUD_PROM=$((BASES / NUM_SEQS))
    else
        LONGITUD_PROM=0
    fi

    # Acumuladores globales.
    TOTAL_SECUENCIAS=$((TOTAL_SECUENCIAS + NUM_SEQS))
    TOTAL_BASES=$((TOTAL_BASES + BASES))
    ARCHIVOS_OK=$((ARCHIVOS_OK + 1))

    echo " $NUM_SEQS secuencias | $BASES bp | prom: ${LONGITUD_PROM} bp"

    # Agregar al reporte.
    cat >> "$REPORTE" << EOF

  Archivo   : $NOMBRE.fasta
  Secuencias: $NUM_SEQS
  Bases     : $BASES bp
  Promedio  : $LONGITUD_PROM bp/secuencia
  Tamaño    : $TAMANIO_KB KB
  Estado    : OK
EOF

done

# =====================================================
#     BLOQUE 5 - RESUMEN FINAL Y CIERRE DEL REPORTE
# =====================================================
HORA_FIN=$(date +"%H:%M:%S")
PROMEDIO_GLOBAL=0
if [ $TOTAL_ARCHIVOS -gt 0 ] && [ $TOTAL_SECUENCIAS -gt 0 ]
then
    PROMEDIO_GLOBAL=$((TOTAL_BASES / TOTAL_SECUENCIAS))
fi

cat >> "$REPORTE" << EOF
======================================================
                    RESUMEN GLOBAL
======================================================
  Archivos procesados  : $TOTAL_ARCHIVOS
  Procesados con éxito : $ARCHIVOS_OK
  Con errores          : $ARCHIVOS_ERROR
  Total secuencias     : $TOTAL_SECUENCIAS
  Total bases          : $TOTAL_BASES bp
  Longitud promedio    : $PROMEDIO_GLOBAL bp
  Hora de inicio       : $HORA_INICIO
  Hora de fin          : $HORA_FIN
======================================================
                 FIN DEL REPORTE BATCH
======================================================
EOF

echo ""
echo "================================================"
echo "            RESUMEN DEL PIPELINE                "
echo "================================================"
echo "Archivos procesados : $TOTAL_ARCHIVOS"
echo "Exitosos            : $ARCHIVOS_OK"
echo "Con errores         : $ARCHIVOS_ERROR"
echo "Total secuencias    : $TOTAL_SECUENCIAS"
echo "Total bases         : $TOTAL_BASES bp"
echo "Longitud promedio   : $PROMEDIO_GLOBAL bp"
echo ""
echo "Reporte completo: $REPORTE"
echo "Pipeline finalizado a las $HORA_FIN"
echo ""
exit 0

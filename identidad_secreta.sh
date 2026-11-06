#!/bin/bash
# Nombre y clave de agente: Vania Pasapera Rebaza, u202510742.

echo "══════════════════════════════════"
echo "          FICHA DE MUESTRA        "
echo "══════════════════════════════════"

ORGANISMO="Escherichia coli"
CEPA="K-12"
TIPO_MUESTRA="Cultivo puro"
RESPONSABLE="Ana García"
ID_MUESTRA="${ORGANISMO}_${CEPA}"

echo " Organismo   : $ORGANISMO"
echo " Cepa        : $CEPA"
echo " Tipo        : $TIPO_MUESTRA"
echo " Responsable : $RESPONSABLE"
echo " Fecha       : $(date +"%Y-%m-%d")"
echo " ID          : ${ORGANISMO}_${CEPA}"
echo "══════════════════════════════════"

export OPERACION="Expediente genoma"
bash -c 'echo "En subshell: $OPERACION"'

# ¿Por qué echo $ID_MUESTRA_v1 y echo ${ID_MUESTRA}_v1 no dan el mismo resultado?
# Porque una de ellas utiliza llaves. Al utilizar llaves, se precisa la búsqueda de la variable ID_MUESTRA. De modo que se imprime esta y el agregado _v1.



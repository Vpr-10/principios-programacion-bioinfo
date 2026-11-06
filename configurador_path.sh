#!/bin/bash
# Nombre y clave de agente: Vania Pasapera Rebaza, u202510742.

HERRAMIENTA="fastqc"

mkdir -p "$HOME/biotools/$HERRAMIENTA/bin"
export PATH="$PATH:$HOME/biotools/$HERRAMIENTA/bin"
echo "$PATH" | tr ':' '\n' | grep "$HERRAMIENTA"

# La ruta no aparece en la terminal después de bash configurador_path.sh,
# porque con bash no es posible conservar la nueva ruta. Con source
# la ruta se incorpora al entorno de la terminal actual.

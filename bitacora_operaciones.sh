#!/bin/bash
# Nombre y clave de agente: Vania Pasapera Rebaza, u202510742.

RESPONSABLE="Ana García"
ORGANISMO="Escherichia coli"
HERRAMIENTA="fastqc"

cat > informe_mision.txt << EOF
OPERACIÓN EXPEDIENTE GENOMA
Responsable: $RESPONSABLE
Muestra    : ${ORGANISMO}_K-12
Herramienta: $HERRAMIENTA
Fecha      : $(date +"%Y-%m-%d")
EOF

cat >> informe_mision.txt << 'EOF'
Estado     : $ESTADO
EOF

cat informe_mision.txt


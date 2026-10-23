#!/bin/bash
# Fecha de escritura: 23/10/2026
# Autora: Vania Pasapera Rebaza
# Descripción: Script de interceptar las secuencias (caso "Misión: Operación KPC")

cat > operación_KPC/datos_crudos/aislados_uci.fasta << 'EOF'
>KP_UCI_001|Klebsiella_pneumoniae|paciente_01
TTTCTGATGGGTTGAGTACCCAGGGTTGTCTATGTGTTCGCACATTCCTCTGGGTCCAT
GGGCACGTTGGGTTATCAGAAGAAATACCTCCGACACTTAAGAGGGAGTATTGTCTTTCGT
>KP_UCI_002|Klebsiella_pneumoniae|paciente_02
GGCTCTTGGAAATCTCTTTGGGCCGAATTGCGACCGTGCATACTCAGTAGGGCTAGTTGT
CCCGCACTGACTACGAAAGAAATAACCCAAACAACTTTTGAGACCGGATATGCTGGGAAT
>KP_UCI_003|Klebsiella_pneumoniae|paciente_03
TAGTAGAACGAGGAGCATCTTGTATCCGGAGGCGCGGCACTAATCTAAACATGCGGGGT
ATTTTCATCAAAGGCGAACCGCTCGATATCGGCCCTTATACCTACTGTCAGACTTCGGGAC
EOF

echo "Secuencias interceptadas: $(grep -c ">" aislados_uci.fasta)"
echo ""
echo "Identificadores:"
grep ">" aislados_uci.fasta
echo""
echo "Longitud aproximada:"
echo "KP_UCI_001: $(grep -A1 "KP_UCI_001" aislados_uci.fasta | tail -1 | wc -c) caracteres"
echo "KP_UCI_002: $(grep -A1 "KP_UCI_002" aislados_uci.fasta | tail -1 | wc -c) caracteres"
echo "KP_UCI_003: $(grep -A1 "KP_UCI_003" aislados_uci.fasta | tail -1 | wc -c) caracteres"

echo "Este mensaje se autodestruirá en..."
echo "3"; sleep 1
echo "2"; sleep 1
echo "1"; sleep 1
clear

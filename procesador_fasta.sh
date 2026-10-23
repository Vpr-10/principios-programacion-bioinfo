#!/bin/bash
# Fecha de escritura: 23/10/2026
# Autora: Vania Pasapera Rebaza
# Descripción: Script de interceptar las secuencias (caso "Misión: Operación KPC")

cat > operacion_KPC/datos_crudos/aislados_uci.fasta << 'EOF'
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

echo "Secuencias interceptadas: $(grep -c ">" operacion_KPC/datos_crudos/aislados_uci.fasta)"
echo ""
echo "Identificadores:"
grep ">" operacion_KPC/datos_crudos/aislados_uci.fasta
echo""
echo "Longitud aproximada:"
echo "KP_UCI_001: $(grep -A1 "KP_UCI_001" operacion_KPC/datos_crudos/aislados_uci.fasta | tail -1 | wc -c) caracteres"
echo "KP_UCI_002: $(grep -A1 "KP_UCI_002" operacion_KPC/datos_crudos/aislados_uci.fasta | tail -1 | wc -c) caracteres"
echo "KP_UCI_003: $(grep -A1 "KP_UCI_003" operacion_KPC/datos_crudos/aislados_uci.fasta | tail -1 | wc -c) caracteres"

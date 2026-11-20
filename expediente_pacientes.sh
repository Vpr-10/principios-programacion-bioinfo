#!/bin/bash
# Fecha de escritura: 13/11/2026
# Autora: Vania Pasapera Rebaza.
# Descripción: Script de filtrado de expediente (Misión 4)

cat > pacientes.txt << 'EOF'
Hospital Paciente Biobanco Tipo_Usher
Barcelona Pepe Barcelona Usher2A
Mallorca Juan Barcelona usher1b
Albacete Alfonso Madrid usher2
madrid Alcia Madrid usher1a
Valencia Kevin Valencia usher1B
Castellón Didac valencia usher2B
castellón Joan Barcelona usher3
EOF

echo "=== ENVIADOS A CASTELLÓN ==="
grep -i '^castell' pacientes.txt
echo ""
echo "=== BIOBANCO DE BARCELONA ==="
grep ' Barcelona ' pacientes.txt
echo "Código: $?"
echo ""
echo "=== SIN USHER3 ==="
grep -v -E '^Hospital|usher3' pacientes.txt
echo ""
echo "=== BONUS: USHER1 O USHER2 ==="
echo ""
echo "== El patrón es: usher[12] con -i =="
grep -E -i 'usher[12]' pacientes.txt
echo ""
echo " ==Prueba con usher(1|2) =="
grep -E -i 'usher(1|2)' pacientes.txt
echo""
echo "Ambos patrones buscan lo mismo. Si el patrón"
echo "de búsqueda fuese más complejo, convendría usar"
echo "la segunda opción (alternancia)."
echo""

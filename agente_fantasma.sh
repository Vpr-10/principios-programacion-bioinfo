#!/bin/bash
# Nombre y código de agente: Vania Pasapera Rebaza, u202510742.

CLAVE_LOCAL="Arroz con pollo"
export CLAVE_AGENTE="Arroz chaufa"

bash -c 'echo "Clave local : $CLAVE_LOCAL"; echo "Clave agente: $CLAVE_AGENTE"'

# El resultado se debe a que solo se ha exportado la segunda variable. Al ejecutar bash -c estás solicitando que la variale se ejecute en una nueva instancia,
# como la primera variable no ha sido exportada y no se ha heredado, no es reconocida.


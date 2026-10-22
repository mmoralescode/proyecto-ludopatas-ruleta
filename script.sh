#!/bin/bash
#################################################################
# Nombre del script: Estadísticas de ruleta de casino
# Descripción: Procesa el registro de 15 tiradas de una ruleta y cuenta
#              cuantas veces cayó rojo, negro, par e impar
# Autores: Martín Morales, Emiliano Muñoz y Gonzalo Torres
# Fecha: 9/10/2026
# Versión: 1.0
# Uso: ./script.sh ruleta.txt
################################################################

#----------------VARIABLES---------------------------
tiradas="${1:-ruleta.txt}"
stats="salida.txt"

#---------------------Cálculo----------------
total=$(grep -c "^[0-9]" "$tiradas")
rojos=$(grep -c ",rojo," "$tiradas")
negros=$(grep -c ",negro," "$tiradas")
pares=$(grep -c ",par$" "$tiradas")
impares=$(grep -c ",impar$" "$tiradas")

#----------------------Reporte
echo "============================================" > "$stats"
echo "	Estadísticas de Ruleta - $total Tiradas" >>  "$stats"
echo "============================================" >> "$stats"
echo "" >> "$stats"
echo "[ Tiradas ]" >> "$stats"
sed 's/,/\t/g' "$tiradas" >> "$stats"
echo "" >> "$stats"
echo "[ Por color ]" >> "$stats"
echo " Rojo : $rojos" >> "$stats"
echo " Negro : $negros" >> "$stats"
echo "" >> "$salida"
echo "[ Por paridad ]" >> "$stats"
echo " Par : $pares" >> "$stats"
echo " Impar : $impares" >> "$stats"
echo "============================================" >> "$stats"

##muestra todo en la pantalla
cat "$stats"

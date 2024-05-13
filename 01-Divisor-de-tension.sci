// Ejemplo de un scrip para un circuito de resistencias en serie
// Parámetros del ejemplo
// [Vin] -> Tensión de la fuente de entrada
// [R1] -> Primera resistencia
// [R2] -> Segunda resistencia
//---------------------------------------------------------------------
clear
clc
//---------------------------------------------------------------------
Vin = 12
R1 = 1.8e3 // Resistencia de 1800 ohms
R2 = 3.3e3 // Resistencia de 3300 ohms
//---------------------------------------------------------------------
    // Definición de una función que realiza un divisor de tensión
function tension = divTension(Vi, RA, RB)
    tension = Vi*(RA/(RA+RB))
endfunction
    // Definición de una función para calcular potencia en un elemento
function dispPotencia = potencia(V,I)
    dispPotencia = V*I
endfunction
//---------------------------------------------------------------------
Vr1 = divTension(Vin,R1,R2)
Vr2 = divTension(Vin,R2,R1)
Ir1 = Vr1/R1
Ir2 = Vr2/R2
Pr1 = potencia(Vr1,Ir1)
Pr2 = potencia(Vr2,Ir2)
Ptotal = Pr1+Pr2
//---------------------------------------------------------------------
// Sección para imprimir resultados en consola
printf("\n========================================================")
printf("\nRESOLUCIÓN DE CIRCUITO DE RESISTENCIAS EN SERIE")
printf("\n--------------------------------------------------------")
printf("\nTensión total: %d V", Vin)
printf("\nTensión en R1: %.2f V", Vr1)
printf("\nTensión en R2: %.2f V", Vr2)
printf("\nCorriente total: %.2f mA", Ir1*1e3)
printf("\nPotencias disipadas en R1 y R2: %.2f mW y %.2f mW",Pr1*1e3, Pr2*1e3)
printf("\n========================================================")

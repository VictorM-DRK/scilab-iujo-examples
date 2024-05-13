// Ejemplo de un circuito de diodo de unión en serie con resistencia
//---------------------------------------------------------------------
clear
clc
//---------------------------------------------------------------------
    // Componentes
Vd = 0.65 // Tensión de activación del diodo
R = 1.2e3 // Resistencia de 1200 ohms
Vin = 10 //Tensión de alimentación DC
//---------------------------------------------------------------------
// Condicional
if Vin>Vd then
    Vr = Vin-Vd
    Vak = Vd
else
    Vr = 0
    Vak = Vin
end

Ir1 = Vr/R
Pd = Vd*Ir1
Pr = Vr^2/R
msgDiodeOpen = "****DIODO ABIERTO****"
msgDiodeActive = "****DIODO ACTIVO****"
// Impresión de resultados en consola ---------------------------------
printf("\n===========================================================")
printf("\n RESULTADOS DE CIRCUITO DIODO - RESISTENCIA")
printf("\n-----------------------------------------------------------")
printf("\nCorriente total: %.2f mA", Ir1*1e3)
printf("\nTensión entre terminales del diodo: %.2f V", Vak)
printf("\nTensión entre terminales del resistor: %.2f V", Vr)
printf("\nPotencia disipada por el diodo: %.2f mW", Pd*1e3)
printf("\npotencia disipada por el resistor: %.2f mW", Pr*1e3)
if Vak>0 then
    printf("\n%s",msgDiodeActive)
else
    printf("\n%s",msgDiodeOpen)
end
printf("\n===========================================================")

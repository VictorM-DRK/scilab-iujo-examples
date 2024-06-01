//---------------------------------------------------------------------
// Ejemplo de circuito rectificador de onda completa con toma central
clear
clc
clf(0)
clf(1)
// Componentes---------------------------------------------------------
Vd = 0.6
R = 1.2e3
// Parámetros de alimentación AC
f = 60      // Frecuencia de 60 Hz
T = 1/f     // Periodo de la señal de entrada
w = 2*%pi*f // velocidad angular
t = 0: T/1e3: 2*T // Rango de tiempo que será graficado
Vin = 2*sin(w*t) // Vin es un vector sinusoidal
//---------------------------------------------------------------------
VinVectorSize = size(Vin) // Determina tamaño del vector de Vin
for i = 1:VinVectorSize(2)
    if abs(Vin(1,i))>Vd then
        Vr(1,i) = abs(Vin(1,i))-Vd
    else
        Vr(1,i) = 0
    end
end
//---------------------------------------------------------------------
// Representación gráfica del resultado
plot(t*1e3, Vr,'b',t*1e3,Vin,'r','LineWidth',3)
xgrid(1,1,3)
xtitle("Tensión de entrada [rojo] y resistencia [azul]")
xlabel('tiempo [ms]')
ylabel('Tensión [V]')

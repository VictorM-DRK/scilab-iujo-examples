//---------------------------------------------------------------------
// Ejemplo diodo-resistencia alimentado con AC
// Modelo simplificado con un diodo de unión de silicio
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
    if Vin(1,i)>Vd then
        Vr(1,i) = Vin(1,i)-Vd
        Vak(1,i) = Vd
    else
        Vr(1,i) = 0
        Vak(1,i) = Vin(1,i)
    end
end
//---------------------------------------------------------------------
// Representación gráfica del resultado
subplot(121) // Especifica que se realiza 1 de 2 gráficas
plot(t*1e3, Vr,'b',t*1e3,Vin,'r','LineWidth',3)
xgrid(1,1,3)
xtitle("Tensión de entrada [rojo] y resistencia [azul]")
xlabel('tiempo [ms]')
ylabel('Tensión [V]')

subplot(122) // Especifica que se realiza 2 de 2 gráficas
plot(t*1e3, Vin,'m',t*1e3,Vak,':b','LineWidth',3)
xgrid(1,1,3)
xtitle("Tensión de entrada [magenta] y del diodo [azul]")
xlabel('tiempo [ms]')
ylabel('Tensión [V]')

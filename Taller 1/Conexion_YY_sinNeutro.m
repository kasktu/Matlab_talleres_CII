%@autor: Erik Santiago Guerrrero Bautista
%Este script ha sido creado para solucionar el problema 2
%de el primer taller de Circuitos 2
clear all
%Valor de las Impedancias

Z1=input('Ingrese el valor de la Impedancia Z1: ');
Z2=input('Ingrese el valor de la Impedancia Z2: ');
Z3=input('Ingrese el valor de la Impedancia Z3: ');

%Z1=0+30j;
%Z2=10-40j;
%Z3=20+10j;

%valor de las fuentes
Van=100+0j;
Vbn=-50-86.60j;
Vcn=-50+86.60j;
%Resitencia de los cables
R=0.5;
%valor impedancias totales
Z11=2*R+Z1+Z2
Z12=-(R+Z2)
Z21=-(R+Z2)
Z22=2*R+Z2+Z3
%Valor Voltajes totales
V1=-Vbn+Van
V2=-Vcn+Vbn
%Matriz de Impedancias
Z=[Z11 Z12;Z21 Z22]
%matriz de Voltajes
V=[V1;V2]
%calcular las Corrientes
I=I_ZV(Z,V);
I1=I(1,1)
I2=I(2,1)
I_A=I1
I_B=I2-I1
I_C=-I2
%calculo de potencias
%calculo de la potencia de las resistencias
S_R1 = S_ZI(R,I_A)
S_R2 = S_ZI(R,I_B)
S_R3 = S_ZI(R,I_C)
%calculo de la potencia de las impedancias
S_Z1 = S_ZI(Z1,I_A)
S_Z2 = S_ZI(Z2,I_B)
S_Z3 = S_ZI(Z3,I_C)
%calculo de la potencia de las fuentes
S_Van =S_VI(Van,I_A)
S_Vbn =S_VI(Vbn,I_B)
S_Vcn =S_VI(Vcn,I_C)
%Calculo de la potencia perdida
S_perdida=S_R1+S_R2+S_R3
%Calculo de la potencia Consumida por las cargas
S_cargas=S_Z1+S_Z2+S_Z3
%calculo de la potencia entregada
S_entregada = S_Van+S_Vbn+S_Vcn
%calculo de la potencia consumida total
S_consumida = S_perdida+S_cargas
%redondeo para comprobacion
S_consumida=round(S_consumida,4)
S_entregada=round(S_entregada,4)
   
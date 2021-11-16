%@autor: Erik Santiago Guerrrero Bautista
%Este script ha sido creado para solucionar el problema 1
%de el primer taller de Circuitos 2
clear all 
%voltaje de las fuentes
Van=100+0j;
Vbn=-50-86.60j;
Vcn=-50+86.60j;
%resistencia del cable
R=0;
%impedacias

Z1=150
Z2=150
Z3=150

%Z1=1000+0j;
%Z2=2000+1000j;
%Z3=0+2000j;
%calculo de las Corrientes
I_A= Ifase_VZR(Van,Z1,R)
I_B= Ifase_VZR(Vbn,Z2,R)
I_C= Ifase_VZR(Vcn,Z3,R)
%calculo de las potencias de las impedancias
S_Z1 = S_ZI(Z1,I_A)
S_Z2 = S_ZI(Z2,I_B)
S_Z3 = S_ZI(Z3,I_C)
%Calculo de la potencia perdida en los cables
S_R1 = S_ZI(R,I_A)
S_R2 = S_ZI(R,I_B)
S_R3 = S_ZI(R,I_C)
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
S_consumida=round(S_consumida,2)
S_entregada=round(S_entregada,2)
if S_consumida == S_entregada
    disp('la potencia entregada es igual a la consumida')
    disp('el ejercicio ha quedado bien \ :v /')
else
    disp('la potencia entregada es diferente a la consumida')
    disp('el ejercicio ha quedado mal, revisar')
end  

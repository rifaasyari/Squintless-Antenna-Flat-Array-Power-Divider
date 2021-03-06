clear all;
close all;
clear figures;
clc;
% Divisor de potencia de 20 elementos
% Distribuci�n, coseno cuadrado sobre pedestal
% Recordar que se realiza la distribuci�n de potencia para la mitad del
% arreglo

x=0:pi/38:pi/2;
A=0.1+0.9.*(cos(x)).^2;
P=A.^2;
Ptot=sum(P);
b=zeros(size(A)); %se inicializa vector de alturas de gu�a
N=size(A,2) %nro de elementos


%analisis de P%
for i=[1:1:N-1]
    a(i)=P(i+1)/P(i);
    c(i)= (Ptot - sum(P(1:i+1)))/(Ptot - sum(P(1:i)));
    if a(i) < c(i)
        sprintf('ERROR: La distribuci�n de potencias decae muy r�pido, o tiene variaciones muy r�pidas')
        return
    end
end
%freq: 10GHz;
%lambda = 30 %mm;

b(1)= 12; %mm (altura de la gu�a en el primer escal�n)

%l�mites de br
brmin=P(1)*b(1)/(Ptot - P(1)) - P(N)*b(1)/(Ptot-P(1))
brmax=P(1)*b(1)/(Ptot - P(1))
br = 1.66 %mm (altura de la gu�a que alimenta a cada radiador)
%1.672






for i=2:size(A,2)
    b(i) = P(i-1)/P(i)*b(i-1);
    b(i) = b(i)-br;
end

figure(1);
bar(b,1)
figure(2)
limit=br/(br+b(1))* (b(1)/(br+b(1))).^[0:1:19]; 
semilogy(P/sum(P));hold on; semilogy(limit)    
figure(3)
plot(a,'r');hold on; plot(c)    
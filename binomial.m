function [v,delta,B]=binomial(S,K,r,sigma,T,N)
dt=T/N;
u=exp(sigma*sqrt(dt));
d=1/u;
p=(1+r*dt-d)/(u-d);
delta=zeros(N+1,N+1);
% Arbol de precios 
arbol_precios=zeros(N+1,N+1);
for i=1:N+1
    for j=1:i
        arbol_precios(j,i) = S * u^(j-1) * d^((i-1)-(j-1));
    end
end
arbol_opciones=zeros(N+1,N+1);
arbol_opciones(:,N+1)=max(arbol_precios(:,N+1)-K,0);
for i = N:-1:1
    for j = 1:i
        arbol_opciones(j,i) = 1/(1+r*dt) * (p * arbol_opciones(j+1,i+1) + (1-p) * arbol_opciones(j,i+1));
        delta(j,i)=(arbol_opciones(j+1,i+1)-arbol_opciones(j,i+1))/(arbol_precios(j+1,i+1)-arbol_precios(j,i+1));
    end
end
v=arbol_opciones(1,1);
delta=delta(1,1);
B=v-delta*arbol_precios(1,1);
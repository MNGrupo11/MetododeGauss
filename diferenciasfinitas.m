% M�todo de Euler  
% Autores:
% Javier Sotamba, Elizabeth Corte, Lisbeth Espinoza 
% Fecha de implementacion: 03/01/2022

% Par�metros de entrada:
%-----------------------------------------------------------
% n: n�mero de ecuaciones                                   |
% xo: condici�n inicial para x                              |
% yo: condici�n inicial para y                              |
% xf: condici�n final para x                                |
% yf: condici�n final para y                               |
%-----------------------------------------------------------
% Par�metros de salida:
%--------------------------------------------------------------
% U: resultados de aproximaci�n de la ecuaci�n diferencial | 
%--------------------------------------------------------------

function [a,mat]=diferenciasfinitas(n, xo, xf, yo, yf)
  
  h=(xf-xo)/(n+1);
  x=linspace(xo,xf,n+2);
  b=zeros(n,1);
  a=eye(n)*(h^2-8); % matriz identidad con valor en la diagonal 
  for k=1:n-1 % Se obtiene el conjunto de ecuaciones 
    a(k,k+1)=-h+4;
    a(k+1,k)=h+4;
    b(k)=-h^2*x(k+1);
  endfor
  b(1)=-h^2*x(2)-9*yo; % reemplazo de valores las matrices 
  b(n)=-h^2*x(n+1)+yf;
  y=inv(a)*b; % soluci�n del sistema de ecuaciones 
  y=[yo;y;yf]; % se incluyen los t�rminos iniciales y finales 
  mat=[x' y] ;% visualizaci�n de los resultados obtenidos 

endfunction

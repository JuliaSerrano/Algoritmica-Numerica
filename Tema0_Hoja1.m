%A Creacion de vectores y matrices

x = [1:10];             %vector fila numeros del 1 al 10

y = single(x);          %vector de precision simple 1 al 10

z = [2:2:20]';          %Vector columna con los números pares de 2 a 20

a = [7:7:70];           %Vector fila con los números de la tabla del 7

x = [0:0.01:(2*pi)];    %Vector desde 0 a (2*pi) a saltos de 0.01.

length(x);              %numero de elementos de x 

[n,m] = size(x);        %n = filas  m = columnas

x = [10:-1:5]';         %numeros del 10 al 5 en orden decreciente


x = [2:2:10];           %primera fila (pares <=10)
y = [1:2:10];           %segunda fila (impares <=10)
A = [x;y];              %matriz con primera fila = x, segunda fila = y


x = linspace(0,sqrt(3),101);     %101 elementos (equiespaciados) desde 0 a sqrt(3)


%B Crear vectores y matrices utilizando funciones básicas(zeros,ones,rand)

x = zeros(3,4);      %matriz 3x4 de ceros (3 filas, 4 columnas)


x = zeros(3,6);     %matriz 3x6 
x + 7;              %sumar a todos los elemntos 7

x = rand(1,5);      %5 números aleatorios uniformemente distribuidos, entre (0,1)


r = (-1 + (1 - (-1)).*rand(5,1))';      %5 números aleatorios uniformemente distribuidos, entre (-1,1)


%C Acceder a un dato o conjunto de datos de una matriz o vector

    %1.
A=[1 2 3 4;5 6 7 8;9 10 11 12]


%Extraer la tercera fila, almacenar en B
B = A(3,:);          %de la 3a fila coger todas las columnas

[n,m] = size(B);     %dimensiones: n = filas m = columnas


B = A([1,3],:);      %La primera y la tercera filas de A

B = A(:,4);          %La última columna de A.

B = A(1:2:3,4);      %Elementos de índice impar ultima columna



B = A([1 end], [2 4]);   %Elementos 2 y 4 de filas 1 y última de A

C = [A(end,[2 3]);A(2,[2 3])];  %Extraer de la matriz A la matriz C=[10 11;6 7].

C = [A(end,[4 3]);A(2,[4 3]);A(1,[4 3])];    %Obtener la matriz C=[12 11;8 7;4 3] a partir de A

[n,m] = size(A);     %dimensiones de A

    %2.
x = [2 4 7 5 9 3]


y = x(x>4);     %extraer elementos > 4

x(x<=4) = 0;     %poner a 0 elementos <= 4


%sumar 2 a los elementos que sean > 5

%opcion 1 (mejor)
x = [2 4 7 5 9 3];
y = (x>5); 
x(y)=x(y) + 2;

%opcion 2
x = [2 4 7 5 9 3];
[n,m] = size(x);
for i = 1: m
    if x(i)>5
        x(i) = x(i) + 2;
    end
end

%>= media -> 1,  < media -> 0
x = [2 4 7 5 9 3];
m = mean(x);;
y = x;
y(y>=m) = 1;
y(y<m) = 0;
y;

%elementos pares(/2 resto = 0) = 0
x = [2 4 7 5 9 3];
x(rem(x,2) == 0) = 0;


%extraer a vector y, elementos > 3
x = [2 4 7 5 9 3];
y = x(x>3);


%cambiar el signo valores que cumplan la condicion
x = [2 4 7 5 9 3];
y = (x>=2 & x<5);
x(y) = -x(y);


    %3.

notas = 6 + 1.2*randn(1,70);
    
%nota media
med = mean(notas);
    
%nota max
mx = max(notas);
    
%media de los aprobados
aprobados = notas(notas >=5);
mean(aprobados);
    
%aprobar a aquellos que nota>= 4.5 & nota<5
notas(notas>= 5.5 & notas<5) = 5;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


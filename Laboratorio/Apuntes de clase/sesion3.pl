% Author:
% Date: 2/13/2020

lista([b,b,c,d]).
listas([[a,b,c,d],[a,a,b,b],[c,c,d,a]]).

reemplazar_en_sublista(Lista,ISublista,ValorOri,ValorNue,ListaOut):-
    nth1(ISublista,Lista,Sublista,ListaRes),
    select(ValorOri,Sublista,ValorNue,SublistaOut),
    nth1(ISublista,ListaOut,SublistaOut,ListaRes).
    
pedir_num(Min,Max,Num):-
   repeat,
   write('Introduce un número entre '),
   write(Min),write(' y '),write(Max),writeln(':'),
   read(Num),
   ((Num >= Min, Num =< Max,!);writeln('Numero no valido'),false).
   
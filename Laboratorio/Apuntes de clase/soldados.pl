% Author:
% Date: 2/6/2020

soldado([john,10,2]).
soldado([peter,15,1]).
soldado([carl,5,3]).

soldados(Res):-soldados_aux([],Res).
soldados_aux(Aux,Res):-
   soldado(Sol),
   \+ member(Sol,Aux),!,
   append([Sol],Aux,Aux2),
   soldados_aux(Aux2,Res).
soldados_aux(Res,Res).

atacar(S1,S2,S2Out):-
    S1=[NS1,_,DS1],
    S2=[NS2,VS2,DS2],
    VS2Out is max(VS2 - DS1,0),
    write('Soldado '),write(NS1),
    write(' ataca a '),write(NS2),
    write(' con '),write(DS1),
    write(' de daño, dejándole con '),write(VS2Out),
    writeln(' puntos de vida'),
    S2Out=[NS2,VS2Out,DS2].

jugar:-soldados(S),jugar(S).

jugar([S]):-
   S=[NS|_],
   write('El soldado ganador es '),writeln(NS).
   
jugar(Soldados):-
   length(Soldados,N),
   random(0,N,IAta),
   repeat,
   random(0,N,IDef),
   dif(IAta,IDef),!,
   nth0(IAta,Soldados,SAta),
   nth0(IDef,Soldados,SDef),
   atacar(SAta,SDef,SDefOut),
   SDefOut=[NSDef,VSDef,_],
   ((VSDef > 0,select(SDef,Soldados,SDefOut,SoldadosOut),jugar(SoldadosOut));
    (VSDef = 0,write('El soldado '),write(NSDef),writeln(' ha muerto'),
               select(SDef,Soldados,SoldadosOut),jugar(SoldadosOut))),!.


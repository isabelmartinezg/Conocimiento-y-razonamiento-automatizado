% Author:
% Date: 1/30/2020

personas([adrian,manuel,alberto,pablo,enrique,yolanda,esther]).

padre(adrian,manuel).
padre(alberto,pablo).
padre(lucas,pablo).
padre(enrique,pablo).

madre(adrian,yolanda).
madre(julio,yolanda).
madre(alberto,esther).

hermano(Herm1,Herm2):- padre(Herm1,Padre),padre(Herm2,Padre),\+ (Herm1=Herm2).
hermano(Herm1,Herm2):- madre(Herm1,Madre),madre(Herm2,Madre),\+ (Herm1=Herm2).

imprimir_personas([Pers1|OtrasPersonas]):-writeln(Pers1),imprimir_personas(OtrasPersonas).
imprimir_personas([]).

sumar_1(ListaNums,Resultados):-sumar_1_aux(ListaNums,[],Resultados).
sumar_1_aux(ListaNums,ResAux,Resultados):-
    ListaNums = [Num|MasNums],
    NuevoNum is (Num+1),
    append(ResAux,[NuevoNum],ResAux2),
    sumar_1_aux(MasNums,ResAux2,Resultados).
sumar_1_aux([],Resultados,Resultados).
    
sumar_1([]).



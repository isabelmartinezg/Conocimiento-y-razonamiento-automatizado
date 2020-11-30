% Autor: Isabel Martínez Gómez,
%        Javier García Jiménez,
%        David Moreno López
% Fecha: 17/03/2020

 lista_colores(['Y','B','R','N','A']).

 tablero_jugador(
     [['a','y','r','n','b'],
     ['b','a','y','r','n'],
     ['n','b','a','y','r'],
     ['r','n','b','a','y'],
     ['y','r','n','b','a']]).

 linea_patrones(
     [['O'],
     ['O','O'],
     ['O','O','O'],
     ['O','O','O','O'],
     ['O','O','O','O','O']]).
     
 linea_suelo(['O','O','O','O','O','O','O']).

% Crea la bolsa inicial con los 100 azulejos y una vez creada usamos la funcion
% random_permutation para desordenar las fichas
 crear_bolsa(Bolsa):-
     lista_colores(ListaColores),
     crear_bolsa_aux([],BolsaP,ListaColores),
     random_permutation(Bolsa,BolsaP).

 crear_bolsa_aux(Bolsa,Bolsa,[]).
 crear_bolsa_aux(BolsaIn,BolsaOut,ListaColores):-
     nth1(1,ListaColores,Color),
     select(Color,ListaColores,ListaColoresAux),
     generar_lista_color(20,Color,[],ListaColor),
     append(BolsaIn,ListaColor,BolsaAux),
     crear_bolsa_aux(BolsaAux,BolsaOut,ListaColoresAux),!.

% Genera una lista de 20 azulejos de un mismo color que se usara en crear_bolsa_aux
% para iniciar la bolsa
 generar_lista_color(0,_,ListaOut,ListaOut).
 generar_lista_color(NFichas,Color,ListaAux,ListaOut):-
     append(ListaAux,[Color],ListaAux2),
     NFichasAux is NFichas - 1,
     generar_lista_color(NFichasAux,Color,ListaAux2,ListaOut).

 generar_lista_color(0,_,ListaOut,ListaOut).
 generar_lista_color(ListaIn,ListaOut,NFichas,Color):-
     append(ListaIn,[Color],ListaAux),
     NFichasAux is NFichas - 1,
     generar_lista_color(ListaAux,ListaOut,NFichasAux,Color).


% Inicia una factoria cogiendo 4 valores de la bolsa
 iniciar_factoria(Factoria,BolsaIn,BolsaOut):-
     iniciar_factoria_aux(4,[],BolsaIn,Factoria,BolsaOut).

 iniciar_factoria_aux(0,FactoriaOut,BolsaOut,FactoriaOut,BolsaOut).
 iniciar_factoria_aux(NFichasColor,FactoriaIn,Bolsa,FactoriaOut,BolsaOut):-
     nth1(NFichasColor,Bolsa,Ficha),
     select(Ficha,Bolsa,BolsaAux),
     append(FactoriaIn,[Ficha],FactoriaAux),
     NFichasColorAux  is NFichasColor - 1,
     iniciar_factoria_aux(NFichasColorAux,FactoriaAux,BolsaAux,FactoriaOut,BolsaOut),!.

 %Inicia todas las factorias de la partida
 iniciar_factorias(Factorias,NFactorias,BolsaIn,BolsaOut,ListaFichasEnJuego):-
     iniciar_factorias_aux([],Factorias,NFactorias,BolsaIn,BolsaOut,ListaFichasEnJuego,[]).

 iniciar_factorias_aux(FactoriasOut,FactoriasOut,0,BolsaOut,BolsaOut,ListaFichasEnJuego,ListaFichasEnJuego).
 iniciar_factorias_aux(FactoriasIn,FactoriasOut,NFactorias,BolsaIn,BolsaOut,ListaFichasEnJuego,ListaFichasEnJuegoIn):-
    iniciar_factoria(Factoria,BolsaIn,BolsaAux),
    append(FactoriasIn,[Factoria],FactoriasAux),
    append(ListaFichasEnJuegoIn,Factoria,ListaFichasEnJuegoAux),
    NFactoriasAux is NFactorias - 1,
    iniciar_factorias_aux(FactoriasAux,FactoriasOut,NFactoriasAux,BolsaAux,BolsaOut,ListaFichasEnJuego,ListaFichasEnJuegoAux),!.


% Coge el color de la factoria o la mesa seleccionado por el usuario y lo retira de la factoria o centro de la mesa
 coger_color_factoria_o_mesa(ListaAzulejos,FactoriaIn,FactoriaOut,CentroMesa,CentroMesaOut,Color,Num):-
     coger_color_factoria_o_mesa_aux([],ListaAzulejos,FactoriaIn,FactoriaOut,CentroMesa,CentroMesaOut,Color,Num).

% Diferenciamos el centro de la mesa con un 1
 coger_color_factoria_o_mesa_aux(ListaAzulejosIn,ListaAzulejosOut,[],[],CentroMesa,CentroMesaOut,Color,1):-
    select(Color,CentroMesa,CentroMesaAux),
    append(ListaAzulejosIn,[Color],ListaAzulejosAux),
    coger_color_factoria_o_mesa_aux(ListaAzulejosAux,ListaAzulejosOut,[],[],CentroMesaAux,CentroMesaOut,Color,1),!.
 coger_color_factoria_o_mesa_aux(ListaAzulejosOut,ListaAzulejosOut,[],[],CentroMesaOut,CentroMesaOut,_,1).

% Diferenciamos la factoria con un 2
 coger_color_factoria_o_mesa_aux(ListaAzulejosIn,ListaAzulejosOut,FactoriaIn,FactoriaOut,_,_,Color,2):-
    select(Color,FactoriaIn,FactoriaAux),
    append(ListaAzulejosIn,[Color],ListaAzulejosAux),
    coger_color_factoria_o_mesa_aux(ListaAzulejosAux,ListaAzulejosOut,FactoriaAux,FactoriaOut,_,_,Color,2),!.
 coger_color_factoria_o_mesa_aux(ListaAzulejosOut,ListaAzulejosOut,FactoriaOut,FactoriaOut,_,_,_,2).


% Inserta los azulejos en la linea de patrones seleccionada por el usuario
 insertar_ficha_linea_patrones(NLinea,ListaAzulejos,Color,LineaPatronesIn,LineaPatronesOut,LineaSueloIn,LineaSueloOut,Tablero):-
    insertar_ficha_linea_patrones_aux(NLinea,ListaAzulejos,Color,LineaPatronesIn,LineaPatronesOut,LineaSueloIn,LineaSueloOut,Tablero).
    
% En caso de que todas las comprobaciones sean validas se insertan los azulejos a la linea de patron
 insertar_ficha_linea_patrones_aux(_,[],_,LineaPatronesOut,LineaPatronesOut,LineaSueloOut,LineaSueloOut,_).
  insertar_ficha_linea_patrones_aux(NLinea,ListaAzulejos,Color,LineaPatronesIn,LineaPatronesOut,LineaSueloIn,LineaSueloOut,Tablero):-
    nth1(NLinea,LineaPatronesIn,Fila),
    nth1(NLinea,Tablero,FilaTablero),
    comprobar_huecos_libres(Fila),
    comprobar_color_linea_patrones(Fila,Color),
    not(comprobar_color_linea_tablero(FilaTablero,Color)),
    select(Color,ListaAzulejos,ListaAzulejosAux),
    select('O',Fila,Color,FilaAux),
    select(Fila,LineaPatronesIn,FilaAux,LineaPatronesAux),
    insertar_ficha_linea_patrones_aux(NLinea,ListaAzulejosAux,Color,LineaPatronesAux,LineaPatronesOut,LineaSueloIn,LineaSueloOut,Tablero),!.

% En caso de que las fichas que se vayan a introducir en la linea de patrones sobrepasen el limite de espacio de la fila
% se insertan los azulejos sobrantes en la linea de suelo
 insertar_ficha_linea_patrones_aux(NLinea,ListaAzulejos,Color,LineaPatronesIn,LineaPatronesOut,LineaSueloIn,LineaSueloOut,Tablero):-
    nth1(NLinea,LineaPatronesIn,Fila),
    contar_azulejos(Fila,Color,0,ContOut),
    linea_patrones_llena(Fila,ContOut,ListaAzulejos,Sobran),
    insertar_linea_suelo(Sobran,ListaAzulejos,ListaAzulejosAux,LineaSueloIn,LineaSueloAux,Color),
    insertar_ficha_linea_patrones_aux(NLinea,ListaAzulejosAux,Color,LineaPatronesIn,LineaPatronesOut,LineaSueloAux,LineaSueloOut,Tablero),!.
    
% En caso de que el usuario desee meter en una linea de patrones un azulejo o varios con un color que ya este en la linea del tablero,
% se solicitara a este que vuelva a introducir la fila
 insertar_ficha_linea_patrones_aux(NLinea,ListaAzulejos,Color,LineaPatronesIn,LineaPatronesOut,LineaSueloIn,LineaSueloOut,Tablero):-
    nth1(NLinea,Tablero,FilaTablero),
    comprobar_color_linea_tablero(FilaTablero,Color),
    seleccionar_fila(NLineaAux),
    insertar_ficha_linea_patrones_aux(NLineaAux,ListaAzulejos,Color,LineaPatronesIn,LineaPatronesOut,LineaSueloIn,LineaSueloOut,Tablero),!.

% En caso de que en la linea de patrones haya ya azulejos, comprobaremos que el azulejo que desea insertar el usuario
% sea del mismo color
 insertar_ficha_linea_patrones_aux(NLinea,ListaAzulejos,Color,LineaPatronesIn,LineaPatronesOut,LineaSueloIn,LineaSueloOut,Tablero):-
    nth1(NLinea,LineaPatronesIn,Fila),
    not(comprobar_color_linea_patrones(Fila,Color)),
    seleccionar_fila(NLineaAux),
    insertar_ficha_linea_patrones_aux(NLineaAux,ListaAzulejos,Color,LineaPatronesIn,LineaPatronesOut,LineaSueloIn,LineaSueloOut,Tablero),!.

% En caso de que no haya espacio en la linea de patrones, los azulejos se insertaran en la linea de suelo
 insertar_ficha_linea_patrones_aux(NLinea,ListaAzulejos,Color,LineaPatronesIn,LineaPatronesOut,LineaSueloIn,LineaSueloOut,Tablero):-
    nth1(NLinea,LineaPatronesIn,Fila),
    not(comprobar_huecos_libres(Fila)),
    insertar_linea_suelo(ListaAzulejos,LineaSueloIn,LineaSueloAux,Color),
    insertar_ficha_linea_patrones_aux(_,[],Color,LineaPatronesIn,LineaPatronesOut,LineaSueloAux,LineaSueloOut,Tablero),!.


% FUNCIONES DE COMPROBACION PARA INSERTAR FICHAS EN LINEAS DE PATRONES

% Comprueba si un color dado esta en la linea de patrones
 comprobar_color_linea_patrones(Fila,_):-
    comprobar_lista_vacia(Fila).

% Comprueba si un color dado esta en la linea del tablero
 comprobar_color_linea_patrones(Fila,Color):-
    member(Color,Fila).

  comprobar_color_linea_tablero(FilaTablero,Color):-
    member(Color,FilaTablero).

% Comprueba si la linea de patrones esta vacia
 comprobar_lista_vacia(Fila):-
    nth1(1,Fila,Valor),
    Valor='O'.

% Comprueba si hay huecos libres en una linea de patrones dada
 comprobar_huecos_libres(Fila):-
    reverse(Fila,FilaAux),
    nth1(1,FilaAux,Valor),
    Valor='O'.

% Cuenta el numero de azulejos que hay en una linea de patrones dada
 contar_azulejos(_,'O',ContOut,ContOut).
 contar_azulejos([],_,ContOut,ContOut).
 contar_azulejos(Fila,Color,Cont,ContOut):-
    nth1(1,Fila,Valor),
    Valor=Color,
    select(Color,Fila,FilaAux),
    ContAux is Cont + 1,
    nth1(1,FilaAux,ColorAux),
    contar_azulejos(FilaAux,ColorAux,ContAux,ContOut),!.

% Comprueba si las fichas a insertar caben en una linea de patrones
 comprobar_si_cabe(Fila,AzulejosLinea,ListaAzulejos):-
    length(Fila,LF),
    length(ListaAzulejos,LA),
    AzulejosLineaAux is AzulejosLinea + LA,
    AzulejosLineaAux =< LF.

% Comprueba si la linea de patrones esta llena
 linea_patrones_llena(Fila,AzulejosLinea,ListaAzulejos,Sobran):-
    not(comprobar_si_cabe(Fila,AzulejosLinea,ListaAzulejos)),
    length(Fila,LF),
    length(ListaAzulejos,LA),
    AzulejosLineaAux is AzulejosLinea + LA,
    Sobran is AzulejosLineaAux - LF.
    
% Devuelve true si hay azulejos en el centro de la mesa y false en caso contrario
 comprobar_centro_mesa_lleno(ListaCentroMesa):-
    length(ListaCentroMesa,L),
    L>0.
    
% Comprueba si una factoria esta vacia
 comprobar_factoria_vacia(Factoria):-
    length(Factoria,L),
    L = 0.

% Compueba si todas las factorias estan vacias
 comprobar_factorias_vacias(_,0).
 comprobar_factorias_vacias(Factorias,NFactorias):-
    nth1(NFactorias,Factorias,Factoria),
    comprobar_factoria_vacia(Factoria),
    NFactoriasAux is NFactorias - 1,
    comprobar_factorias_vacias(Factorias,NFactoriasAux).

 comprobar_factorias_vacias(Factorias,NFactorias):-
    nth1(NFactorias,Factorias,Factoria),
    not(comprobar_factoria_vacia(Factoria)),
    false.

% Comprueba si una linea del tablero esta llena y por tanto
% usaremos esto para saber si se ha acabado el juego
 comprobar_linea_llena(FilaTablero):-
    (member('A',FilaTablero),
    member('Y',FilaTablero),
    member('R',FilaTablero),
    member('N',FilaTablero),
    member('B',FilaTablero)).

% Compueba si en un tablero hay una linea llena
 comprobar_tablero(_,6):-false.
 comprobar_tablero(Tablero,NFila):-
    nth1(NFila,Tablero,FilaTablero),
    comprobar_linea_llena(FilaTablero).

 comprobar_tablero(Tablero,NFila):-
    nth1(NFila,Tablero,FilaTablero),
    not(comprobar_linea_llena(FilaTablero)),
    NFilaAux is NFila + 1,
    comprobar_tablero(Tablero,NFilaAux).

% Comprueba si se ha acabado la partida, es decir, si
% algun jugador tiene un tablero con una linea llena
 comprobar_fin_partida(_,0):-false.
 comprobar_fin_partida(Tableros,NJugadores):-
    nth1(NJugadores,Tableros,Tablero),
    comprobar_tablero(Tablero,1).

 comprobar_fin_partida(Tableros,NJugadores):-
    nth1(NJugadores,Tableros,Tablero),
    not(comprobar_tablero(Tablero,1)),
    NJugadoresAux is NJugadores - 1,
    comprobar_fin_partida(Tableros,NJugadoresAux).

% Inserta azulejos en la linea de suelo
 insertar_linea_suelo([],LineaSueloOut,LineaSueloOut,_).
 insertar_linea_suelo(ListaAzulejos,LineaSueloIn,LineaSueloOut,Color):-
    select('O',LineaSueloIn,Color,LineaSueloAux),
    select(Color,ListaAzulejos,ListaAzulejosAux),
    insertar_linea_suelo(ListaAzulejosAux,LineaSueloAux,LineaSueloOut,Color),!.

% ACTUALIZAR FICHAS DEL CENTRO DE LA MESA
% Tanto para la factoria como el centro de la mesa
 actualizar_fichas_centro_mesa(ListaAzulejos,FactoriaIn,FactoriaOut,ListaCentroIn,ListaCentroOut,NFichas,Num):-
     actualizar_fichas_centro_mesa_aux(ListaAzulejos,FactoriaIn,FactoriaOut,ListaCentroIn,ListaCentroOut,NFichas,Num).

 %Cuando se seleccionan azulejos del centro de la mesa se borran estos azulejos del centro de la mesa
 actualizar_fichas_centro_mesa_aux(ListaAzulejos,[],[],ListaCentroIn,ListaCentroOut,_,1):-
    nth1(1,ListaAzulejos,Color),
    select(Color,ListaAzulejos,ListaAzulejosAux),
    select(Color,ListaCentroIn,ListaCentroAux),
    actualizar_fichas_centro_mesa_aux(ListaAzulejosAux,[],_,ListaCentroAux,ListaCentroOut,_,1),!.
 actualizar_fichas_centro_mesa_aux([],[],[],ListaCentroOut,ListaCentroOut,_,1).

 %Cuando se seleccionan azulejos de una factoria, se insertan los azulejos sobrantes en el centro de la mesa
 actualizar_fichas_centro_mesa_aux(_,FactoriaIn,FactoriaOut,ListaCentroIn,ListaCentroOut,NFichas,2):-
    nth1(1,FactoriaIn,Color),
    select(Color,FactoriaIn,FactoriaAux),
    NFichasAux is NFichas - 1,
    append(ListaCentroIn,[Color],ListaCentroAux),
    actualizar_fichas_centro_mesa_aux(_,FactoriaAux,FactoriaOut,ListaCentroAux,ListaCentroOut,NFichasAux,2),!.
 actualizar_fichas_centro_mesa_aux(_,FactoriaOut,FactoriaOut,ListaCentroOut,ListaCentroOut,0,2).

% Elimina las fichas que se han utilizado de las fichas que estan en juego
 eliminar_fichas_en_juego(0,_,ListaFichasEnJuegoOut,ListaFichasEnJuegoOut).
 eliminar_fichas_en_juego(NFichas,Color,ListaFichasEnJuego,ListaFichasEnJuegoOut):-
    select(Color,ListaFichasEnJuego,ListaFichasEnJuegoAux),
    NFichasAux is NFichas - 1,
    eliminar_fichas_en_juego(NFichasAux,Color,ListaFichasEnJuegoAux,ListaFichasEnJuegoOut),!.


 alicatar_fila('O',FilaIn,FilaOut,CajaFichasIn,CajaFichasOut,_):-
    alicatar_fila_aux('O',FilaIn,FilaOut,CajaFichasIn,CajaFichasOut,0),!.

 alicatar_fila(UltimoAzulejo,FilaIn,FilaOut,CajaFichasIn,CajaFichasOut,L):-
    alicatar_fila_aux(UltimoAzulejo,FilaIn,FilaOut,CajaFichasIn,CajaFichasOut,L).

 alicatar_fila_aux(_,FilaOut,FilaOut,CajaFichasOut,CajaFichasOut,0).
 alicatar_fila_aux(UltimoAzulejo,FilaIn,FilaOut,CajaFichasIn,CajaFichasOut,L):-
    append(CajaFichasIn,[UltimoAzulejo],CajaFichasAux),
    select(UltimoAzulejo,FilaIn,'O',FilaAux),
    LAux is L - 1,
    alicatar_fila_aux(UltimoAzulejo,FilaAux,FilaOut,CajaFichasAux,CajaFichasOut,LAux),!.

 alicatar_tablero('O',_,TableroOut,TableroOut,FilaOut,FilaOut).
 alicatar_tablero(UltimoAzulejo,NFila,TableroIn,TableroOut,FilaIn,FilaOut):-
    select(UltimoAzulejo,FilaIn,'O',FilaOut),
    nth1(NFila,TableroIn,FilaTablero),
    downcase_atom(UltimoAzulejo,ColorMinuscula),
    select(ColorMinuscula,FilaTablero,UltimoAzulejo,FilaTableroAux),
    select(FilaTablero,TableroIn,FilaTableroAux,TableroOut).

 alicatar_linea_patrones(LineaPatronesIn,LineaPatronesOut,TableroIn,TableroOut,CajaFichasIn,CajaFichasOut):-
   alicatar_linea_patrones_aux(LineaPatronesIn,LineaPatronesOut,TableroIn,TableroOut,CajaFichasIn,CajaFichasOut,1).

 alicatar_linea_patrones_aux(LineaPatronesOut,LineaPatronesOut,TableroOut,TableroOut,CajaFichasOut,CajaFichasOut,6).
 alicatar_linea_patrones_aux(LineaPatronesIn,LineaPatronesOut,TableroIn,TableroOut,CajaFichasIn,CajaFichasOut,NFila):-
    nth1(NFila,LineaPatronesIn,FilaIn),
    length(FilaIn,LAux),
    nth1(LAux,FilaIn,UltimoAzulejo),
    L is LAux - 1,
    alicatar_fila(UltimoAzulejo,FilaIn,FilaOut,CajaFichasIn,CajaFichasAux,L),
    alicatar_tablero(UltimoAzulejo,NFila,TableroIn,TableroAux,FilaOut,FilaAux),
    select(FilaIn,LineaPatronesIn,FilaAux,LineaPatronesAux),
    NFilaAux is NFila + 1,
    alicatar_linea_patrones_aux(LineaPatronesAux,LineaPatronesOut,TableroAux,TableroOut,CajaFichasAux,CajaFichasOut,NFilaAux),!.

 alicatado_pared(LineasPatronesOut,LineasPatronesOut,TablerosOut,TablerosOut,CajaFichasOut,CajaFichasOut,LineasSueloOut,LineasSueloOut,0,_).
 alicatado_pared(LineasPatronesIn,LineasPatronesOut,TablerosIn,TablerosOut,CajaFichasIn,CajaFichasOut,LineasSueloIn,LineasSueloOut,NJugadores,NJugador):-
    nth1(NJugador,LineasPatronesIn,LineaPatronesIn),
    nth1(NJugador,TablerosIn,TableroIn),
    alicatar_linea_patrones(LineaPatronesIn,LineaPatronesOut,TableroIn,TableroOut,CajaFichasIn,CajaFichasAux),
    select(LineaPatronesIn,LineasPatronesIn,LineaPatronesOut,LineasPatronesAux),
    select(TableroIn,TablerosIn,TableroOut,TablerosAux),
    nth1(NJugador,LineasSueloIn,LineaSueloIn),
    vaciar_linea_suelo(LineaSueloIn,LineaSueloAux,CajaFichasAux,CajaFichasAux2,7),
    select(LineaSueloIn,LineasSueloIn,LineaSueloAux,LineasSueloAux),
    NJugadoresAux is NJugadores - 1,
    NJugadorAux is NJugador + 1,
    alicatado_pared(LineasPatronesAux,LineasPatronesOut,TablerosAux,TablerosOut,CajaFichasAux2,CajaFichasOut,LineasSueloAux,LineasSueloOut,NJugadoresAux,NJugadorAux),!.

% Vacia la linea de suelo, pone todo a 'O'
 vaciar_linea_suelo(LineaSueloIn,LineaSueloOut,CajaFichasIn,CajaFichasOut,NFichas):-
    vaciar_linea_suelo_aux(LineaSueloIn,LineaSueloOut,CajaFichasIn,CajaFichasOut,NFichas).

 vaciar_linea_suelo_aux(LineaSueloOut,LineaSueloOut,CajaFichasOut,CajaFichasOut,0).
 vaciar_linea_suelo_aux(LineaSueloIn,LineaSueloOut,CajaFichasIn,CajaFichasOut,NFichas):-
    nth1(NFichas,LineaSueloIn,Elem),
    NFichasAux is NFichas - 1,
    Elem\='O',
    select(Elem,LineaSueloIn,'O',LineaSueloAux),
    append(CajaFichasIn,[Elem],CajaFichasAux),
    vaciar_linea_suelo_aux(LineaSueloAux,LineaSueloOut,CajaFichasAux,CajaFichasOut,NFichasAux).

 vaciar_linea_suelo_aux(LineaSueloIn,LineaSueloOut,CajaFichasIn,CajaFichasOut,NFichas):-
    nth1(NFichas,LineaSueloIn,Elem),
    NFichasAux is NFichas - 1,
    not(Elem\='O'),
    vaciar_linea_suelo_aux(LineaSueloIn,LineaSueloOut,CajaFichasIn,CajaFichasOut,NFichasAux).


 %FUNCIONES PARA PEDIR DATOS POR TECLADO:
 seleccionar_factoria_o_mesa(Factoria,Color,NFactorias,Factorias,CentroMesa,Num,ListaCentroMesa):-
    comprobar_centro_mesa_lleno(ListaCentroMesa),
    not(comprobar_factorias_vacias(Factorias,NFactorias)),
    repeat,
    write("Introduce 1 para seleccionar azulejos del centro de la mesa o 2 para seleccionar azulejos de una factoria "),
    read(Num),
    (Num=1;Num=2),
    seleccionar_azulejos(Factoria,Color,NFactorias,Factorias,CentroMesa,Num).

 seleccionar_factoria_o_mesa(Factoria,Color,NFactorias,Factorias,CentroMesa,Num,ListaCentroMesa):-
    not(comprobar_centro_mesa_lleno(ListaCentroMesa)),
    repeat,
    writeln("¡¡¡¡¡ CENTRO VACIO !!!!! "),
    write("Introduce 2 para seleccionar azulejos de una factoria "),
    read(Num),
    Num=2,
    seleccionar_azulejos(Factoria,Color,NFactorias,Factorias,CentroMesa,Num).

  seleccionar_factoria_o_mesa(Factoria,Color,NFactorias,Factorias,CentroMesa,Num,_):-
    comprobar_factorias_vacias(Factorias,NFactorias),
    repeat,
    writeln("¡¡¡¡¡ FACTORIAS VACIAS !!!!! "),
    write("Introduce 1 para seleccionar azulejos del centro de la mesa "),
    read(Num),
    Num=1,
    seleccionar_azulejos(Factoria,Color,NFactorias,Factorias,CentroMesa,Num).

 seleccionar_fila(NFila):-
    repeat,
    write("Numero de fila de la linea de patrones: "),
    read(NFila),
    (NFila>0;NFila<6),!.

 seleccionar_azulejos(_,Color,_,_,CentroMesa,1):-
    repeat,
    write("Introduce color del azulejo "),
    read(Color),
    member(Color,CentroMesa),!.

 seleccionar_azulejos(Factoria,Color,NFactorias,Factorias,_,2):-
    repeat,
    write("Número de factoría que desea seleccionar "),
    read(NFactoria),
    integer(NFactoria),
    NFactoria =< NFactorias,!,
    nth1(NFactoria,Factorias,Factoria),
    repeat,
    write("Color que desea seleccionar "),
    read(Color),
    member(Color,Factoria),!.

 %FUNCIONES PARA IMPRIMIR: Factorias, linea de patrones, tablero, centro de la mesa
 imprimir_factorias(_,_,0).
 imprimir_factorias(Factorias,NFactoria,NFactorias):-
    write("Factoria "),write(NFactoria),write(": "),
    nth1(NFactoria,Factorias,Factoria),
    writeln(Factoria),
    NFactoriaAux is NFactoria + 1,
    NFactoriasAux is NFactorias - 1,
    imprimir_factorias(Factorias,NFactoriaAux,NFactoriasAux),!.

 imprimir_linea_patrones(_,_,0).
 imprimir_linea_patrones(LineaPatrones,NFila,NFilas):-
    nth1(NFila,LineaPatrones,Fila),
    write(Fila),nl,
    NFilaAux is NFila + 1,
    NFilasAux is NFilas - 1,
    imprimir_linea_patrones(LineaPatrones,NFilaAux,NFilasAux),!.

 imprimir_tablero(_,_,0).
 imprimir_tablero(Tablero,NFila,NFilas):-
    nth1(NFila,Tablero,Fila),
    write(Fila),nl,
    NFilaAux is NFila + 1,
    NFilasAux is NFilas - 1,
    imprimir_tablero(Tablero,NFilaAux,NFilasAux),!.


 %FUNCIONES PARA INICIALIZAR TANTAS ESTRUCTURAS COMO JUGADORES HAYA: lineas patrones, tableros
 iniciar_lineas_patrones(LineasPatrones,NJugadores):-
    iniciar_lineas_patrones_aux([],LineasPatrones,NJugadores).

 iniciar_lineas_patrones_aux(LineasPatronesOut,LineasPatronesOut,0).
 iniciar_lineas_patrones_aux(LineasPatronesIn,LineasPatronesOut,NJugadores):-
    linea_patrones(LineaPatrones),
    append(LineasPatronesIn,[LineaPatrones],LineasPatronesAux),
    NJugadoresAux is NJugadores - 1,
    iniciar_lineas_patrones_aux(LineasPatronesAux,LineasPatronesOut,NJugadoresAux),!.
    
 iniciar_lineas_suelo(LineasSuelo,NJugadores):-
    iniciar_lineas_suelo_aux([],LineasSuelo,NJugadores).

 iniciar_lineas_suelo_aux(LineasSueloOut,LineasSueloOut,0).
 iniciar_lineas_suelo_aux(LineasSueloIn,LineasSueloOut,NJugadores):-
    linea_suelo(LineaSuelo),
    append(LineasSueloIn,[LineaSuelo],LineasSueloAux),
    NJugadoresAux is NJugadores - 1,
    iniciar_lineas_suelo_aux(LineasSueloAux,LineasSueloOut,NJugadoresAux),!.

 iniciar_tableros(Tableros,NJugadores):-
    iniciar_tableros_aux([],Tableros,NJugadores).

 iniciar_tableros_aux(TablerosOut,TablerosOut,0).
 iniciar_tableros_aux(TablerosIn,TablerosOut,NJugadores):-
    tablero_jugador(Tablero),
    append(TablerosIn,[Tablero],TablerosAux),
    NJugadoresAux is NJugadores - 1,
    iniciar_tableros_aux(TablerosAux,TablerosOut,NJugadoresAux),!.

 iniciar_jugadores_factorias(NJugadores,NFactorias):-
    iniciar_jugadores_factorias_aux(NJugadores,NFactorias).

 iniciar_jugadores_factorias_aux(2,5).
 iniciar_jugadores_factorias_aux(3,7).
 iniciar_jugadores_factorias_aux(4,9).

 seleccionar_num_jugadores(NJugadores):-
    repeat,
    write("Introduce número de jugadores "),
    read(NJugadores),
    integer(NJugadores),
    (NJugadores>1,NJugadores<5),!.

% FUNCION QUE EJECUTAMOS PARA ARRANCAR LA PARTIDA
 iniciar_partida(LineasPatronesFinal,TablerosOut,LineasSueloOut,CajaFichasOut):-
    CajaFichasIn=[],
    seleccionar_num_jugadores(NJugadores),
    crear_bolsa(Bolsa),
    iniciar_lineas_patrones(LineasPatrones,NJugadores),
    iniciar_tableros(Tableros,NJugadores),
    iniciar_lineas_suelo(LineasSuelo,NJugadores),
    partida(Bolsa,LineasPatrones,LineasPatronesFinal,Tableros,TablerosOut,CajaFichasIn,CajaFichasOut,LineasSuelo,LineasSueloOut,NJugadores).

% FUNCION EN LA QUE INICIALIZAMOS LAS ESTRUCTURAS Y COMPROBAMOS EL FIN DE PARTIDA
 partida([],LineasPatronesFinal,LineasPatronesFinal,TablerosOut,TablerosOut,[],[],LineasSueloOut,LineasSueloOut,_).
 partida([],LineasPatronesIn,LineasPatronesFinal,TablerosIn,TablerosOut,CajaFichasIn,CajaFichasOut,LineasSueloIn,LineasSueloOut,NJugadores):-
    append([],CajaFichasIn,Bolsa),
    partida(Bolsa,LineasPatronesIn,LineasPatronesFinal,TablerosIn,TablerosOut,CajaFichasIn,CajaFichasOut,LineasSueloIn,LineasSueloOut,NJugadores).
 
 partida(Bolsa,LineasPatronesIn,LineasPatronesFinal,TablerosIn,TablerosOut,CajaFichasIn,CajaFichasOut,LineasSueloIn,LineasSueloOut,NJugadores):-
    not(comprobar_fin_partida(TablerosIn,NJugadores)),
    iniciar_jugadores_factorias(NJugadores,NFactorias),
    iniciar_factorias(FactoriasIn,NFactorias,Bolsa,BolsaOut,ListaFichasEnJuego),
    oferta_factoria(NFactorias,FactoriasIn,ListaFichasEnJuego,LineasPatronesIn,LineasPatronesOut,TablerosIn,[],0,NJugadores,LineasSueloIn,LineasSueloAux),
    alicatado_pared(LineasPatronesOut,LineasPatronesAux,TablerosIn,TablerosAux,CajaFichasIn,CajaFichasAux,LineasSueloAux,LineasSueloAux2,NJugadores,1),
    partida(BolsaOut,LineasPatronesAux,LineasPatronesFinal,TablerosAux,TablerosOut,CajaFichasAux,CajaFichasOut,LineasSueloAux2,LineasSueloOut,NJugadores),!.
    
 partida(_,_,_,_,TablerosOut,_,_,_,_,NJugadores):-
    comprobar_fin_partida(TablerosOut,NJugadores),
    writeln(" ¡¡¡¡¡¡¡ FIN DE LA PARTIDA !!!!!!! ").

 oferta_factoria(NFactorias,FactoriasIn,ListaFichasEnJuego,LineasPatronesIn,LineasPatronesOut,Tableros,ListaCentro,Turno,NJugadores,LineasSueloIn,LineasSueloOut):-
    oferta_factoria_aux(NFactorias,FactoriasIn,ListaFichasEnJuego,LineasPatronesIn,LineasPatronesOut,Tableros,ListaCentro,Turno,NJugadores,LineasSueloIn,LineasSueloOut).

% FUNCION QUE SE ENCARGA DE LA OFERTA FACTORIA DEL JUEGO
 oferta_factoria_aux(_,_,[],LineasPatronesOut,LineasPatronesOut,_,_,_,_,LineasSueloOut,LineasSueloOut).
 oferta_factoria_aux(NFactorias,FactoriasIn,ListaFichasEnJuego,LineasPatronesIn,LineasPatronesOut,Tableros,ListaCentro,Turno,NJugadores,LineasSueloIn,LineasSueloOut):-
    NumeroJugador is mod(Turno,NJugadores) + 1,
    write("     JUGADOR "),write(NumeroJugador),writeln(" "),
    imprimir_factorias(FactoriasIn,1,NFactorias),
    nth1(NumeroJugador,LineasSueloIn,LineaSueloIn),
    write("LINEA DE SUELO "),writeln(LineaSueloIn),
    write("CENTRO MESA "),writeln(ListaCentro),
    nth1(NumeroJugador,LineasPatronesIn,LineaPatrones),
    writeln("LINEA DE PATRONES "),imprimir_linea_patrones(LineaPatrones,1,5),
    nth1(NumeroJugador,Tableros,Tablero),
    writeln("TABLERO "),imprimir_tablero(Tablero,1,5),writeln(" "),
    seleccionar_factoria_o_mesa(Factoria,Color,NFactorias,FactoriasIn,ListaCentro,Num,ListaCentro),
    coger_color_factoria_o_mesa(ListaAzulejos,Factoria,FactoriaOut1,ListaCentro,ListaCentroOut,Color,Num),
    length(ListaAzulejos,NFichas),
    writeln("LINEA DE PATRONES "),imprimir_linea_patrones(LineaPatrones,1,5),
    seleccionar_fila(NFila),
    nth1(NumeroJugador,Tableros,Tablero),
    insertar_ficha_linea_patrones(NFila,ListaAzulejos,Color,LineaPatrones,LineaPatronesAux,LineaSueloIn,LineaSueloOut,Tablero),
    select(LineaSueloIn,LineasSueloIn,LineaSueloOut,LineasSueloAux),
    select(LineaPatrones,LineasPatronesIn,LineaPatronesAux,LineasPatronesAux),
    eliminar_fichas_en_juego(NFichas,Color,ListaFichasEnJuego,ListaFichasEnJuegoOut),
    imprimir_linea_patrones(LineaPatronesAux,1,5),
    write("LINEA DE SUELO "),writeln(LineaSueloOut),
    writeln("TABLERO "),imprimir_tablero(Tablero,1,5),writeln(" "),
    length(FactoriaOut1,NFichasCentroMesa),
    actualizar_fichas_centro_mesa(ListaAzulejos,FactoriaOut1,FactoriaOut,ListaCentro,ListaCentroOut,NFichasCentroMesa,Num),
    select(Factoria,FactoriasIn,FactoriaOut,FactoriasAux),
    TurnoAux is Turno + 1,
    oferta_factoria_aux(NFactorias,FactoriasAux,ListaFichasEnJuegoOut,LineasPatronesAux,LineasPatronesOut,Tableros,ListaCentroOut,TurnoAux,NJugadores,LineasSueloAux,LineasSueloOut),!.
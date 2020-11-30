
% --------------- DICCIONARIO ESPANOL -----------------

  articulo(m(art_1),f,sg,per3) --> [una].
  articulo(m(art_1),m,sg,per3) --> [un].
  articulo(m(art_2),f,sg,per3) --> [la].
  articulo(m(art_2),m,sg,per3) --> [el].
  articulo(m(art_2),f,pl,per3) --> [las].
  articulo(m(art_4),_,sg,per3) --> [mi].

  preposicion(z(prep_1)) --> [a].
  preposicion(z(prep_2)) --> [en].
  preposicion(z(prep_3)) --> [de].
  
  pronombre_relativo(rp(relpron_1)) --> [que].
  
  conjuncion(c(conj_1)) --> [y].

  nombre(n(n_1),f,sg,per3,c) --> [piedra].
  nombre(n(n_2),m,sg,per3,c) --> [papel].
  nombre(n(n_3),f,pl,per3,c) --> [tijeras].
  nombre(n(n_4),m,sg,per3,c) --> [hombre].
  nombre(n(n_5),f,sg,per3,c) --> [manzana].
  nombre(n(n_5),f,pl,per3,c) --> [manzanas].
  nombre(n(n_6),m,sg,per3,p) --> [juan].
  nombre(n(n_7),f,sg,per3,p) --> [maria].
  nombre(n(n_8),m,sg,per3,c) --> [gato].
  nombre(n(n_9),m,sg,per3,c) --> [raton].
  nombre(n(n_10),f,sg,per3,c) --> [universidad].
  nombre(n(n_11),m,sg,per3,c) --> [alumno].
  nombre(n(n_12),m,sg,per3,c) --> [perro].
  nombre(n(n_13),m,sg,per3,c) --> [jardin].
  nombre(n(n_14),m,sg,per3,c) --> [vecino].
  nombre(n(n_15),m,sg,per3,c) --> [canario].
  nombre(n(n_16),m,sg,per3,c) --> [cafe].
  nombre(n(n_17),m,sg,per3,c) --> [periodico].
  nombre(n(n_18),m,sg,per3,p) --> [oscar].
  nombre(n(n_19),_,sg,per3,p) --> [wilde].
  nombre(n(n_20),m,sg,per3,c) --> [fantasma].
  nombre(n(n_21),_,sg,per3,p) --> [canterville].

  pronombre(p(pron_1),per3,m,pl) --> [ellos].
  pronombre(p(pron_2),per2,_,sg) --> [tu].
  pronombre(p(pron_3),per3,_,sg) --> [que].

  adjetivo(a(adj_1),_,sg) --> [grande].
  adjetivo(a(adj_2),_,sg) --> [gris].
  adjetivo(a(adj_3),f,sg) --> [roja].
  adjetivo(a(adj_4),m,sg) --> [negro].
  adjetivo(a(adj_5),m,sg) --> [amarillo].
  adjetivo(a(adj_6),m,sg) --> [delgado].
  adjetivo(a(adj_7),f,sg) --> [alta].
  
  adverbio(f(adv_1)) --> [ayer].
  adverbio(f(adv_2)) --> [muy].
  adverbio(f(adv_3)) --> [bien].

  verbo(v(v_1),sg,per3,ne) --> [corta].
  verbo(v(v_2),sg,per3,ne) --> [envuelve].
  verbo(v(v_3),sg,per3,ne) --> [rompe].
  verbo(v(v_1),pl,per3,ne) --> [cortan].
  verbo(v(v_2),pl,per3,ne) --> [envuelven].
  verbo(v(v_3),pl,per3,ne) --> [rompen].
  verbo(v(v_4),sg,per3,ne) --> [come].
  verbo(v(v_4),sg,per2,ne) --> [comes].
  verbo(v(v_4),pl,per3,ne) --> [comen].
  verbo(v(v_5),sg,per3,e) --> [ama].
  verbo(v(v_6),sg,per3,ne) --> [estudia].
  verbo(v(v_7),sg,per3,ne) --> [persiguio].
  verbo(v(v_8),sg,per3,ne) --> [es].
  verbo(v(v_9),pl,per1,ne) --> [vimos].
  verbo(v(v_10),sg,per3,ne) --> [canta].
  verbo(v(v_11),sg,per3,ne) --> [toma].
  verbo(v(v_12),sg,per3,ne) --> [lee].
  verbo(v(v_13),sg,per3,ne) --> [escribio].
  
  %sg: singular           pl: plural
  %m: masculino           f: femenino
  %per: persona
  %e: verbo especial      ne: verbo no especial
  %c: nombre comun        p: nombre propio
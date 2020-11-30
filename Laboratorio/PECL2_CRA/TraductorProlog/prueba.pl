:-[draw,diccionarioEspanol,diccionarioIngles,gramaticaEspanol,gramaticaIngles].

error:- write("Error"), write('\n').

% -------------------------------------- PRUEBAS ESPAÑOL ---------------------------------------------

  pruebaE1:- oracion(X, [el, hombre, come, una, manzana], []), draw(X), write(X), write('\n').
  pruebaE1:- error.
  pruebaE2:- oracion(X, [ellos, comen, manzanas], []), draw(X), write(X), write('\n').
  pruebaE2:- error.
  pruebaE3:- oracion(X, [tu, comes, una, manzana, roja], []), draw(X), write(X), write('\n').
  pruebaE3:- error.
  pruebaE4:- oracion(X, [juan, ama, a, maria], []), draw(X),write(X), write('\n').
  pruebaE4:- error.
  pruebaE5:- oracion(X, [el, gato, grande, come, un, raton, gris], []), draw(X), write(X), write('\n').
  pruebaE5:- error.
  pruebaE6:- oracion(X, [juan, estudia, en, la, universidad], []), draw(X), write(X), write('\n').
  pruebaE6:- error.
  pruebaE7:- oracion(X, [el, alumno, ama, la, universidad], []), draw(X), write(X), write('\n').
  pruebaE7:- error.
  pruebaE8:- oracion(X, [el, perro, persiguio, un, gato, negro, en, el, jardin], []), draw(X), write(X), write('\n').
  pruebaE8:- error.
  pruebaE9:- oracion(X, [la, universidad, es, grande], []), draw(X), write(X), write('\n').
  pruebaE9:- error.
  pruebaE10:- oracion(X, [el, hombre, que, vimos, ayer, es, mi, vecino], []), draw(X), write(X), write('\n').
  pruebaE10:- error.
  pruebaE11:- oracion(X, [el, canario, amarillo, canta, muy, bien], []), draw(X), write(X), write('\n').
  pruebaE11:- error.
  pruebaE12:- oracion(X, [juan, toma, un, cafe, y, lee, el, periodico], []),draw(X), write(X), write('\n').
  pruebaE12:- error.
  pruebaE13:- oracion(X, [juan, es, delgado, y, maria, es, alta], []),draw(X), write(X), write('\n').
  pruebaE13:- error.
  pruebaE14:- oracion(X, [oscar, wilde, escribio, el, fantasma, de, canterville], []), draw(X), write(X), write('\n').
  pruebaE14:- error.

  pruebaEspanol:-write('-------------- PRUEBA ESPANOL --------------\n'),
                       pruebaE1,
                       pruebaE2,
                       pruebaE3,
                       pruebaE4,
                       pruebaE5,
                       pruebaE6,
                       pruebaE7,
                       pruebaE8,
                       pruebaE9,
                       pruebaE10,
                       pruebaE11,
                       pruebaE12,
                       pruebaE13,
                       pruebaE14.


  % -------------------------------------- PRUEBAS INGLES ---------------------------------------------

  pruebaI1:- sentence(X, [the, man, eats, an, apple], []), draw(X), write(X), write('\n').
  pruebaI1:- error.
  pruebaI2:- sentence(X, [they, eat, some, apples], []), draw(X), write(X), write('\n').
  pruebaI2:- error.
  pruebaI3:- sentence(X, [you, eat, a, red, apple], []), draw(X), write(X), write('\n').
  pruebaI3:- error.
  pruebaI4:- sentence(X, [john, loves, mary], []), draw(X), write(X), write('\n').
  pruebaI4:- error.
  pruebaI5:- sentence(X, [the, big, cat, eats, a, grey, mouse], []), draw(X), write(X), write('\n').
  pruebaI5:- error.
  pruebaI6:- sentence(X, [john, studies, at, university], []), draw(X), write(X), write('\n').
  pruebaI6:- error.
  pruebaI7:- sentence(X, [the, student, loves, university], []), draw(X), write(X), write('\n').
  pruebaI7:- error.
  pruebaI8:- sentence(X, [the, dog, chased, a, black, cat, in, the, garden], []), draw(X), write(X), write('\n').
  pruebaI8:- error.
  pruebaI9:- sentence(X, [the, university, is, large], []), draw(X), write(X), write('\n').
  pruebaI9:- error.
  pruebaI10:- sentence(X, [the, man, that, we, saw, yesterday, is, my, neighbour], []), draw(X), write(X), write('\n').
  pruebaI10:- error.
  pruebaI11:- sentence(X, [the, yellow, canary, sings, very, well], []),draw(X), write(X), write('\n').
  pruebaI11:- error.
  pruebaI12:- sentence(X, [john, has, a, coffee, and, reads, the, newspaper], []), draw(X), write(X), write('\n').
  pruebaI12:- error.
  pruebaI13:- sentence(X, [john, is, thin, and, mary, is, tall], []), draw(X), write(X), write('\n').
  pruebaI13:- error.
  pruebaI14:- sentence(X, [oscar, wilde, wrote, the, canterville, ghost], []), draw(X), write(X), write('\n').
  pruebaI14:- error.

  pruebaIngles:- write('-------------- PRUEBA INGLES --------------\n'),
                       pruebaI1,
                       pruebaI2,
                       pruebaI3,
                       pruebaI4,
                       pruebaI5,
                       pruebaI6,
                       pruebaI7,
                       pruebaI8,
                       pruebaI9,
                       pruebaI10,
                       pruebaI11,
                       pruebaI12,
                       pruebaI13,
                       pruebaI14.


  % -------------------------------- ESPAÑOL TO INGLES --------------------------------------------

  pruebaEtoI1:- oracion(X, [el, hombre, come, una, manzana], []), sentence(X,Ingles,[]), write(Ingles), write('\n').
  pruebaEtoI1:- error.
  pruebaEtoI2:- oracion(X, [ellos, comen, manzanas], []), sentence(X,Ingles,[]), write(Ingles), write('\n').
  pruebaEtoI2:- error.
  pruebaEtoI3:- oracion(X, [tu, comes, una, manzana,  roja], []), sentence(X,Ingles,[]), write(Ingles), write('\n').
  pruebaEtoI3:- error.
  pruebaEtoI4:- oracion(X, [juan, ama, a, maria], []), sentence(X,Ingles,[]), write(Ingles), write('\n').
  pruebaEtoI4:- error.
  pruebaEtoI5:- oracion(X, [el, gato, grande, come, un, raton, gris], []), sentence(X,Ingles,[]), write(Ingles), write('\n').
  pruebaEtoI5:- error.
  pruebaEtoI6:- oracion(X, [juan, estudia, en, la, universidad], []), sentence(X,Ingles,[]), write(Ingles), write('\n').
  pruebaEtoI6:- error.
  pruebaEtoI7:- oracion(X, [el, alumno, ama, la, universidad], []), sentence(X,Ingles,[]), write(Ingles), write('\n').
  pruebaEtoI7:- error.
  pruebaEtoI8:- oracion(X, [el, perro, persiguio, un, gato, negro, en, el, jardin], []), sentence(X,Ingles,[]), write(Ingles), write('\n').
  pruebaEtoI8:- error.
  pruebaEtoI9:- oracion(X, [la, universidad, es, grande], []), sentence(X,Ingles,[]), write(Ingles), write('\n').
  pruebaEtoI9:- error.
  pruebaEtoI10:- oracion(X, [el, hombre, que, vimos, ayer, es, mi, vecino], []), sentence(X,Ingles,[]), write(Ingles), write('\n').
  pruebaEtoI10:- error.
  pruebaEtoI11:- oracion(X, [el, canario, amarillo, canta, muy, bien], []), sentence(X,Ingles,[]), write(Ingles), write('\n').
  pruebaEtoI11:- error.
  pruebaEtoI12:- oracion(X, [juan, toma, un, cafe, y, lee, el, periodico], []), sentence(X,Ingles,[]), write(Ingles), write('\n').
  pruebaEtoI12:- error.
  pruebaEtoI13:- oracion(X, [juan, es, delgado, y, maria, es, alta], []), sentence(X,Ingles,[]), write(Ingles), write('\n').
  pruebaEtoI13:- error.
  pruebaEtoI14:- oracion(X, [oscar, wilde, escribio, el, fantasma, de, canterville], []), sentence(X,Ingles,[]), write(Ingles), write('\n').
  pruebaEtoI14:- error.


  pruebaEspanolIngles:- write('-------------- SPANISH - ENGLISH --------------\n'),
                      pruebaEtoI1,
                      pruebaEtoI2,
                      pruebaEtoI3,
                      pruebaEtoI4,
                      pruebaEtoI5,
                      pruebaEtoI6,
                      pruebaEtoI7,
                      pruebaEtoI8,
                      pruebaEtoI9,
                      pruebaEtoI10,
                      pruebaEtoI11,
                      pruebaEtoI12,
                      pruebaEtoI13,
                      pruebaEtoI14.


  % -------------------------------- INGLES TO ESPAÑOL ---------------------------------------------

  pruebaItoE1:- sentence(X, [the, man, eats, an, apple], []), oracion(X,Espanol,[]), write(Espanol), write('\n').
  pruebaItoE1:- error.
  pruebaItoE2:- sentence(X, [they, eat, some, apples], []), oracion(X,Espanol,[]), write(Espanol), write('\n').
  pruebaItoE2:- error.
  pruebaItoE3:- sentence(X, [you, eat, a, red, apple], []), oracion(X,Espanol,[]), write(Espanol), write('\n').
  pruebaItoE3:- error.
  pruebaItoE4:- sentence(X, [john, loves, mary], []), oracion(X,Espanol,[]), write(Espanol), write('\n').
  pruebaItoE4:- error.
  pruebaItoE5:- sentence(X, [the, big, cat, eats, a, grey, mouse], []), oracion(X,Espanol,[]), write(Espanol), write('\n').
  pruebaItoE5:- error.
  pruebaItoE6:- sentence(X, [john, studies, at, university], []), oracion(X,Espanol,[]), write(Espanol), write('\n').
  pruebaItoE6:- error.
  pruebaItoE7:- sentence(X, [the, student, loves, university], []), oracion(X,Espanol,[]), write(Espanol), write('\n').
  pruebaItoE7:- error.
  pruebaItoE8:- sentence(X, [the, dog, chased, a, black, cat, in, the, garden], []), oracion(X,Espanol,[]), write(Espanol), write('\n').
  pruebaItoE8:- error.
  pruebaItoE9:- sentence(X, [the, university, is, large], []), oracion(X,Espanol,[]), write(Espanol), write('\n').
  pruebaItoE9:- error.
  pruebaItoE10:- sentence(X, [the, man, that, we, saw, yesterday, is, my, neighbour], []), oracion(X,Espanol,[]), write(Espanol), write('\n').
  pruebaItoE10:- error.
  pruebaItoE11:- sentence(X, [the, yellow, canary, sings, very, well], []), oracion(X,Espanol,[]), write(Espanol), write('\n').
  pruebaItoE11:- error.
  pruebaItoE12:- sentence(X, [john, has, a, coffee, and, reads, the, newspaper], []), oracion(X,Espanol,[]), write(Espanol), write('\n').
  pruebaItoE12:- error.
  pruebaItoE13:- sentence(X, [john, is, thin, and, mary, is, tall], []), oracion(X,Espanol,[]), write(Espanol), write('\n').
  pruebaItoE13:- error.
  pruebaItoE14:- sentence(X, [oscar, wilde, wrote, the, canterville, ghost], []), oracion(X,Espanol,[]), write(Espanol), write('\n').
  pruebaItoE14:- error.

  pruebaInglesEspanol:- write('-------------- ENGLISH - SPANISH --------------\n'),
                      pruebaItoE1,
                      pruebaItoE2,
                      pruebaItoE3,
                      pruebaItoE4,
                      pruebaItoE5,
                      pruebaItoE6,
                      pruebaItoE7,
                      pruebaItoE8,
                      pruebaItoE9,
                      pruebaItoE10,
                      pruebaItoE11,
                      pruebaItoE12,
                      pruebaItoE13,
                      pruebaItoE14.


  prueba:- pruebaEspanol,
           write('\n'),
           pruebaIngles,
           write('\n'),
           pruebaEspanolIngles,
           write('\n'),
           pruebaInglesEspanol,
           write('\n').

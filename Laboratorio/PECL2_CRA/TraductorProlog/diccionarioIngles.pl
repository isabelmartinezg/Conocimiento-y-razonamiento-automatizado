
% --------------- DICCIONARIO INGLES -----------------

  modifier(m(art_1),sg,v,per3) --> [an].
  modifier(m(art_1),sg,nv,per3) --> [a].
  modifier(m(art_2),sg,_,per3) --> [the].
  modifier(m(art_3),pl,_,per3) --> [some].
  modifier(m(art_4),sg,_,_) --> [my].

  preposition(z(prep_2),lc) --> [at].
  preposition(z(prep_2),lnc) --> [in].

  relative_pronoun(rp(relpron_1)) --> [that].
  
  conjunction(c(conj_1)) --> [and].
  
  pronoun(p(pron_3),per1,pl) --> [we].
  pronoun(p(pron_1),per3,pl) --> [they].
  pronoun(p(pron_2),per2,sg) --> [you].
  pronoun(p(pron_4),per3,sg) --> [that].

  adjetive(a(adj_1),nv,col) --> [big].
  adjetive(a(adj_1),nv,for) --> [large].
  adjetive(a(adj_2),nv,_) --> [grey].
  adjetive(a(adj_3),nv,_) --> [red].
  adjetive(a(adj_4),nv,_) --> [black].
  adjetive(a(adj_5),nv,_) --> [yellow].
  adjetive(a(adj_6),nv,_) --> [thin].
  adjetive(a(adj_7),nv,_) --> [tall].
  
  adverb(f(adv_1)) --> [yesterday].
  adverb(f(adv_2)) --> [very].
  adverb(f(adv_3)) --> [well].

  noun(n(n_1),sg,nv,per3,_) --> [stone].
  noun(n(n_2),sg,nv,per3,_) --> [paper].
  noun(n(n_3),pl,nv,per3,_) --> [scissors].
  noun(n(n_4),sg,nv,per3,_) --> [man].
  noun(n(n_5),sg,v,per3,_) --> [apple].
  noun(n(n_5),pl,v,per3,_) --> [apples].
  noun(n(n_6),sg,nv,per3,_) --> [john].
  noun(n(n_7),sg,nv,per3,_) --> [mary].
  noun(n(n_8),sg,nv,per3,_) --> [cat].
  noun(n(n_9),sg,nv,per3,_) --> [mouse].
  noun(n(n_10),sg,v,per3,lc) --> [university].
  noun(n(n_11),sg,nv,per3,_) --> [student].
  noun(n(n_12),sg,nv,per3,_) --> [dog].
  noun(n(n_13),sg,nv,per3,lnc) --> [garden].
  noun(n(n_14),sg,nv,per3,_) --> [neighbour].
  noun(n(n_15),sg,nv,per3,_) --> [canary].
  noun(n(n_16),sg,nv,per3,_) --> [coffee].
  noun(n(n_17),sg,nv,per3,_) --> [newspaper].
  noun(n(n_18),sg,v,per3,_) --> [oscar].
  noun(n(n_19),sg,nv,per3,_) --> [wilde].
  noun(n(n_20),sg,nv,per3,_) --> [ghost].
  noun(n(n_21),sg,nv,per3,lc) --> [canterville].


  verb(v(v_1),sg,per3,ne) --> [cuts].
  verb(v(v_1),pl,per,ne) --> [cut].
  verb(v(v_2),sg,per3,ne) --> [wraps].
  verb(v(v_2),pl,per,ne) --> [wrap].
  verb(v(v_3),pl,per,ne) --> [break].
  verb(v(v_3),sg,per3,ne) --> [breaks].
  verb(v(v_4),sg,per3,ne) --> [eats].
  verb(v(v_4),_,per,ne) --> [eat].
  verb(v(v_4),_,per2,ne) --> [eat].
  verb(v(v_4),pl,per3,ne) --> [eat].
  verb(v(v_5),sg,per3,e) --> [loves].
  verb(v(v_5),sg,per2,e) --> [love].
  verb(v(v_6),sg,per3,ne) --> [studies].
  verb(v(v_7),sg,per3,ne) --> [chased].
  verb(v(v_8),sg,per3,ne) --> [is].
  verb(v(v_9),sg,per,ne) --> [saw].
  verb(v(v_10),sg,per3,ne) --> [sings].
  verb(v(v_11),sg,per3,ne) --> [has].
  verb(v(v_12),sg,per3,ne) --> [reads].
  verb(v(v_13),sg,per,ne) --> [wrote].
  
  %sg: singular                   pl: plural
  %m: masculino                   f: femenino
  %per: persona
  %e: verbo especial              ne: verbo no especial
  %lc: lugar concreto             lnc: lugar no concreto
  %col: coloquial                 for: formal
  %nv: no empieza por vocal       v: empieza por vocal
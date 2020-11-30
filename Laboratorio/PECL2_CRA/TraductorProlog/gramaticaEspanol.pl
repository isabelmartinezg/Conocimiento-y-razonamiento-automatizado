:-[diccionarioEspanol].

% --------------------------------------------------------- GRAMATICA ESPAÑOL -------------------------------------------------------------------------------

  oracion(s(SN,SV)) --> sintagma_nominal(SN,N,Per), sintagma_verbal(SV,N,Per).
  oracion(s(OC)) --> oracion_compuesta(OC).
  oracion(s(OS)) --> oracion_subordinada(OS).

  oracion_subordinada(os(SN1,NX,np(p(pron_3)),SV1,SV2)) --> sintagma_nominal(SN1,_,_), nexo(NX), sintagma_verbal(SV1,_,_), sintagma_verbal(SV2,_,_).
  
  oracion_compuesta(oc(SN1,SV1,NX,SV2)) --> sintagma_nominal(SN1,_,_), sintagma_verbal(SV1,_,_), nexo(NX),  sintagma_verbal(SV2,_,_).
  oracion_compuesta(oc(SN1,SV1,NX,SN2,SV2)) --> sintagma_nominal(SN1,_,_), sintagma_verbal(SV1,_,_), nexo(NX), sintagma_nominal(SN2,_,_), sintagma_verbal(SV2,_,_).

  nexo(NX) --> pronombre_relativo(NX).
  nexo(NX) --> conjuncion(NX).

  sintagma_nominal(np(M,S),N,Per) --> articulo(M,G,N,Per), nombre(S,G,N,Per,c).
  sintagma_nominal(np(P),N,Per) --> pronombre(P,Per,_,N).
  sintagma_nominal(np(m(art_3),S),N,Per) --> nombre(S,_,N,Per,c).
  sintagma_nominal(np(S),N,Per) --> nombre(S,_,N,Per,_).
  sintagma_nominal(np(S1,S2),N,Per) -->  nombre(S1,G,N,Per,p), nombre(S2,G,N,Per,p).
  sintagma_nominal(np(M,S,A),N,Per) --> articulo(M,G,N,Per), nombre(S,G,N,Per,_), adjetivo(A,G,N).
  sintagma_nominal(np(M,S),e,c) --> articulo(M,G,N,Per), nombre(S,G,N,Per,c).
  sintagma_nominal(np(M,S2,Prep,S1),_,_) --> articulo(M,G,N,Per), nombre(S1,G,N,Per,c), preposicion(Prep), nombre(S2,_,_,_,p).
  sintagma_nominal(np(Prep,S),e,p) --> preposicion(Prep), nombre(S,_,_,_,p).

  sintagma_verbal(sv(V,SAdv),_,_) --> verbo(V,_,_,ne), sintagma_adverbial(SAdv).
  sintagma_verbal(sv(V,SAdj),N,Per) -->  verbo(V,N,Per,ne), sintagma_adjetival(SAdj,N).
  sintagma_verbal(sv(V,SN),N,Per) -->  verbo(V,N,Per,ne), sintagma_nominal(SN,N,_).
  sintagma_verbal(sv(V,SPrep),N,Per) -->  verbo(V,N,Per,ne), sintagma_preposicional(SPrep).
  sintagma_verbal(sv(V,SN,SPrep),N,Per) -->  verbo(V,N,Per,ne), sintagma_nominal(SN,N,_), sintagma_preposicional(SPrep).
  sintagma_verbal(sv(V,SN),N,Per) -->  verbo(V,N,Per,e), sintagma_nominal(SN,e,_).

  sintagma_preposicional(sprep(Prep,S)) --> preposicion(Prep), nombre(S,_,_,_,_).
  sintagma_preposicional(sprep(Prep,M,S)) --> preposicion(Prep), articulo(M,G,N,Per), nombre(S,G,N,Per,_).
  sintagma_preposicional(sprep(Prep,S),e) --> preposicion(Prep), nombre(S,_,_,_,p).
  
  sintagma_adjetival(sadj(Adj),N) --> adjetivo(Adj,_,N).
  
  sintagma_adverbial(sadv(Adv)) --> adverbio(Adv).
  sintagma_adverbial(sadv(Adv1,Adv2)) --> adverbio(Adv1),adverbio(Adv2).
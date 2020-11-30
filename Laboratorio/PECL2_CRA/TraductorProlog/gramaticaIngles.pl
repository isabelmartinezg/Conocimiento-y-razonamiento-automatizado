:-[diccionarioIngles].

% --------------------------------------------------------- GRAMATICA INGLES -------------------------------------------------------------------------------

  sentence(s(SN,SV)) --> nom_p(SN,N,Per), verb_p(SV,N,Per).
  sentence(s(OS)) --> subordinate_sentence(OS).
  sentence(s(OC)) --> compound_sentence(OC).

  subordinate_sentence(os(SN1,NX,SN2,SV1,SV2)) --> nom_p(SN1,_,_),nexus(NX),nom_p(SN2,_,_),verb_p(SV1,_,_),verb_p(SV2,_,_).
  
  compound_sentence(oc(SN1,SV1,NX,SV2)) --> nom_p(SN1,N,Per), verb_p(SV1,N,Per), nexus(NX), verb_p(SV2,N,Per).
  compound_sentence(oc(SN1,SV1,NX,SN2,SV2)) --> nom_p(SN1,N1,Per1), verb_p(SV1,N1,Per1), nexus(NX), nom_p(SN2,N2,Per2),verb_p(SV2,N2,Per2).

  nexus(NX) --> relative_pronoun(NX).
  nexus(NX) --> conjunction(NX).


  nom_p(np(M,S1,z(prep_3),S2),N,Per) --> modifier(M,N,NV,_), noun(S1,N,NV,Per,_), noun(S2,_,_,Per,_).
  nom_p(np(M,S),N,Per) --> modifier(M,N,NV,Per), noun(S,N,NV,_,_).
  nom_p(np(P),N,Per) --> pronoun(P,Per,N).
  nom_p(np(S1,S2),_,_) --> noun(S1,_,_,_,_), noun(S2,_,_,_,_).
  nom_p(np(S),N,Per) --> noun(S,N,_,Per,_).
  nom_p(np(M,S,A),N,Per) --> modifier(M,N,NV,_), adjetive(A,NV,col), noun(S,N,_,Per,_).
  nom_p(np(S)) --> noun(S,_,_,_,_).
  nom_p(np(m(art_2),S),e) --> noun(S,_,_,_,_).
  nom_p(np(z(prep_1),S),e) --> noun(S,_,_,_,_).

  verb_p(sv(V,SAdv),N,Per) --> verb(V,N,Per,ne), adv_p(SAdv).
  verb_p(sv(V,SN),N,Per) --> verb(V,N,Per,ne), nom_p(SN,N,_).
  verb_p(sv(V,S),N,Per) --> verb(V,N,Per,e), nom_p(S,e).
  verb_p(sv(V,SPrep),N,Per) --> verb(V,N,Per,ne), prep_p(SPrep).
  verb_p(sv(V,SN,SPrep),N,Per) --> verb(V,N,Per,ne),nom_p(SN,N,_), prep_p(SPrep).
  verb_p(sv(V,SAdj),N,_) --> verb(V,N,_,ne), adj_p(SAdj,for).

  prep_p(sprep(z(prep_1),S)) --> noun(S,_,_,_,_).
  prep_p(sprep(Prep,m(art_2),S)) --> preposition(Prep,lc), noun(S,_,_,_,lc).
  prep_p(sprep(Prep,M,S)) -->  preposition(Prep,lnc), modifier(M,N,NV,Per), noun(S,N,NV,Per,lnc).
  
  adj_p(sadj(Adj),X) --> adjetive(Adj,_,X).

  adv_p(sadv(Adv)) --> adverb(Adv).
  adv_p(sadv(Adv1,Adv2)) --> adverb(Adv1), adverb(Adv2).
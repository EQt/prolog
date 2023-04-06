:- use_module(library(dcg/basics)).
:- set_prolog_flag(double_quotes, chars).


as --> [].
as --> [a], as.

phrase(integer(X), "123")

% equation --> lhs, equals, rhs.
% lhs --> [LHS], { char_type(LHS, digit) }.
% rhs --> [RHS], { char_type(RHS, digit) }.
% equals --> ['=='].

% sendmoremoney(Vars) :-
%     Vars = [S,E,N,D,M,O,R,Y],
%     Vars ins 0..9,
%     S #\= 0,
%     M #\= 0,
%     all_different(Vars),
%     1000*S + 100*E + 10*N + D +
%     1000*M + 100*O + 10*R + E 
%     #= 10000*M + 1000*O + 100*N + 10*E + Y.
    

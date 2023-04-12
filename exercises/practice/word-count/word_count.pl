% Import library for character manipulation
:- use_module(library(dcg/basics)).

% Define the words and their corresponding DCG rules
words([Word|Words]) --> non_letters, word(Word), non_letters, words(Words), !.
words([]) --> [].

% Define a word based on the given constraints
word([C|Letters]) --> lower_letter(C), letters(Letters).

% Define a lowercase letter
lower_letter(C) --> [C], { char_type(C, lower) }.

% Define a non-lowercase letter
non_letter --> [C], { \+ char_type(C, lower) }.

non_letters --> non_letter, non_letters.
non_letters --> [].

% Define a sequence of zero or more lowercase letters, which could be preceded by a single quote
letters([C|Letters]) --> lower_letter(C), letters(Letters).
letters(['\'',C|Letters]) --> quote, lower_letter(C), letters(Letters).
letters([]) --> [].

% Define a single quote character
quote --> ['\''].

% % Test with a given sentence
% parse(Sentence) :-
%     string_codes(Sentence, Codes),
%     phrase(words, Codes).
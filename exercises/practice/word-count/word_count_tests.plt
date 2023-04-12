pending :-
  current_prolog_flag(argv, ['--all'|_]).
pending :-
  write('\nA TEST IS PENDING!\n'),
  fail.

:- begin_tests(word_count).

  test(count_one_word, condition(pending)) :-
      word_count("word", WordCount),
      WordCount == ["word"-1].

  test(count_one_of_each_word, condition(pending)) :-
      word_count("one of each", WordCount),
      WordCount == ["one"-1, "of"-1, "each"-1].

  test(multiple_occurrences_of_a_word, condition(pending)) :-
      word_count("one fish two fish red fish blue fish", WordCount),
      WordCount == [
        "one"-1,
        "fish"-4,
        "two"-1,
        "red"-1,
        "blue"-1
      ].

  test(handles_cramped_lists, condition(pending)) :-
      word_count("one,two,three", WordCount),
      WordCount == ["one"-1, "two"-1, "three"-1].

  test(handles_expanded_lists, condition(pending)) :-
      word_count("one,\ntwo,\nthree", WordCount),
      WordCount == ["one"-1, "two"-1, "three"-1].

  test(ignore_punctuation, condition(pending)) :-
      word_count("car: carpet as java: javascript!!&@$%^&", WordCount),
      WordCount == [
        "car"-1,
        "carpet"-1,
        "as"-1,
        "java"-1,
        "javascript"-1
      ].

  test(include_numbers, condition(pending)) :-
      word_count("testing, 1, 2 testing", WordCount),
      WordCount == ["testing"-2, "1"-1, "2"-1].

  test(normalize_case, condition(pending)) :-
      word_count("go Go GO Stop stop", WordCount),
      WordCount == ["go"-3, "stop"-2].

  test(with_apostrophes, condition(pending)) :-
      word_count("'First: don't laugh. Then: don't cry. You're getting it.'", WordCount),
      WordCount == [
        "first"-1,
        "don't"-2,
        "laugh"-1,
        "then"-1,
        "cry"-1,
        "you're"-1,
        "getting"-1,
        "it"-1
      ].

  test(with_quotations, condition(pending)) :-
      word_count("Joe can't tell between 'large' and large.", WordCount),
      WordCount == [
        "joe"-1,
        "can't"-1,
        "tell"-1,
        "between"-1,
        "large"-2,
        "and"-1
      ].

  test(substrings_from_the_beginning, condition(pending)) :-
      word_count("Joe can't tell between app, apple and a.", WordCount),
      WordCount == [
        "joe"-1,
        "can't"-1,
        "tell"-1,
        "between"-1,
        "app"-1,
        "apple"-1,
        "and"-1,
        "a"-1
      ].

  test(multiple_spaces_not_detected_as_a_word, condition(pending)) :-
      word_count(" multiple   whitespaces", WordCount),
      WordCount == ["multiple"-1, "whitespaces"-1].

  test(alternating_word_separators_not_detected_as_a_word, condition(pending)) :-
      word_count(",\n,one,\n ,two \n 'three'", WordCount),
      WordCount == ["one"-1, "two"-1, "three"-1].

  test(quotation_for_word_with_apostrophe, condition(pending)) :-
      word_count("can, can't, 'can't'", WordCount),
      WordCount == ["can"-1, "can't"-2].

:- end_tests(word_count).

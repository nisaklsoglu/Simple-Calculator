% dört işlem tanımları
calc(add, A, B, Result) :- Result is A + B.
calc(sub, A, B, Result) :- Result is A - B.
calc(mul, A, B, Result) :- Result is A * B.
calc(div, A, B, Result) :- 
    B =\= 0, % 0 a bolme kontrol edilmis
    Result is A / B.

% öncelik sirasına göre işlem ağacı oluşturma
evaluate(Num, Num) :- number(Num).
evaluate(expr(Op, A, B), Result) :-
    evaluate(A, RA),
    evaluate(B, RB),
    calc(Op, RA, RB, Result).

% ifade okuma (öncelik sirasına dikkat ederek)
read_expression(Expr) :-
    write('Enter expression: '),
    read(Term),
    parse(Term, Expr).

% işlem önceliğiyle ifadeyi ağaca çevirme
parse(A+B, expr(add, X, Y)) :- parse(A, X), parse(B, Y).
parse(A-B, expr(sub, X, Y)) :- parse(A, X), parse(B, Y).
parse(A*B, expr(mul, X, Y)) :- parse(A, X), parse(B, Y).
parse(A/B, expr(div, X, Y)) :- parse(A, X), parse(B, Y).
parse(N, N) :- number(N).

% etkileşimli kullanıcı giriş fonksiyonu
start :-
    read_expression(Expr),
    evaluate(Expr, Result),
    format('Result: ~w~n', [Result]),
    write('Do you want to calculate again? (yes/no): '),
    read(Resp),
    (Resp == yes -> start ; write('Goodbye!'), nl).

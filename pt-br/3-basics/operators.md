# Operadores

    =

atribuição. O operando esquerdo deve ser um identificador, e o direito deve resultar em um valor ou referência apropriadamente.

    +, -, /, *, %

aritimética básica, aplicada aos operandos esquerdo e direito. O operador `+` também pode concatenar strings.

    +=, -=, /=, *=, %=

operação aritimética entre o operador esquerdo e direito, where the left must be an identifier, para qual o resultado é atribuído.

    ++, --

operações de incremento e decremento com atribuição implicita. Esses tomam só um argumento, que deve ser um identificador de um tipo simples de dado.

O valor será mudado e atribuido de volta ao identificador. Esses operadores podem ser dispostos como prefixo ou pósfixos, - com o primeiro o valor calculado da declaração será o valor recém calculado, com o último o valor original é retornado.

    |, ^, &, ~, |=, &=, ^=

operações _bitwise_: or(_ou_), exclusive or(_ou exclusivo_), and(_e_), not(_não_). O segundo conjunto inclui atribuição e é análogo às versões aritiméticas. Eles podem ser aplicadas a qualquer tipo valor simples. (Não existe operador de atribuição associado com `~` porque esse é o operador unário. A operação equivalente é `a = ~a`).

    <<, >>

operações _bit shift_, desloca o operando esquerdo o número de bits de acordo com o operando direito.

    <<=, >>=

operações _bit shift_, desloca o operando esquerdo o numero de bits de acordo com o operando direito. O operando esquerdo deve ser um identificador, o qual o resultado é atribuído.

    ==

teste de igualdade. Resulta em um valor booleano(_bool_) dependendo se os operandos esquerdo e direito são iguais. No caso dos tipos valor isso significa que seus valores são iguais, no caso dos tipos referencia que os objetos são da mesma instância. Uma exceção a essa regra é o tipo `string`, que é testada em igualdade por valor.

    <, >, >=, <=, !=

teste de inigualdade. Resulta em um valor `bool` dependendo se os operandos esquerdo e direito são diferentes na maneira descrita. Eles são válidos para valores simples de dados, e para o tipo `string`. Para strings esses operadores comparam a ordem lexográfica.

    !, &&, ||

operadores lógicos: not(_não_), and(_e_), or(_ou_). Essas operações podem ser aplicadas a valores _booleanos_ - o primeiro toma um valor dos outros dois.

    ? :

operador de condição ternária. Resulta em uma condição e retorna a sub-expressão da esquerde ou direita baseado e, qual condição é verdadeira ou falsa: _condição_ `?` _valor se for verdade_ `:` _valor se for falso_

    ??

operador _null coalescing_: `a ?? b` é equivalente a `a != null ? a : b`. Esse operador é útil para prover um valor padrão no caso da referência ser nula(_null_):

```vala
stdout.printf("Olá, %s!\n", nome ?? "pessoa desconhecida");
```

    in

checa se o operando direito contem o operando esquerdo. Esse operador funciona em arrays, strings, coleções ou qualquer outro tipo que possua o método _contains()_. Para strings ele executa uma busca de substring.

Operadores não podem ser sobrecarregados em Vala. Existem operadores extras que são válidos no contexto de expressões lambda e outras tarefas específicas - estes são explicados no contexto onde são aplicáveis.

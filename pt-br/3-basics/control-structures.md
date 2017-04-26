# Estruturas de controle

```vala
while (a > b) { a--; }
```

vai diminuir _a_ repetidamente, checando antes de cada iteração que _a_ é maior que _b_.

```vala
do { a--; } while (a > b);
```

vai diminuir _a_ repetidamente, checando após cada iteração que _a_ é maior que _b_.

```vala
for (int a = 0; a < 10; a++) { stdout.printf("%d\n", a); }
```

vai inicializar _a_ em 0, então imprimir _a_ repetidamente até _a_ deixar de ser menor que 10, incrementando _a_ após cada iteração.

```vala
foreach (int a in int_array) { stdout.printf("%d\n", a); }
```

vai imprimir cada inteiro num array, ou outra coleção iterável. O significado de "iterável" vai ser descrito depois.

Todos os quatro tipos precedentes de repetição(_loop_) podem ser controlados com as palavras-chave `break` e `continue`. Uma instrução `break` faz a repetição terminar imediatamente, enquanto `continue` irá pular direto para o teste da iteração.

```vala
if (a > 0) { stdout.printf("a is greater than 0\n"); }
else if (a < 0) { stdout.printf("a is less than 0\n"); }
else { stdout.printf("a is equal to 0\n"); }
```
executa uma parte do código baseada no conjunto de condições. A primeira condição decide que código será executado, se _a_ é maior que 0 ele não testará se é menor que 0. Qualquer numero de blocos _else if_ é permitido, e zero ou um bloco _else_.

```vala
switch (a) {
case 1:
    stdout.printf("one\n");
    break;
case 2:
case 3:
    stdout.printf("two or three\n");
    break;
default:
    stdout.printf("unknown\n");
    break;
}
```
Uma declaração `switch` executa exatamente uma ou zero seções do código com base no valor passado. Em Vala não existe queda([_fall through_](https://en.wikipedia.org/wiki/Switch_statement#Fallthrough)) nos os casos(_cases_), exceto nos casos vazios. Para assegurar isto, cada caso não-vazio deve finalizar com uma declaração `break`, `return` ou `throw`. É possível usar uma declaração switch com strings.

Uma nota para programadores C: condições sempre devem ser um valor booleano. Isso significa que se você quer checar uma variável é `null` ou 0 você precisa fazer isso explicitamente:

`if (object != null) { }` or
`if (number != 0) { }`.

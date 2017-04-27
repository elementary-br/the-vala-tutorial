# Métodos

Funções são chamadas _métodos_ em Vala, independente de serem definidos dentro ou fora de uma classe. A partir de agora nós irémos chama-las pelo termo _método_.

```vala
int método_nome(int arg1, Object arg2) {
    return 1;
}
```

Esse código define um método, tendo o nome _método_nome_, recebendo dois argumentos, um inteiro e outro _Objeto_ (O primeiro passado por valor, o segundo por referência como descrito). O método retornará um inteiro, que no caso é 1.

Todos métodos Vala são funções C, e portanto recébem um número arbitrário de argumentos e retornam um valor (ou nenhum se o método é declarado _void_(vazio)). Eles podem retornar mais valores aproximados caso sejam postos dados em lugares conhecidos ao código chamado. Detalhes de como fazer isso estão na seção "Direções dos parâmetros" na parte avançada desse tutorial.

A nomenclatura convêncional para métodos em Vala é _tudo_em_caixa_baixa_ com sublinhas separando palavras. Isso pode ser um pouco desconhecido para programadores Java ou C\# que estão acostumado com nome de métodos em _CamelCase_ ou _camelCaseMesclado_. Mas com esse estilo você vai ser consistente com outras bibliotecas Vala e C/GObject.

Não é possível ter múltiplos métodos com o mesmo nome mas diferentes assinaturas dentro do mesmo escopo(_sobrecarga de métodos_):

```vala
void draw(string text) { }
void draw(Shape shape) { }  // não é possível
```

Isso se deve ao fato de que bibliotecas produzidas em Vala tem pretenção de serem usaveis por programadores C também. Invés disso você pode fazer algo assim em Vala:

```vala
void draw_text(string text) { }
void draw_shape(Shape shape) { }
```
Por escolher um nome diferente você pode evitar um conflito de nomes. Em linguagens que suportam sobrecarga de métodos é usada geralmente para prover métodos convenientes com menos parâmetros para encadear os métodos mais comuns:

```vala
void f(int x, string s, double z) { }
void f(int x, string s) { f(x, s, 0.5); }  // não é possível
void f(int x) { f(x, "hello"); }           // não é possível
```

Nesse caso você pode usar o recurso argumento padrão do Vala para parâmetros dos métodos para alcançar um comportamento similar com um único método. Você pode definir valores padrões para os últimos parâmetros de um método, para que você não precise passa-los explicitamente para uma chamada de método:

```vala
void f(int x, string s = "olá", double z = 0.5) { }
```

Algumas chamadas possíveis para esse método podem ser:

```vala
f(2);
f(2, "oi");
f(2, "oi", 0.75);
```

É possível até definir métodos com a quantidade de váriaveis como argumento (_varargs_) como o _stdout.printf()_, entretanto não é necessáriamente recomentado. Você aprenderá como fazer isso depois.

Vala performa um teste básico de nulidade nos parâmetros dos métodos e nos valores de retorno. Se é permitido que um parâmetro ou um retorno seja `null`, o tipo deve ser pósfixado com um modificador `?`. Essa informação extra ajuda o compilador a executar checagens estáticas e a adicionar afirmações no tempo de execução a cerca das pré-condições dos métodos, os quais podem ajudar a evitar problemas relacionados a erros como dereferênciação de uma referência nula(_null_).

```vala
string? nome_do_metodo(string? texto, Foo? foo, Bar bar) {
    // ...
}
```

Nesse exemplo `texto`, `foo` e o retorno podem ser `null`, entretanto, `bar` não pode ser `null`.

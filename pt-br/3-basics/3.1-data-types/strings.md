# Strings(_Conjuntos de caracteres_)

O tipo de dados para strings(_conjuntos de caracteres_) é `string`. As strings em Vala são codificadas em UTF-8 e imutáveis.

```vala
string texto = "Um conjunto de caracteres";
```

Vala oferece um recurso chamado _verbatim strings_. Strings quais as sequencias de escape (como o `\n`) não são interpretadas, quebras de linhas serão preservadas e sinais de citação não precisam ser mascarados. Elas são cercadas com três sinais de citação. Possíveis identações após uma quebra de linha são parte da string também.

```vala
string verbatim = """Essa é uma tão falada "verbatim string". Verbatim strings não processam sequências de escape, como \n, \t, \\, etc. Elas podem conter citações e abranger múltiplas linhas.""";
```

Strings prefixadas com '@' são templates de string. Elas podem evaluate variáveis embutidas e expressões prefixadas com '\$':

```vala
int a = 6, b = 7;
string s = @"$a * $b = $(a * b)";  // => "6 * 7 = 42"
```

Os operadores de igualdade `==` e `!=` comparam o conteúdo das duas strings, contrario ao comportamento do Java que nesse caso checaria a igualdade referencial.

Você pode recortar uma string com `[inicio:fim]`. Valores negativos representam posições relativas ao fim da string:

```vala
string greeting = "hello, world";
string s1 = greeting[7:12];        // => "world"
string s2 = greeting[-4:-2];       // => "or"
```

Note que os índices em Vala começam com 0 como na maioria das outras linguagens de programação. Apartir do Vala 0.11 você pode acessar um único byte de uma string com `[índice]`:

```vala
uint8 b = greeting[7];             // => 0x77
```

Porem, você não pode designar um novo valor em byte para essa posição, uma vez que as strings em Vala são imutáveis.

Muitos dos tipos básicos tem métodos razoáveis para análisar e converter para strings, por exemplo:

```vala
bool b = bool.parse("false");           // => false
int i = int.parse("-52");               // => -52
double d = double.parse("6.67428E-11"); // => 6.67428E-11
string s1 = true.to_string();           // => "true"
string s2 = 21.to_string();             // => "21"
```

Dois métodos úteis para escrever e ler strings de/para o console (e para suas primeiras explorações com Vala) são _stdout.printf()_ e _stdin.read\_line()_:

```vala
stdout.printf("Hello, world\n");
stdout.printf("%d %g %s\n", 42, 3.1415, "Vala");
string input = stdin.read_line();
int number = int.parse(stdin.read_line());
```

Você já conhece o _stdout.printf()_ pelo exemplo do _Olá mundo_.

Atualmente, ele pode receber um número arbitrário de argumentos de tipos diferentes, no qual o primeiro argumento é uma _format string_, seguindo as mesmas regras das [strings no formato do C](http://pt.wikipedia.org/wiki/Printf).

Se você precisa emitir uma mensagem de erro você pode usar o _stderr.printf()_ invés do _stdout.printf()_.

Em adição o operador _in_ pode ser usado para determinar quando uma string contém outra, ex.

```vala
if ("ere" in "Able was I ere I saw Elba.") ...
```

Para mais informações, veja [uma visão completa da classe string](http://www.valadoc.org/glib-2.0/string.html).

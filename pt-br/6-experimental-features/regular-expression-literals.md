# Expressão regular literal

[Expressões regulares](http://www.regular-expressions.info/) são uma técnica poderosa para a correspondência de padrões em strings. Vala tem suporte experimental para expressões regulares literais (`/regex/`). Exemplo:

```vala
string email = "tux@kernel.org";
if (/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i.match(email)) {
    stdout.printf("Valid email address\n");
}
```

O *i* à direita faz com que a expressão não seja insensível. Você pode armazenar uma expressão regular em uma variável do tipo *Regex*:

```vala
Regex regex = /foo/;
```

Um exemplo de substituição usando expressão regular:

```vala
var r = /(foo|bar|cow)/;
var o = r.replace ("this foo is great", -1, 0, "thing");
print ("%s\n", o);
```

Os seguintes caracteres à direita podem ser usados:

- *i*, por padrão as letras combinam letras maiúsculas e minúsculas
    
- *m*, as construções no "início de linha" e no "fim de linha" coincidem imediatamente após ou imediatamente antes de qualquer nova linha na seqüência, respectivamente, bem como no início e no final.

- *s*, um metacaracter *.* No padrão corresponde a todos os caracteres, incluindo nova linhas. Sem ele, as novas linhas são excluídas.

- *x*, os caracteres de espaço em branco no padrão são totalmente ignorados, exceto quando escapados ou dentro de uma classe de caracteres.
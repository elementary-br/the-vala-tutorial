# Conversão dinâmica de tipo

Para a conversão dinâmica, a variável é moldada por uma expressão pósfixa `as NomeDoTipoDesejado`. Vala irá incluir uma checagem de tipo na execução pra assegurar que a conversão é razoável - se for uma conversão ilegal, será retornado `null`. Entretanto, isso requer tanto que o tipo original quanto o alvo sejam classes do tipo referência.

Por exemplo,

```vala
Button b = widget as Button;
```

Se por alguma razão a classe da instância `widget` não é a classe Button ou alguma de suas subclasses ou não implementa a interface Button, `b` será `null`. Essa conversão é equivalente à:

```vala
Button b = (widget is Button) ? (Button) widget : null;
```

# Modo não-nulo rigoroso

Se você compilar seu código com `--enable-experimental-non-null` o compilador Vala será executado verificando se o tipo é não-nulo e considerará que o tipo *every* não deve ser nulo por padrão, a menos que seja explicitamente declarado nulo por marcação com um ponto de interrogação:

```vala
Object o1 = new Object();     // not nullable
Object? o2 = new Object();    // nullable
```

O compilador irá executar uma análise de tempo de compilação estática para garantir que nenhuma referência anulável seja atribuída a uma referência não nula. Por exemplo, Isso não será possível:

```vala
o1 = o2;
```
*o2* pode ser *null* e *o1* foi declarado não-nulo, portanto, esta atribuição é proibida. No entanto, você pode substituir esse comportamento com um elenco explícito não nulo se tiver certeza de que *o2* não é *nulo*:

```vala
o1 = (!) o2;
```
Este modo rigoroso de não-nulo ajuda a evitar indesejaveis erros de derreferenciação em _null_(objetos nulos). Esse recurso poderia chegar ao seu pleno potêncial se a nulabilidade dos tipos de retorno nos bindings(_vinculos de bibliotecas C_) fossem marcados corretamente, o que não é sempre o caso.
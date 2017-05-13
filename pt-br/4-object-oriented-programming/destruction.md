# Destrutor

Mesmo Vala gerenciando a memória por você, você pode necessitar do seu próprio destrutor caso decida fazer uma gerência manual da memória com ponteiros (mais sobre isso depois) ou se você precisa liberar outros recursos. A sintaxe é a mesma do C\# e C++:

```vala
class Demo : Object {
    ~Demo() {
        stdout.printf("no destrutor");
    }
}
```

Desde que o gerênciamento de memória do Vala é baseado na _contagem de referências_ invés de _coleção de lixo_(garbage collection), destrutores são deterministicos e podem ser usados para implementar o padrão [RAII](http://en.wikipedia.org/wiki/RAII) para gerenciar os recursos (fechamento de fluxos, conexões de bancos de dados, ...).

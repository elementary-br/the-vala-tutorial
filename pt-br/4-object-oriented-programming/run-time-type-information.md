# Informação do tipo em tempo de execução

Desde que as classes Vala são registradas em tempo de execução e cada instância carrega informação do seu tipo você pode checar dinamicamente o tipo de um objeto com o operador `is`:

```vala
bool b = object is SomeTypeName;
```

Você pode receber a informação de tipo de instâncias `Object` com o método `get_type ()`:

```vala
Type type = object.get_type();
stdout.printf("%s\n", type.name());
```

Com o operador `typeof ()` você pode receber a informação de um tipo diretamente. Dessa informação de tipo você pode criar novas instâncias com `Object.new ()`:

```vala
Type type = typeof(Foo);
Foo foo = (Foo) Object.new(type);
```
Qual construtor será chamado? É o bloco `constuct {}` que será descrito na seção sobre construções do estilo gobject.

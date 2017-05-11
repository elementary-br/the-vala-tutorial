# Ocultação de Métodos

Ao usar o modificador `new` você pode ocultar um método herdado com um novo método de mesmo nome. O novo método pode ter uma assinatura diferente. A ocultação de métodos não deve ser confundida com a sobreposição de métodos(_method overriding_), porque a ocultação de métodos não exibe comportamentos polimórficos.

```vala
class Foo : Object {
    public void my_method() { }
}

class Bar : Foo {
    public new void my_method() { }
}
```

Você ainda pode chamar o método original convertendo para a classe base ou interface:

```vala
void main() {
    var bar = new Bar();
    bar.my_method();
    (bar as Foo).my_method();
}
```

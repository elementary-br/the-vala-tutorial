# Delegações

```vala
delegate void DelegateType(int a);
```

Delegações representam métodos, permitindo pedaços de código serem passados como objetos. O exemplo acima define um novo tipo chamado _DelegateType_ no qual representa métodos recebendo um _int_ e não retornando valor. Qualquer método que se encaixe nessa assinatura pode ser atribuído à uma váriavel do tipo ou passada como um argumento do método desse tipo.

```vala
delegate void DelegateType(int a);

void f1(int a) {
    stdout.printf("%d\n", a);
}

void f2(DelegateType d, int a) {
    d(a);       // Chamando uma delegaçao
}

void main() {
    f2(f1, 5);  // Passando um método como argumento de delegação à outro método
}
```

Esse código executará o método _f2_, passando por referencia o método _f1_ e o número 5. _f2_ então executará o método _f1_, passando o número.

Delegações podem ser criadas localmente também. O método membro também pode ser designado à uma delegação,  ex.

```vala
class Foo {

    public void f1(int a) {
        stdout.printf("a = %d\n", a);
    }

    delegate void DelegateType(int a);

    public static int main(string[] args) {
        Foo foo = new Foo();
        DelegateType d1 = foo.f1;
        d1(10);
        return 0;
    }
}
```

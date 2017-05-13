# Polimorfismo

_Polimorfismo_ descreve o jeito no qual um mesmo objeto pode ser usado como se fosse mais de um tipo distinto. Diversas das técnicas aqui descritas sugerem como isso é possível em Vala: Uma instancia de uma classe pode ser usada como em uma instancia de uma superclasse, ou de qualquer interface implementada, sem qualquer conhecimento do seu tipo.

Uma extensão lógica desse poder é permitir que um subtipo haja diferente quando endereçado exatamente da mesma forma. Isso não é um conceito muito fácil de explicar, então vamos começar com um exemplo que mostrará o que acontece se você não buscar esse objetivo:

```vala
class SuperClass : GLib.Object {
    public void method_1() {
        stdout.printf("SuperClass.method_1()\n");
    }
}

class SubClass : SuperClass {
    public void method_1() {
        stdout.printf("SubClass.method_1()\n");
    }
}
```

Essas duas classes implementam o mesmo método chamado "method\_1" e a `SubClass` portanto contém dois métodos chamados "method\_1", por herdar uma da `SuperClass`. Cada um desses podem ser chamados como o código a seguir mostra:

```vala
SubClass o1 = new SubClass();
o1.method_1();
SuperClass o2 = o1;
o2.method_1();
```

Isso irá resultar em dois diferentes métodos sendo chamados. A segunda linha acredita que "o1" seja uma `SubClass` e vai chamar aquela versão do método. A quarta linha espera que "o2" seja uma `SuperClass` e vai chamar o método daquela classe.

O problema que esse exemplo expõe, é que qualquer código mantendo uma referência à `SuperClass` vai chamar o método descrito naquela classe, mesmo que o objeto seja uma subclasse. O jeito de mudar esse comportamento é usando métodos virtuais.
Considere a seguinte versão reescrita do último exemplo:

```vala
class SuperClass : GLib.Object {
    public virtual void method_1() {
        stdout.printf("SuperClass.method_1()\n");
    }
}

class SubClass : SuperClass {
    public override void method_1() {
        stdout.printf("SubClass.method_1()\n");
    }
}
```

Quando esse código é usado da mesma forma que antes, O método "method\_1" da `SubClass` será chamado duas vezes. Isso é porque nos dissemos ao sistema que "method\_1" é um método virtual, significando que se for sobreposto em uma subclasse, essa nova versão sempre será executada nas instâncias dessa subclasse, independente do conhecimento do instanciador.

Essa distinção é provavelmente familiar à programadores de algumas linguagens, como C++, mas é de fato o oposto do estilo de linguagens como Java, no qual os passos devem ser tomados para prevenir que um método seja virtual.

Você provavelmente reconheceu também agora que quando um método é declarado como `abstract` ele também deve ser virtual. Caso contrário, não seria possível executar dado método numa instância do tipo em que foi declarado. Quando implementamos um método abstrato numa subclasse, você pode portanto escolher declarar a implementação como `override`, assim passando a natureza do método virtual, e permitindo que subtipos façam o mesmo se for desejado.

Também é possível implementar métodos de interface de forma que as subclasses possam mudar a implementação. O processo nesse caso é declarar a implemetação inicial como método `virtual`, e então as subclasses podem sobrepor quando necessário.

Na hora de escrever uma classe, é comum querer usar funcionalidades definida em uma classe que você herdou. Isso é complicado quando o mesmo nome de método é usado mais de uma vez na arvore de heranças da sua classe. Para esse propósito Vala provê a palavra chave `base`. O caso mais comum é quando você sobrepôs um método virtual pra prover funcionalidades extras, mas ainda quer que o método da classe base seja chamado. O exemplo a seguir mostra esse caso:

```vala
public override void method_name() {
    base.method_name();
    extra_task();
}
```

Vala também permite que as propriedades sejam virtuais:

```vala
class SuperClass : GLib.Object {
    public virtual string prop_1 {
        get {
            return "SuperClass.prop_1";
        }
    }
}

class SubClass : SuperClass {
    public override string prop_1 {
        get {
            return "SubClass.prop_1";
        }
    }
```

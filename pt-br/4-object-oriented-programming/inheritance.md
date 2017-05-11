# Herança

Em Vala, uma classe pode derivar de uma ou zero outras classes. Na prática é provável que este seja um, embora não haja herança implícita como em linguagens como Java.

Quando se define uma classe que herda de outra, você cria um relacionamento entre as classes onde as intâncias da subclasse também são instancias da superclasse. Isso significa que operações em instancias da superclasse são também aplicáveis em instancias da subclasse. Sendo assim, quando uma instancia da superclasse é requerida, uma instancia da subclasse pode ser usada.

Quando se escreve a definição de uma classe é possível exercer controle preciso sobre quem pode acessar quais métodos e dados no objeto. O exemplo a seguir demostra um série dessas opções:

```vala
class SuperClasse : GLib.Object {

    private int dado;

    public SuperClasse(int dado) {
        this.dado = dado;
    }

    protected void metodo_protegido() {
    }

    public static void metodo_publico_estatico() {
    }
}

class SubClasse : SuperClasse {

    public SubClasse() {
        base(10);
    }
}
```

_dado_ é um dado membro da _SuperClasse_. Vai ter um membro desse tipo em qualquer instância da _SuperClasse_, e é é declarado `privado` então só vai ser acessível pelo código que é parte da _SuperClasse_.

_metodo\_protegido_ é um método instancia da _SuperClasse_. Você poderá executar esse método apenas em uma instancia da _SuperClasse_ ou em uma de suas subclasses, e só no código que pertence a _SuperClasse_ ou uma de suas subclasses - Essa ultima regra é o resultado do modificador `protected`.

_metodo\_publico\_estatico_ tem dois modificadores. O modificador `static` significa que esse método pode ser chamado sem posse de uma instancia da _SuperClasse_ ou uma de suas subclasses. Como resultado, esse método não terá acesso a referencia `this` quando for executada. O modificador `public` significa que esse método pode ser chamado em qualquer código, não importando o relacionamento com a _SuperClasse_ ou suas subclasses.

Dadas estas definições, uma instância de _SubClasse_ vai conter todos os três membros da _SuperClasse_, mas irá somente ser capaz de acessar membros não-privados. Código externo só poderá acessar o método público.

Com `base` um construtor da subclasse pode encadear um construtor de sua classe base.

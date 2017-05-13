# Genéricos

Vala inclúi um sistema genérico de tempo de execução, pelo qual uma particular instância de uma classe pode ser restrita com um tipo particular ou um conjunto de tipos escolhidos no tempo de construção. Essa restrição é geralmente usada para exigir que o dado guardado no objeto deve ser de um tipo particular, por exemplo a fim de implementar uma lista de objetos de um certo tipo. No exemplo, Vala poderia ter certeza que somente o objeto de um tipo requerido pudesse ser adicionado a lista, e que na reaquisição todos os objetos poderiam ser convertidos naquele tipo.

Em Vala, genéricos são manipulados enquanto o programa está em execução. Quando você define uma classe que pode ser restrito à um tipo, existe apenas uma única classe, com cada instância personalizada individualmente. Isso contrasta com C++ que cria uma nova classe para cada tipo de restrição requerido - um sistema similar a Vala é usado em Java. Isso tem várias consequencias, as mais importantes: os membros estáticos são compartilhados por um tipo como um todo, independente das restrições contidas em cada instância, e dadas classe e subclasse, um genérico aprimorado por uma subclasse pode ser usado como um genérico aprimorado pela classe.

O código a seguir demonstra como utilizar o sistema genérico pra definir uma classe envoltória mínima(_wrapper_):

```vala
public class Wrapper<G> : GLib.Object {
    private G data;

    public void set_data(G data) {
        this.data = data;
    }

    public G get_data() {
        return this.data;
    }
}
```

Essa classe "Wrapper" deve ser restrita com um tipo para ser instanciada - nesse caso o tipo será identificado como "G", e suas instâncias de classe guardarão um objeto do tipo "G", e terão métodos para receber ou enviar tal objeto. (A razão para esse exemplo é para explicar que atualmente uma classe genérica não pode usar propriedades de seu tipo restrito, portanto invés disso essa classe tem métodos get e set).

A fim de instânciar essa classe, um tipo deve ser escolhido, por exemplo o tipo embutido `string`(em Vala não existem restrições sobre quais tipos podem ser usados como genéricos).

```vala
var wrapper = new Wrapper<string>();
wrapper.set_data("test");
var data = wrapper.get_data();
```

Como você pode ver, quando o dado é retornado do envoltório, é atribuido a um identificador sem tipo explicito. Isso é possível porque Vala conhece o tipo de objeto que está em cada instância do envoltório, sendo assim ele pode fazer isso.

O fato que Vala não cria multiplas classes para você pelas suas definições genéricas significa que você pode fazer o código a seguir:

```vala
class TestClass : GLib.Object {
}

void accept_object_wrapper(Wrapper<Glib.Object> w) {
}

...
var test_wrapper = new Wrapper<TestClass>();
accept_object_wrapper(test_wrapper);
...
```

Desde que todas as instâncias `TestClass` também são `Object`, o método "accept_object_wrapper" irá aceitar qualquer objeto que for passado, e tratar seus objetos envolvidos como instâncias de `GLib.Object`.

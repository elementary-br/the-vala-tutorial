# Básicos

Uma simples classe pode ser definida como a seguir:

```vala
public class TestClass : GLib.Object {

    /* Fields */
    public int first_data = 0;
    private int second_data;

    /* Constructor */
    public TestClass() {
        this.second_data = 5;
    }

    /* Method */
    public int method_1() {
        stdout.printf("private data: %d", this.second_data);
        return this.second_data;
    }
}
```

Esse código vai definir um novo tipo (que será registrado automaticamente com o sistema de tipos da biblioteca _gobject_) que contem três membros. Existem também dois membros dado, um inteiro definido no começo, e um método chamado _method\1_, que retorna uma integer. A declaração de classe dita que essa classe é uma subclasse de _GLib.Object_, e portanto instâncias dela também são _Objects_, e contém também todos os membros desse tipo. O fato dessa classe descender do _GObject_ também significa que existem recursos especiais em Vala que podem ser usados para acessar fácilmente alguns recursos do _Object_.

Essa classe é descita como `public` (por padrão, classes são `internal`). A implicação disso é que pode ser referenciada diretamente pelo código de fora do arquivo - se você é um programador C da glib/gobject, você vai reconhecer isso como sendo equivalente a definir interfaces de classes em um header que outro código pode incluir.

Esses membros também são descritos como `public` ou `private`, público e privado respectivamente. O membro _first\_data_ é `public`, então é visível diretamente para qualquer usuario da classe, e pode ser modificado sem conter uma instância estando ciente disso. O segundo dado membro é `private`, sendo assim só pode ser referenciado por um código pertencente a esta classe. Vala suporta quatro modificadores de acesso diferentes:

| Modificador | Descrição |
|---|---|
| `public` | Sem restrições de acesso |
| `private` | Acesso é limitado a definição da classe/estrutura(struct). Esse é o padrão se nenhum modificador de acesso é especificado. |
| `protected` | Acesso é limitado a definição da classe e qualquer classe que herde dela |
| `internal`  | Accesso é limitado a classes definidas dentro do mesmo pacote |

O construtor incializa uma nova instância da classe. Ele tem o mesmo nome da classe, pode ter zero ou mais argumentos e é definido sem tipo de retorno.

A parte final dessa classe é uma definição de método. Esse método é chamado _method\1_, e retornará um inteiro. Como esse método não é estático, ele só pode ser executado numa instância dessa classe, e pode acessar membros da instância. Ele pode fazer isso pela referência `this`, que sempre aponta para a instância em que o método é chamado. A não ser que exista ambiguidade, o identificador `this` pode ser omitido se desejado.

Você pode usar essa nova classe da forma seguir:

```vala
TestClass t = new TestClass();
t.first_data = 5;
t.method_1();
```

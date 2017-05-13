# Propriedades

É uma boa prática de orientação à objetos ocultar detalhes da implementação para os úsuarios de suas classes([Princípio de ocultação de informações(em inglês)](http://en.wikipedia.org/wiki/Information_hiding)), então você pode depois mudar os internos sem quebrar a API pública. Uma pratica é tornar os campos privados e prover métodos de acessos para pegar e determinar os seus valores(getters e setters).

Se você é um programador Java você vai provavelmente pensar em algo assim:

```vala
class Pessoa : Object {
    private int idade = 32;

    public int get_idade() {
        return this.idade;
    }

    public void set_idade(int idade) {
        this.idade = idade;
    }
}
```

Isso funciona, mas Vala pode fazer melhor. O problema é que esses métodos são incomodos de se trabalhar. Vamos supor que você quer incrementar a idade da pessoa em um ano:

```vala
var alice = new Pessoa();
alice.set_idade(alice.get_idade() + 1);
```

É aqui que as propriedades entram em ação:

```vala
class Pessoa : Object {
    private int _idade = 32;  // prefixo sublinhado para evitar um cruzamento de nome com a propriedade

    /* Propriedade */
    public int idade {
        get { return _idade; }
        set { _idade = value; }
    }
}
```

Essa sintaxe deve ser familiar a programadores C\#. A propriedade tem um `get` e um `set` para inserir e retornar seu valor. `value` é uma palavra chave que representa o novo valor que deve ser atribuído a propriedade.

Agora você pode acessar a propriedade como se ela fosse um campo público. Mas por trás das cenas o código é executado pelos setters e getters.

```vala
var alice = new Pessoa();
alice.idade = alice.idade + 1;  // ou até mais curto:
alice.idade++;
```

Se você só faz a implementação padrão como mostrada acima você pode escrever as propriedades de maneira mais curta:

```vala
class Pessoa : Object {
    /* Propriedade com um getter e setter e valor padrão */
    public int idade { get; set; default = 32; }
}
```

Com propriedades você pode mudar o trabalho interno das classes sem mudar sua API pública. Por exemplo:

```vala
static int ano_atual = 2525;

class Pessoa : Object {
    private int ano_de_nascimento = 2493;

    public int idade {
        get { return ano_atual - ano_de_nascimento; }
        set { ano_de_nascimento = ano_atual - value; }
    }
}
```

Agora a idade é calculada na hora pelo ano de nascimento. Note que você pode fazer mais que acessar uma simples variavel ou atribuição com os blocos get e set. Você poderia fazer um acesso à banco de dados, logs, atualizações de cache, etc.

Se você quer fazer uma propriedade somente-leitura para os usuarios da classe você deve fazer o setter privado:

```vala
    public int idade { get; private set; default = 32; }
```

Ou alternativamente, você pode deixar o bloco set de fora:

```vala
class Pessoa : Object {
    private int _idade = 32;

    public int idade {
        get { return _idade; }
    }
}
```

Propriedades podem não apenas ter um nome mas também uma curta descrição(chamado _nick_) e uma descrição longa(chamada _blurb_). Você pode anotar esses com um atributo especial:

```vala
    [Description(nick = "idade em anos", blurb = "Essa é a idade da pessoa em anos")]
    public int age { get; set; default = 32; }
```

Propriedades e suas descrições adicionais podem ser requeridas em tempo de execução. Alguns programas como a ferramenta gráfica de design de interfaces de usuario [Glade](http://glade.gnome.org/) faz uso dessa informação. Dessa forma Glade pode mostrar descrições legíveis por humanos para propriedades dos widgets GTK+.

Toda instancia de uma classe derivada da `GLib.Object` tem um sinal chamado `notify`. Esse sinal é emitido toda vez que uma propriedade de seus objetos muda. Então você pode conectar a esse sinal se estiver interessado nas notificações de mudanças em geral:

```vala
obj.notify.connect((s, p) => {
    stdout.printf("A propriedade '%s' mudou!\n", p.nome);
});
```

`s` é a origem do sinal (`obj` nesse exemplo), `p` é a informação da propriedade do tipo _ParamSpac_ para a propriedade mudada. Se você só está interessado nas notificações de mudança de uma única propriedade você pode usar essa sintaxe:

```vala
alice.notify["idade"].connect((s, p) => {
    stdout.printf("idade mudou\n");
});
```

Note que nesse caso você precisa usar a representação verbal do nome da propriedade aonde sublinhas são substituidas por traços:
`nome_da_propriedade` se torna `nome-da-propriedade` nessa representação, que é a convenção de nomeação de propriedades nos GObjects.

A notificação de mudanças pode ser desabilitada com um atributo `CCode` imediatamente antes da declaração da propriedade:

```vala
public class MyObject : Object {
    [CCode(notify = false)]
    // sinal notify NÃO é emitido nas mudanças da propriedade
    public int sem_notificacao { get; set; }
    // sinal notify é emitido nas mudanças da propriedade
    public int com_notificacao { get; set; }
}
```

Há outro tipo de propriedades chamado propriedades de construção(_construct properties_) que são descritos depois na seção sobre construção no estilo gobject.

Nota: no caso de sua propriedade ser do tipo struct, para receber o valor da propriedade com Object.get(), você tem que declarar sua variável como no exemplo abaixo

```vala
struct Cor
{
    public uint32 argb;

    public Cor() { argb = 0x12345678; }
}

class Forma: GLib.Object
{
    public Cor c { get; set; default = Cor(); }
}

int main()
{
    Cor? c = null;
    Forma f = new Forma();
    f.get("c", out c);
}
```

Dessa forma, c é uma referência invés de uma instancia de Cor no stack. O que você passou ao s.get() é "Cor \*\*" invés de "Cor \*".

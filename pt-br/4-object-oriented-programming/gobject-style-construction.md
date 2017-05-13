# Construção estilo GObject

Vala suporta um esquema alternativo de construção que é levemente diferente dos descritos anteriormente. Esse esquema é mais parecido com o jeito que os GObject são construidos. Qual você vai preferir vai depender se você veio dos lado dos GObjects ou do Java e/ou C\#. O esquema de construção dos GObject introduzem novos elementos sintáticos:

_propriedades de construção_, uma chamada especial `Object(...)` e um bloco `construct`. Vamos dar uma olhada no funcionamento:

```vala
public class Person : Object {

    /* Construction properties */
    public string name { get; construct; }
    public int age { get; construct set; }

    public Person(string name) {
        Object(name: name);
    }

    public Person.with_age(string name, int years) {
        Object(name: name, age: years);
    }

    construct {
        // do anything else
        stdout.printf("Welcome %s\n", this.name);
    }
}
```

Com o esquema de construção do estilo GObject cada método de construção só pode conter uma chamada `Object (...)` para determinar os tão falados _propriedades de construção_(construct properties). A chamada `Object (...)` recebe um variável número de argumentos nomeados na forma de `propriedade: valor`. Essas propriedades precisam ser declaradas como `construct` ou `set`. Elas serão atribuídas com os dados valores e depois todos blocos `construct {}` na hierarquia do _GLib.Object_ abaixo da nossa classe será chamado.

O bloco `construct` é garantido de ser chamadoquando uma instância da classe é criada, mesmo se ela for criada como um subtipo. Não tem parâmetros ou retorno de valores. Dentro desse bloco você pode chamar outros métodos e atribuir variáveis membros que forem necessárias.

Propriedades de construção são definidas como propriedades `get` e `set`, e portanto podem executar códigos arbitrários na atribuição. Se você precisa fazer inicializações baseado numa única propriedade de construção, é possível escrever um bloco `construct` personalizado para a propriedade, que será executado imediatamente na atribuição, e antes de outros códigos de construção.

Se uma propriedade de construção é declarada sem `set` ela será uma tão falada propriedade _somente construção_, que significa que só pode ser atribuida na construção. No exemplo abaixo _name_ é uma propriedade somente construção.

Aqui temos um sumário de vários tipos de propriedades juntas com nomenclaturas usualmente encontradas na documentação de bibliotecas baseadas em GObject.

```vala
public int a { get; private set; }    // Read
public int b { private get; set; }    // Write
public int c { get; set; }            // Read / Write
public int d { get; set construct; }  // Read / Write / Construct
public int e { get; construct; }      // Read / Write-Construct-Only
```

Em alguns casos você também vai querer executar algumas ações - não quando instâncias das classes são criadas - mas quando a classe propriamente dita é criada na execução dos GObject. Na terminologia dos GObject nós estamos falando sobre os trechos de código que rodam dentro da função `class_init` para a classe em questão. Em Java isso é conhecido como _static initializer blocks_(Blocos de inicialização estática). Em Vala isso se parece assim:

```vala
/* This snippet of code is run when the class
 * is registered with the type system */
static construct {
  ...
}
```

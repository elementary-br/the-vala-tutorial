# Namespaces

```vala
namespace NameSpaceName {
    // ...
}
```

Tudo entre as chaves dessa declaração está no _namespace_ _NameSpaceName_ e precisa ser referênciada como tal.
Qualquer código fora desse _namespace_ deve usar nomes qualificados para qualquer coisa dentro do nome do _namespace_, ou estar em um arquivo com a declaração `using` para importar esse _namespace_:

```vala
using NameSpaceName;

// ...
```

Por exemplo, se o _namespace_ _Gtk_ é importado com `using Gtk;` você pode escrever _Window_ invés de _Gtk.Window_. Um nome completamente qualificado poderá ser necessário apenas em casos de ambiguidade, por exemplo entre _GLib.Object_ e _Gtk.Object_.

O _namespace_ _GLib_ é importado por padrão. Imagine uma linha invísivel `using GLib;` no ínicio de cada arquivo Vala.

Qualquer coisa que você não colocar em um _namespace_ separado vai incorporar um _namespace_ anónimo global. Se você precisa referenciar o _namespace_ global explicitamente devido a ambiguidade você pode fazer isso com o prefixo `global::`.

_Namespaces_ podem ser encadeados, tanto encadeando uma declaração dentro de outra quanto por dar um name na forma _Namespace1.NameSpace2_.

Diversos outros tipos de definições podem declarar estar dentro de um _namespace_ seguindo a mesma convenção de nomenclatura, ex.

`class NameSpace1.Teste { ... }`. Note que fazendo isso, o _namespace_ da definição será o da declaração encadeada mais os _namespaces_ declarados na definição.

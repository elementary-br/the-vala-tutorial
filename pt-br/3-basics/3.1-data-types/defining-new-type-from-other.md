# Definindo um tipo novo a partir de outro

Definindo um tipo novo é questão de derivar de um que você precisa.

```vala
/* definindo um apelido para um tipo básico (equivalente ao typedef int Integer em C)*/
[[SimpleType](/SimpleType)] public struct Integer : uint { }

/* Define um novo tipo de um container como GLib.List com elementos do tipo GLib.Value */
public class ValueList : GLib.List<GLib.Value> {

        [CCode (has_construct_function = false)]
        protected ValueList ();
        public static GLib.Type get_type ();
}
```

# Defining a new Type from another

Defining a new type is a matter of deriving it from the one you need. Here is an example: 

```vala
/* defining an alias for a basic type (equivalent to typedef int Integer in C)*/
[[SimpleType](/SimpleType)] public struct Integer : uint { }

/* Define a new type from a container like GLib.List with elements type GLib.Value */
public class ValueList : GLib.List<GLib.Value> {
        [CCode (has_construct_function = false)]
        protected ValueList ();
        public static GLib.Type get_type ();
}
```


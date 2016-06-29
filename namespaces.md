# Namespaces

```vala
namespace NameSpaceName {
    // ...
}
```

Everything between the braces in this statement is in the namespace *NameSpaceName* and must be referenced as such. Any code outside this namespace must either use qualified names for anything within the name of the namespace, or be in a file with an appropriate `using` declaration in order to import this namespace: 

```vala
using NameSpaceName;

// ...
```

For example, if the namespace *Gtk* is imported with `using Gtk;` you can simply write *Window* instead of *Gtk.Window*. A fully qualified name would only be necessary in case of ambiguity, for example between *GLib.Object* and *Gtk.Object*. 

The namespace *GLib* is imported by default. Imagine an invisible `using GLib;` line at the beginning of every Vala file. 

Everything that you don't put into a separate namespace will land in the anonymous global namespace. If you have to reference the global namespace explicitly due to ambiguity you can do that with the `global::` prefix. 

Namespaces can be nested, either by nesting one declaration inside another, or by giving a name of the form *NameSpace1.NameSpace2*. 

Several other types of definition can declare themselves to be inside a namespace by following the same naming convention, e.g.

`class NameSpace1.Test { ... }`. Note that when doing this, the final namespace of the definition will be the one the declaration is nested in plus the namespaces declared in the definition. 


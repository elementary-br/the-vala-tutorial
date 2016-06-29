# Interfaces

```vala
interface InterfaceName : SuperInterfaceName {
}
```

defines an interface, i.e. a non instantiable type. In order to create an instance of an interface you must first implement its abstract methods in a non-abstract class. Vala interfaces are more powerful than Java or C\# interfaces. In fact, they can be used as [mixins](http://en.wikipedia.org/wiki/Mixin). The details of interfaces are described in the section about object oriented programming. 
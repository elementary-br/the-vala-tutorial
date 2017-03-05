# Defining Prerequisites
Interfaces in Vala may not inherit from other interfaces, but they may declare other interfaces to be prerequisites, which works in roughly the same way. For example, it may be desirable to say that any class that implements a `List` interface must also implement a `Collection` and `Traversable` interfaces. The syntax for this is exactly the same as for describing interface implementation in classes: 

```vala
public interface List : Collection, Traversable {
}
```

This definition of "List" may not be implemented in a class without "Collection" also being implemented, and so Vala enforces the following style of declaration for a class wishing to implement "List", where all implemented interfaces must be described: 

```vala
public class ListClass : GLib.Object, Collection, List {
}
```

Vala interfaces may also have a class as a prerequisite. If a class name is given in the list of prerequisites, the interface may only be implemented in classes that derive from that prerequisite class. This is often used to ensure that an instance of an interface is also a GLib.Object subclass, and so the interface can be used, for example, as the type of a property. 

The fact that interfaces can not inherit from other interfaces is mostly only a technical distinction - in practice Vala's system works the same as other languages in this area, but with the extra feature of prerequisite classes. 


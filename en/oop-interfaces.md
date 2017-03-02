# Interfaces

A class in Vala may implement any number of interfaces. Each interface is a type, much like a class, but one that cannot be instantiated. By "implementing" one or more interfaces, a class may declare that its instances are also instances of the interface, and therefore may be used in any situation where an instance of that interface is expected. 

The procedure for implementing an interface is the same as for inheriting from classes with abstract methods in - if the class is to be useful it must provide implementations for all methods that are described but not yet implemented. 

A simple interface definition looks like: 

```vala
public interface ITest : GLib.Object {
    public abstract int data_1 { get; set; }
    public abstract void method_1();
}
```

This code describes an interface "I``Test" which requires GLib.Object as parent of the implementor class and contains two members. "data\_1" is a property, as described above, except that it is declared `abstract`. Vala will therefore not implement this property, but instead require that classes implementing this interface have a property called "data\_1" that has both `get` and `set` accessors - it is required that this be `abstract` as an interface may not have any data members. The second member "method\_1" is a method. Here it is declared that this method must be implemented by classes that implement this interface.

The simplest possible full implementation of this interface is: 

```vala
public class Test1 : GLib.Object, ITest {
    public int data_1 { get; set; }
    public void method_1() {
    }
}
```

And may be used as follows: 

```vala
var t = new Test1();
t.method_1();

ITest i = t;
i.method_1();
```
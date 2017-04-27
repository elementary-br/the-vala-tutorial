# Properties

An interface can define properties that must be implemented for classes. Implementator class must define a property with the same signature and access permissions to the property's `get` and `set`. 

As any GObject property, you can define a body to property's `set` and `get` in the implementator class, when no body is used values are set and get by default. If given, you must define a `private` field to store the properties values to be used outside or inside the class. 

`Callable` interface definition, defines an `answering` property. In this case this interface defines a `answering` with a `protected set`, allowing a read only property for any object using an instance of `Callable`, but allows class implementors to write values to it, like `TechPhone` class does when implements `hang()` method. 
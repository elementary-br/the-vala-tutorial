# Ownership Transfer

The keyword `owned` is used to transfer ownership. 

-   As a prefix of a parameter type, it means that ownership of the object is transferred into this code context. 
-   As an type conversion operator, it can be used to avoid duplicating non-reference counting classes, which is usually impossible in Vala. 

For example:

```vala
Foo foo = (owned) bar;
```

This means that *bar* will be set to *null* and *foo* inherits the reference/ownership of the object *bar* references. 

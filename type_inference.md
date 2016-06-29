# Type Inference

Vala has a mechanism called *type inference*, whereby a local variable may be defined using `var` instead of giving a type, so long as it is unambiguous what type is meant. The type is inferred from the right hand side of the assignment. It helps reduce unnecessary redundancy in your code without sacrificing static typing: 

```vala
var p = new Person();     // same as: Person p = new Person();
var s = "hello";          // same as: string s = "hello";
var l = new List<int>();  // same as: List<int> l = new List<int>();
var i = 10;               // same as: int i = 10;
```

This only works for local variables. Type inference is especially useful for types with generic type arguments (more on these later). Compare


```vala
MyFoo<string, MyBar<string, int>> foo = new MyFoo<string, MyBar<string, int>>();
```
vs. 

```vala
var foo = new MyFoo<string, MyBar<string, int>>();
```

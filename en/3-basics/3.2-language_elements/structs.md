# Structs


```vala
struct StructName {
    public int a;
}
```
defines a `struct` type, i.e. a compound value type. A Vala struct may have methods in a limited way and also may have private members, meaning the explicit `public` access modifier is required. 

```vala
struct Color {
    public double red;
    public double green;
    public double blue;
}
```

This is how you can initialise a struct: 

```vala
// without type inference Color c1 = Color();
Color c2 = { 0.5, 0.5, 1.0 };
Color c3 = Color() {
    red = 0.5,
    green = 0.5,
    blue = 1.0
};

// with type inference var c4 = Color();
var c5 = Color() {
    red = 0.5,
    green = 0.5,
    blue = 1.0
};
```

Structs are stack/inline allocated and copied on assignment. 

To define an array of structs:
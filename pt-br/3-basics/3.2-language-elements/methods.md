# Methods

Functions are called *methods* in Vala, regardless of whether they are defined inside a class or not. From now on we will stick to the term *method*. 

```vala
int method_name(int arg1, Object arg2) {
    return 1;
}
```

This code defines a method, having the name *method\_name*, taking two arguments, one an integer and the other an *Object* (the first passed by value, the second as a reference as described). The method will return an integer, which in this case is 1. 

All Vala methods are C functions, and therefore take an arbitrary number of arguments and return one value (or none if the method is declared *void*). They may approximate more return values by placing data in locations known to the calling code. Details of how to do this are in the "Parameter Directions" section in the advanced part of this tutorial. 

The naming convention for methods in Vala is *all\_lower\_case* with underscores as word separators. This may be a little bit unfamiliar to C\# or Java programmers who are accustomed to *CamelCase* or *mixedCamelCase* method names. But with this style you will be consistent with other Vala and C/GObject libraries. 

It is not possible to have multiple methods with the same name but different signature within the same scope ("method overloading"): 


```vala
void draw(string text) { }
void draw(Shape shape) { }  // not possible
```

This is due to the fact that libraries produced with Vala are intended to be usable for C programmers as well. In Vala you would do something like this instead: 

```vala
void draw_text(string text) { }
void draw_shape(Shape shape) { }
```
By choosing slightly different names you can avoid a name clash. In languages that support method overloading it is often used for providing convenience methods with less parameters that chain up to the most general method: 

```vala
void f(int x, string s, double z) { }
void f(int x, string s) { f(x, s, 0.5); }  // not possible void f(int x) { f(x, "hello"); }           // not possible
```

In this case you can use Vala's default argument feature for method parameters in order to achieve a similar behaviour with just one method. You can define default values for the last parameters of a method, so that you don't have to pass them explicitly to a method call: 

```vala
void f(int x, string s = "hello", double z = 0.5) { }
```

Some possible calls of this method might be: 

```vala
f(2);
f(2, "hi");
f(2, "hi", 0.75);
```

It's even possible to define methods with real variable-length argument lists (*varargs*) like *stdout.printf()*, although not necessarily recommended. You will learn how to do that later. 

Vala performs a basic nullability check on the method parameters and return values. If it is allowable for a method parameter or a return value to be `null`, the type symbol should be postfixed with a `?` modifier. This extra information helps the Vala compiler to perform static checks and to add runtime assertions on the preconditions of the methods, which may help in avoiding related errors such as dereferencing a `null` reference. 

```vala
string? method_name(string? text, Foo? foo, Bar bar) {
    // ...
}
```

In this example `text`, `foo` and the return value may be `null`, however, `bar` must not be `null`. 

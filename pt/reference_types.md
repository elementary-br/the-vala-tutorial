# Reference Types

The reference types are all types declared as a class, regardless of whether they are descended from GLib's *Object* or not. Vala will ensure that when you pass an object by reference the system will keep track of the number of references currently alive in order to manage the memory for you. The value of a reference that does not point anywhere is `null`. More on classes and their features in the section about object oriented programming. 

```vala
/* defining a class */
class Track : GLib.Object {             /* subclassing 'GLib.Object' */
    public double mass;                 /* a public field */
    public double name { get; set; }    /* a public property */
    private bool terminated = false;    /* a private field */
    public void terminate() {           /* a public method */
        terminated = true;
    }
}
```

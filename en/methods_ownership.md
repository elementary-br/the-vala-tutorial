# Methods ownership

*Unowned references* conversely are not recorded in the object they reference. This allows the object to be removed when it logically should be, regardless of the fact that there might be still references to it. The usual way to achieve this is with a method defined to return an unowned reference, e.g.: 

```vala
class Test {
    private Object o;

    public unowned Object get_unowned_ref() {
        this.o = new Object();
        return this.o;
    }
}
```

When calling this method, in order to collect a reference to the returned object, you must expect to receive a weak reference: 

```vala
unowned Object o = get_unowned_ref();
```
The reason for this seemingly over complicated example because of the concept of ownership. 

-   If the Object "o" was not stored in the class, then when the method `get_unowned_ref` returned, "o" would become unowned (i.e. there would be no references to it). If this were the case, the object would be deleted and the method would never return a valid reference. 
-   If the return value was not defined as unowned, the ownership would pass to the calling code. The calling code is, however, expecting an unowned reference, which cannot receive the ownership.

If the calling code is written as 

```vala
Object o = get_unowned_ref();
```

Vala will try to either obtain a reference of or a duplicate of the instance the unowned reference pointing to. 
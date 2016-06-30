# Properties ownership

In contrast to normal methods, properties always have unowned return value. That means you can't return a new object created within the get method. That also means, you can't use an owned return value from a method call. The somewhat irritating fact is because of that a property value is owned by the object that HAS this property. A call to obtain this property value should not steal or reproduce (by duplicating, or increasing the reference count of) the value from the object side. 

As such, the following example will result in a compilation error 

```vala
public Object property {
    get {
        return new Object();   // WRONG: property returns an unowned reference,
                               // the newly created object will be deleted when
                               // the getter scope ends the caller of the
                               // getter ends up receiving an invalid reference
                               // to a deleted object.
    }
}
```

nor can you do this 

```vala
public string property {
    get {
        return getter_method();   // WRONG: for the same reason above.
    }
}

public string getter_method() {
    return "some text"; // "some text" is duplicated and returned at this point.
}
```

on the other hand, this is perfectly fine 

```vala
public string property {
    get {
        return getter_method();   // GOOD: getter_method returns an unowned value
    }
}

public unowned string getter_method() {
    return "some text";
    // Don't be alarmed that the text is not assigned to any strong variable.
    // Literal strings in Vala are always owned by the program module itself,
    // and exist as long as the module is in memory
}
```

The `unowned` modifier can be used to make automatic property's storage unowned. That means 

```vala
public unowned Object property { get; private set; }
```

is identical to 

```vala
private unowned Object _property;

public Object property {
    get { return _property; }
}
```

The keyword `owned` can be used to specifically ask a property to return a owned reference of the value, therefore causing the property value be reproduced in the object side. Think twice before adding the `owned` keyword. Is it a property or simply a `get_xxx` method? There may also be problems in your design.

Anyways, the following code is a correct segment, 

```vala
public owned Object property { owned get { return new Object(); } }
```

Unowned references play a similar role to pointers which are described later. They are however much simpler to use than pointers, as they can be easily converted to normal references. However, in general they should not be widely used in the programs unless you have a good reason. 
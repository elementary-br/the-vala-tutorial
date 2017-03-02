# Anonymous Methods/Closures

```vala
(a) => { stdout.printf("%d\n", a); }
```

An *anonymous method*, also known as *lambda expression*, *function literal* or *closure*, can be defined in Vala with the `=>` operator. The parameter list is on the left hand side of the operator, the method body on the right hand side. 

An anonymous method standing by itself like the one above does not make much sense. It is only useful if you assign it directly to a variable of a delegate type or pass it as a method argument to another method. 

Notice that neither parameter nor return types are explicitly given. Instead the types are inferred from the signature of the delegate it is used with. 

Assigning an anonymous method to a delegate variable: 

```vala
delegate void PrintIntFunc(int a);

void main() {
    PrintIntFunc p1 = (a) => { stdout.printf("%d\n", a); };
    p1(10);

    // Curly braces are optional if the body contains only one statement:
    PrintIntFunc p2 = (a) => stdout.printf("%d\n", a);
    p2(20);
}
```

Passing an anonymous method to another method: 

```vala
delegate int Comparator(int a, int b);

void my_sorting_algorithm(int[] data, Comparator compare) {
    // ... 'compare' is called somewhere in here ...
}

void main() {
    int[] data = { 3, 9, 2, 7, 5 };
    // An anonymous method is passed as the second argument:
    my_sorting_algorithm(data, (a, b) => {
        if (a < b) return -1;
        if (a > b) return 1;
        return 0;
    });
}
```

Anonymous methods are real [closures](http://en.wikipedia.org/wiki/Closure_(computer_science)). This means you can access the local variables of the outer method within the lambda expression: 

```vala
delegate int IntOperation(int i);

IntOperation curried_add(int a) {
    return (b) => a + b;  // 'a' is an outer variable
}

void main() {
    stdout.printf("2 + 4 = %d\n", curried_add(2)(4));
}
```
In this example *curried\_add* (see [Currying](http://en.wikipedia.org/wiki/Currying)) returns a newly created method that preserves the value of *a*. This returned method is directly called afterwards with 4 as argument resulting in the sum of the two numbers. 
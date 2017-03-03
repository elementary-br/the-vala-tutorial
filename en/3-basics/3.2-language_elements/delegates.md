# Delegates

```vala
delegate void DelegateType(int a);
```

Delegates represent methods, allowing chunks of code to be passed around like objects. The example above defines a new type named *DelegateType*
which represents methods taking an *int* and not returning a value. Any method that matches this signature may be assigned to a variable of this type or passed as a method argument of this type. 

```vala
delegate void DelegateType(int a);

void f1(int a) {
    stdout.printf("%d\n", a);
}

void f2(DelegateType d, int a) {
    d(a);       // Calling a delegate
}

void main() {
    f2(f1, 5);  // Passing a method as delegate argument to another method
}
```

This code will execute the method *f2*, passing in a reference to method *f1* and the number 5. *f2* will then execute the method *f1*, passing it the number. 

Delegates may also be created locally. A member method can also be assigned to a delegate, e.g, 

```vala
class Foo {

    public void f1(int a) {
        stdout.printf("a = %d\n", a);
    }

    delegate void DelegateType(int a);

    public static int main(string[] args) {
        Foo foo = new Foo();
        DelegateType d1 = foo.f1;
        d1(10);
        return 0;
    }
}
```

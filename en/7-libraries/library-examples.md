# Examples

The following is an example of how to write a simple library in Vala, and also to compile and test it locally without having to install it first. 

Save the following code to a file *test.vala*. This is the actual library code, containing the functions we want to call from our main program. 

```vala
public class MyLib : Object {

    public void hello() {
        stdout.printf("Hello World, MyLib\n");
    }

    public int sum(int x, int y) {
        return x + y;
    }
}
```

Use the next command to generate *test.c*, *test.h* and *test.vapi* files. These are the C versions of the library to be compiled, and the VAPI file representing the library's public interface. 

    $ valac -C -H test.h --library test test.vala --basedir ./

Now compile the library: 

    $ gcc --shared -fPIC -o libtest.so $(pkg-config --cflags --libs gobject-2.0) test.c

Save the following code to a file called *hello.vala*. This is the code that will use the library we have created. 

```vala
void main() {
    var test = new MyLib();
    test.hello();
    int x = 4, y = 5;
    stdout.printf("The sum of %d and %d is %d\n", x, y, test.sum(x, y));
}
```

Now compile the application code, telling the compiler that we want to link against the library we just created. 

    $ valac -X -I. -X -L. -X -ltest -o hello hello.vala test.vapi --basedir ./

We can now run the program. This command states that any required libraries will be found in the current directory. 

    $ LD_LIBRARY_PATH=$PWD ./hello

The output of the program should be: 

    Hello World, MyLib
    The sum of 4 and 5 is 9

You can also create a GObjectIntrospection GIR file for your library with the `--gir` option: 

    valac -C test.vala --library test --gir Test-1.0.gir

GIR files are XML descriptions of the API. 


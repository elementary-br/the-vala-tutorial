# Strings

The data type for strings is `string`. Vala strings are UTF-8 encoded and immutable. 

```vala
string text = "A string literal";
```

Vala offers a feature called *verbatim strings*. These are strings in which escape sequences (such as `\n`) won't be interpreted, line breaks will be preserved and quotation marks don't have to be masked. They are enclosed with triple double quotation marks. Possible indentations after a line break are part of the string as well. 

```vala
string verbatim = ""
```
This is a so-called "verbatim string". Verbatim strings don't process escape sequences, such as \n, \t, \\, etc. They may contain quotes and may span multiple lines.""";

Strings prefixed with '@' are string templates. They can evaluate embedded variables and expressions prefixed with '\$': 
```vala
int a = 6, b = 7;
string s = @"$a * $b = $(a * b)";  // => "6 * 7 = 42"
```
The equality operators `==` and `!=` compare the content of two strings, contrary to Java's behaviour which in this case would check for referential equality. 

You can slice a string with `[start:end]`. Negative values represent positions relative to the end of the string: 

```vala
string greeting = "hello, world";
string s1 = greeting[7:12];        // => "world"
string s2 = greeting[-4:-2];       // => "or"
```

Note that indices in Vala start with 0 as in most other programming languages. Starting with Vala 0.11 you can access a single byte of a string with `[index]`: 

```vala
uint8 b = greeting[7];             // => 0x77
```

However, you cannot assign a new byte value to this position, since Vala strings are immutable. 

Many of the basic types have reasonable methods for parsing from and converting to strings, for example: 

```vala
bool b = bool.parse("false");           // => false int i = int.parse("-52");               // => -52 double d = double.parse("6.67428E-11"); // => 6.67428E-11 string s1 = true.to_string();           // => "true"
string s2 = 21.to_string();             // => "21"
```

Two useful methods for writing and reading strings to/from the console (and for your first explorations with Vala) are *stdout.printf()* and *stdin.read\_line()*: 

```vala
stdout.printf("Hello, world\n");
stdout.printf("%d %g %s\n", 42, 3.1415, "Vala");
string input = stdin.read_line();
int number = int.parse(stdin.read_line());
```

You already know *stdout.printf()* from the *Hello World* example.

Actually, it can take an arbitrary number of arguments of different types, whereas the first argument is a *format string*, following the same rules as [C format strings](http://en.wikipedia.org/wiki/Printf).

If you must output an error message you can use *stderr.printf()* instead of *stdout.printf()*. 

In addition the *in* operation can be used to determine whether one string contains another, e.g. 

```vala
if ("ere" in "Able was I ere I saw Elba.") ...
```

For more information, please report to [the complete overview of the string class](http://www.valadoc.org/glib-2.0/string.html). 

A [sample program](/Projects/Vala/StringSample) demonstrating string usage is also available. 
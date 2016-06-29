# Static Type Casting
In Vala, you can cast a variable from one type to another. For a static type cast, a variable is casted by the desired type name with parenthesis. A static cast doesn't impose any runtime type safety checking. It works for all Vala types. For example, 

```vala
int i = 10;
float j = (float) i;
```

Vala supports another casting mechanism called *dynamic cast* which performs runtime type checking and is described in the section about object oriented programming. 


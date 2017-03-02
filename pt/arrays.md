# Arrays

An array is declared by giving a type name followed by `[]` and created by using the `new` operator e.g. `int[] a = new int[10]` to create an array of integers. The length of such an array can be obtained by the *length* member variable e.g. `int count = a.length`. Note that if you write `Object[] a = new Object[10]` no objects will be created, just the array to store them in. 

```vala
int[] a = new int[10];
int[] b = { 2, 4, 6, 8 };
```
You can slice an array with `[start:end]`: 
```vala
int[] c = b[1:3];     // => { 4, 6 }
```
Slicing an array will result in a reference to the requested data, not a copy. However, assigning the slice to an owned variable (as is done above) will result in a copy. If you would like to avoid a copy, you must either assign the slice to an unowned array or pass it directly to an argument (arguments are, by default, unowned): 

```vala
unowned int[] c = b[1:3];     // => { 4, 6 }
```
Multi-dimensional arrays are defined with `[,]` or `[,,]` etc. 

```vala
int[,] c = new int[3,4];
int[,] d = {{2, 4, 6, 8},
            {3, 5, 7, 9},
            {1, 3, 5, 7}};
d[2,3] = 42;
```

This sort of array is represented by a single contiguous memory block. Jagged multi-dimensional arrays (`[][]`, also known as "stacked arrays" or "arrays of arrays"), where each row may have a different length, are not yet supported. 

To find the length of each dimension in a multi-dimensional array, the *length* member becomes an array, storing the length of each respective dimension.

```vala
int[,] arr = new int[4,5];
int r = arr.length[0];
int c = arr.length[1];
```
Please note that you can't get a mono-dimensional array from a multidimensional array, or even slice a multidimensional array: 

```vala
int[,] arr = {{1,2},
                {3,4}};
int[] b = arr[0];  // won't work int[] c = arr[0,];  // won't work int[] d = arr[:,0];  // won't work int[] e = arr[0:1,0];  // won't work int[,] f = arr[0:1,0:1];  // won't work
```

You can append array elements dynamically with the `+=` operator. However, this works only for locally defined or private arrays. The array is automatically reallocated if needed. Internally this reallocation happens with sizes growing in powers of 2 for run-time efficiency reasons. However, `.length` holds the actual number of elements, not the internal size. 

```vala
int[] e = {};
e += 12;
e += 5;
e += 37;
```

You can resize an array by calling *resize()* on it. It will keep the original content (as much as fits). 

```vala
int[] a = new int[5];
a.resize(12);
```
You can move elements within an array by calling *move(src, dest, length)* on it. The original positions will be filled with 0. 

```vala
uint8[] chars = "hello world".data;
chars.move (6, 0, 5);
print ((string) chars); // "world "
```

If you put the square brackets *after* the identifier together with an indication of size you will get a fixed-size array. Fixed-size arrays are allocated on the stack (if used as local variables) or in-line allocated (if used as fields) and you can't reallocate them later. 

```vala
int f[10];     // no 'new ...'
```
Vala does not do any bounds checking for array access at runtime. If you need more safety you should use a more sophisticated data structure like an *ArrayList*. You will learn more about that later in the section about *collections*. 
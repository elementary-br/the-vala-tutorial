# Value Types
Vala supports a set of the simple types as most other languages do.
-   Byte, `char`, `uchar`; their names are *char* for historical reasons. 
-   Character, `unichar`; a 32-bit Unicode character
-   Integer, `int`, `uint` 
-   Long Integer, `long`, `ulong`
-   Short Integer, `short`, `ushort`
-   Guaranteed-size Integer, `int8`, `int16`, `int32`, `int64` as well as their unsigned siblings `uint8`, `uint16`, `uint32`, `uint64`. The numbers indicate the lengths in bits. 
-   Float number, `float`, `double`
-   Boolean, `bool`; possible values are `true` and `false` 
-   Compound, `struct` 
-   Enumeration, `enum`; represented by integer values, not as classes like Java's enums 

Here are some examples. 

``` {#CA-a9cbedf5cf18e971e1aed220d790e5f129dbe7d5 dir="ltr" lang="en"}
/* atomic types */
unichar c = 'u';
float percentile = 0.75f;
const double MU_BOHR = 927.400915E-26;
bool the_box_has_crashed = false;

/* defining a struct */
struct Vector {
    public double x;
    public double y;
    public double z;
}

/* defining an enum */
enum WindowType {
    TOPLEVEL,
    POPUP
}
```




Most of these types may have different sizes on different platforms,
except for the guaranteed-size integer types. The `sizeof`
operator returns the size that a variable of a given type occupies in bytes: 





<div class="codearea" dir="ltr" lang="en">

``` {#CA-c3e0237508643f8d03a5525abd062a5f51cc0d6f dir="ltr" lang="en"}
ulong nbytes = sizeof(int32);    // nbytes will be 4 (= 32 bits)
```




You can determine the minimum and maximum values of a numerical type with *.MIN* and *.MAX*, e.g. `int.MIN` and
`int.MAX`. 


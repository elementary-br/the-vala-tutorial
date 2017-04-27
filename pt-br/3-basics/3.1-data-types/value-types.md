# Tipos valor
Vala suporta uma variedade de tipos simples como a maioria das outras linguagens fazem.
-   Byte, `char`, `uchar`; seus nomes são _char_ por motivos históricos.
-   Character, `unichar`; um carácter Unicode 32-bit
-   Integer, `int`, `uint`
-   Long Integer, `long`, `ulong`
-   Short Integer, `short`, `ushort`
-   Guaranteed-size Integer, `int8`, `int16`, `int32`, `int64` assim como seus respectivos não sinalizados `uint8`, `uint16`, `uint32`, `uint64`. O número indica o tamanho em bits.
-   Float number, `float`, `double`
-   Boolean, `bool`; possíveis valores são `true` e `false`
-   Compound, `struct`
-   Enumeration, `enum`; representada por valores inteiros, não classes como os enums de Java

Aqui temos alguns exemplos.

```vala
/* tipos atômicos */
unichar c = 'u';
float percentile = 0.75f;
const double MU_BOHR = 927.400915E-26;
bool the_box_has_crashed = false;

/* definindo um struct */
struct Vector {
    public double x;
    public double y;
    public double z;
}

/* definindo um enum */
enum WindowType {
    TOPLEVEL,
    POPUP
}
```

A maioria desses tipos podem ter tamanhos diferentes em plataformas diferentes, com exceção dos tipos _guaranteed-size integer_(Inteiros de tamanho garantido). O operador `sizeof` retorna o tamanho que variável de um dado tipo ocupa em bytes:

```vala
ulong nbytes = sizeof(int32);    // nbytes será 4 (= 32 bits)
```
Você pode determinar os valores máximos e mínimos de um típo numérico com _.MIN_ e _.MAX_, ex. 'int.MIN' e `int.MAX`.

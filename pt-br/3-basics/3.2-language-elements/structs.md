# Structs


```vala
struct NomeStruct {
    public int a;
}
```
define um tipo `struct`, ex. um tipo valor composto. Uma _struct_ Vala pode ter métodos de uma forma limitada e também pode ter membros privados, de tal forma que o modificador de acesso `public` é requirido explicitamente.

```vala
struct Cor {
    public double vermelho;
    public double verde;
    public double azul;
}
```

É assim que você pode inicializar uma struct:

```vala
// sem inferência de tipos Cor c1 = Cor();
Cor c2 = { 0.5, 0.5, 1.0 };
Cor c3 = Cor() {
    red = 0.5,
    green = 0.5,
    blue = 1.0
};

// com inferência de tipo var c4 = Cor();
var c5 = Color() {
    red = 0.5,
    green = 0.5,
    blue = 1.0
};
```

Structs são alocados no stack/inline e copiados na atribuição.

Para definir um _array_ de structs:

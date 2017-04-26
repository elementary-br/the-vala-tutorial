# Inferência de tipos

Vala has a mechanism called _type inference_, whereby a local variable may be defined using `var` instead of giving a type, so long as it is unambiguous what type is meant. The type is inferred from the right hand side of the assignment. It helps reduce unnecessary redundancy in your code without sacrificing static typing:

Vala tem um mecanismo chamado _type inference_(inferência de tipo), na qual uma variável local pode ser definida usando `var` invés de determinar um tipo, enquanto não for ambíguo que tipo é pretendido. O tipo é inferido pelo lado direito da designação. Isso ajuda a reduzir uma redundância desnecessária no seu código sem sacrificar a tipagem estática.

```vala
var p = new Pessoa();     // same as: Pessoa p = new Pessoa();
var s = "olá";          // mesmo que: string s = "olá";
var l = new List<int>();  // mesmo que: List<int> l = new List<int>();
var i = 10;               // mesmo que: int i = 10;
```

Isso funciona apenas para variáveis locais. Inferência de tipo é especialmente útil para tipos com argumentos de tipo genérico (mais disso depois). Compare

```vala
MyFoo<string, MyBar<string, int>> foo = new MyFoo<string, MyBar<string, int>>();
```
vs.

```vala
var foo = new MyFoo<string, MyBar<string, int>>();
```

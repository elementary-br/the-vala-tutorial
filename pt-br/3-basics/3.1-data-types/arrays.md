# Arrays (Arranjos/Vetores)

Um array é declarado dando o tipo seguido por `[]` e criado usando o operador `new` ex. `int[] a = new int[10]` para criar um arranjo de números inteiros(_integer_). O tamanho do array pode ser obtido pela variável membro(_atributo_) **length** ex. `int count = a.length`. Note que se você escrever `Object[] a = new Object[10]` nenhum objeto vai ser criado, só o array pra armazenar-los.

```vala
int[] a = new int[10];
int[] b = { 2, 4, 6, 8 };
```
Você pode cortar um array com `[começo:fim]`:
```vala
int[] c = b[1:3];     // => { 4, 6 }
```
Cortando um array vai resultar numa referencia para o dado requerido, não uma cópia. Porem, designando um recorte para uma variável _owned_ (como feito abaixo) vai resultar em uma cópia. Se você quer evitar uma copia, você precisa designar o recorte a um array _unowned_ ou passar diretamente para um argumento (argumentos são, por definição, não próprios):

```vala
unowned int[] c = b[1:3];     // => { 4, 6 }
```
Arrays Multi-dimensionais são definidos com `[,]` ou `[,,]` etc.

```vala
int[,] c = new int[3,4];
int[,] d = {{2, 4, 6, 8},
            {3, 5, 7, 9},
            {1, 3, 5, 7}};
d[2,3] = 42;
```

Esse tipo de array é representado por um único bloco de memória contíguo. Arrays multi-dimensionais irregulares (`[][]`, também conhecido como "arranjos empilhados/arrays empilhados"), aonde cada linha pode ter um tamanho diferente, ainda não são suportados.

Para encontrar o tamanho de cada dimenção em um array multi-dimensional, o membro _length_ vira um array, armazenando o tamanho de cada respectiva dimensão.

```vala
int[,] arr = new int[4,5];
int r = arr.length[0];
int c = arr.length[1];
```
Por favor note que você não pode obter um array mono-dimensional de um array multidimensional, nem mesmo recortar um array multidimensional:

```vala
int[,] arr = {{1,2},
                {3,4}};
int[] b = arr[0];  // não vai funcionar int[] c = arr[0,];  // não vai funcionar int[] d = arr[:,0];  // não vai funcionar int[] e = arr[0:1,0];  // não vai funcionar int[,] f = arr[0:1,0:1];  // não vai funcionar
```

Você pode inserir elementos dinamicamente no array com o operador `+=`. Todavia, isso só funciona para arrays locais ou privados. O array é automaticamente realocado se for necessário. Internamente essa realocação acontece com os tamanhos crescendo em potencia de 2 pela eficiência de tempo de execução. Porem, `.length` guarda o numero atual de elementos, não o tamanho interno.

```vala
int[] e = {};
e += 12;
e += 5;
e += 37;
```

Você pode redimensionar um array chamando _resize()_ nele. Isso vai manter o conteúdo original(o quanto couber).

```vala
int[] a = new int[5];
a.resize(12);
```
Você pode mover elementos dentro do array chamando _move(src, dest, length)_ nele. A posição original vai ser preenchida com 0.

```vala
uint8[] chars = "hello world".data;
chars.move (6, 0, 5);
print ((string) chars); // "world "
```

Se você colocar os colchetes quadrados _após_ o indentificador junto com um indicador do tamanho você vai ter um array de tamanho fixo. Arrays com tamanho fixo são alocados no stack (se usado como variável local) ou alocado in-line (se usado como campo) e você não pode os realocar depois.

```vala
int f[10];     // no 'new ...'
```
Vala não faz nenhuma verificação de limite do acesso dos arrays na execução. Se você precisa de mais segurança deve usar uma estrutura de dados mais sofisticada como um _ArrayList_. Você vai aprender mais sobre isso depois na sessão sobre _colecões_.

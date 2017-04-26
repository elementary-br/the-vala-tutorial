# Métodos anônimos/Closures

<!-- TODO: Traduzir os exemplos -->
```vala
(a) => { stdout.printf("%d\n", a); }
```

Um _método anônimo_, támbem conhecido como uma _expressão lambda_, _função literal_ ou _closure_, pode ser definida em Vala com o operador `=>` . A lista de parâmetros fica a esquerda do operador, e o escopo do método à direita.

Um método anônimo por si só como como acima não faz muito sentido. Ele só é útil se designado diretamente a váriavel de um tipo delegado ou passado como um argumento à outro método.

Tenha em mente que nem o parâmetro nem o tipo de retorno é informado explicitamente. Invés disso os tipos são inferidos pela assinatura da delegação usada.

Designando um método anônimo para uma variável delegada:

```vala
delegate void PrintIntFunc(int a);

void main() {
    PrintIntFunc p1 = (a) => { stdout.printf("%d\n", a); };
    p1(10);

    // Curly braces are optional if the body contains only one statement:
    PrintIntFunc p2 = (a) => stdout.printf("%d\n", a);
    p2(20);
}
```

Passando um método anônimo para outro método:

```vala
delegate int Comparator(int a, int b);

void my_sorting_algorithm(int[] data, Comparator compare) {
    // ... 'compare' é chamado em algum lugar aqui ...
}

void main() {
    int[] data = { 3, 9, 2, 7, 5 };
    // Um método anônimo é passado como um segundo argumento:
    my_sorting_algorithm(data, (a, b) => {
        if (a < b) return -1;
        if (a > b) return 1;
        return 0;
    });
}
```

Métodos anônimos são [closures](http://pt.wikipedia.org/wiki/Closure_(ciência da computação)) reais. Isso significa que você pode acessar variáveis locais de um método exterior dentro da _expressão lambda_:

```vala
delegate int IntOperation(int i);

IntOperation curried_add(int a) {
    return (b) => a + b;  // 'a' is an outer variable
}

void main() {
    stdout.printf("2 + 4 = %d\n", curried_add(2)(4));
}
```
Nesse de _adição com currying_(veja [Currying](http://pt.wikipedia.org/wiki/Currying)) retorna um método recém criado que preserva o valor de _a_. Esse método retornado é chamado diretamente depois com 4 como argumento resultante na soma de dois números.
//TODO: In this example *curried\_add* (see [Currying](http://en.wikipedia.org/wiki/Currying)) returns a newly created method that preserves the value of *a*. This returned method is directly called afterwards with 4 as argument resulting in the sum of the two numbers.

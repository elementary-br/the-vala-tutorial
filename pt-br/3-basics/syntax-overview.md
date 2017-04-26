# Visão geral da sintaxe

A sintaxe do Vala é uma síntese de C\# e Java. Como resultado, a maioria disso será familiar para programadores que conhecem alguma linguagem parecida com C.

O escopo é definido usando [chaves](https://pt.wikipedia.org/wiki/Chave_(pontua%C3%A7%C3%A3o)). Um objeto ou referência só é válido entre `{` e `}`. Estes são também os delimitadores usados para definir classes, métodos, blocos de código, etc, então eles automaticamente têm seus prórpios escopos. Vala não é estrita sobre aonde as váriaveis são declaradas.

Um identificador é definido pelo tipo e nome, ex. `int c` significa um inteiro chamado _c_. No caso dos tipos valor isso também cria um objeto de dado tipo. Para tipos referência esses tipos apenas definem uma nova referencia que inicialmente não aponta a lugar nenhum.

Nomes de identificadores podem ser qualquer combinação de letras (\[a-z], \[A-Z]), sublinha e dígitos. Todavia, para definir ou referir a um identificador com um nome que começa com um digito ou uma palavra-chave, você deve prefixar com um caractere `@`. Esse caractere não é considerado parte do nome. Por exemplo você pode nomear um método _foreach_ escrevendo `@foreach`, mesmo sendo uma palavra-chave reservada do Vala. Você pode omitir o caractere `@` quando for interpretado como um nome de identificador inequivocamente, como em `foo.foreach()`.

Tipos referencia são instanciados usando o operador `new` e o nome de um método de construção, o qual é usualmente o nome do tipo, ex. `Object o = new Object()` cria um novo Object e faz _o_ uma referência a ele.

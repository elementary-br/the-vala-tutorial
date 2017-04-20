# O primeiro programa

```vala

class Demo.OlaMundo : GLib.Object {

    public static int main(string[] args) {

        stdout.printf("Olá, Mundo\n");

        return 0;
    }
}
```

O respeitável programa *Olá mundo* em Vala.

```
class Demo.OlaMundo : GLib.Object {
```

Essa linha identifica o começo da definição da classe. As classes em Vala são muito similares em conceito com outras linguagens. Uma classe é basicamente um tipo de objeto, das quais as instancias podem ser criadas, todas tendo as mesmas propriedades. A implementação de um tipo classificado é feita pela biblioteca *gobject*, esses detalhes não são importantes para uso geral.

O importante é que essa classe é especificamente descrita como sendo uma subclasse da *GLib.Object*. Isto é porque a Vala permite outros tipos de classe, mas nos casos gerais é o tipo que você quer. De fato, alguns recursos do Vala só são permitidos se sua classe é descendente de um *Object*, proveniente da GLib.


```vala
public static int main(string[] args) {
```
Esse é o começo da definição de um método. Um método é uma função relacionada a um tipo de objeto e que pode ser executada num objeto daquele tipo. O método estático significa que esse método pode ser chamado sem uma instancia em particular. O fato do método ser chamado *main* e ter a assinatura significa que o Vala vai reconhece-lo como o ponto de entrada do programa.

O método *main* não precisa ser definido dentro de uma classe. Porem, caso seja, precisa ser *estático*. Não importa se *público* ou *privado*. O retorno pode ser inteiro(**int**) ou vazio(**void**). Com um retorno vazio(**void**) o programa vai terminar implicitamente com o código de retorno 0. O arranjo de caracteres para captura de argumentos de linha de comando é opcional.

```vala
stdout.printf("Olá, Mundo\n");
```

*stdout* é um objeto no **namespace** *GLib* que certifica o Vala de que você tem o acesso requerido. Essa linha instrui o Vala a executar o método chamado *printf* do objeto *stdout*, com uma string Olá, Mundo como argumento. No Vala, essa sempre é a sintaxe usada para chamar um método num objeto, ou pra acessar os dados de um objeto. `\n` é a sequencia de escape para uma nova linha.

``` vala
return 0;
```
A função da palavra `return` é de retornar um valor para quem à chamou e terminar a execução do método *main* que támbem termina a execução do programa. O valor retornado pelo método *main* é tido como código de saída do programa.

A ultima linha finaliza as definições do método e da classe.

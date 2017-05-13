# Exemplos

Siga este exemplo de como escrever uma biblioteca simples em Vala, e também para compilar e testá-la localmente sem ter que instalar primeiro.

Salve o seguinte código em um arquivo chamado *test.vala*. Nele estará o código da biblioteca, contendo as funções que queremos chamar de nosso programa principal.


```vala
public class MyLib : Object {

    public void hello() {
        stdout.printf("Hello World, MyLib\n");
    }

    public int sum(int x, int y) {
        return x + y;
    }
}
```
Use o seguinte comando para gerar os arquivos *test.c*, *test.h* e *test.vapi*. Essas são as versões em C da biblioteca a serem compiladas e o arquivo VAPI que representa a interface pública da biblioteca.

    $ valac -C -H test.h --library test test.vala --basedir ./

Agora, compile a biblioteca:

    $ gcc --shared -fPIC -o libtest.so $(pkg-config --cflags --libs gobject-2.0) test.c

Salve o seguinte código em um arquivo denominado *hello.vala*. Este é o código que usará a biblioteca que criamos.

```vala
void main() {
    var test = new MyLib();
    test.hello();
    int x = 4, y = 5;
    stdout.printf("The sum of %d and %d is %d\n", x, y, test.sum(x, y));
}
```

Compile o código do aplicativo, dizendo ao compilador que queremos vincular a biblioteca que acabamos de criar.

    $ valac -X -I. -X -L. -X -ltest -o hello hello.vala test.vapi --basedir ./

Agora podemos executar o programa. Este comando indica que qualquer biblioteca necessária será encontrada no diretório atual.

    $ LD_LIBRARY_PATH=$PWD ./hello

A saída do programa deve ser:

    Hello World, MyLib
    The sum of 4 and 5 is 9

Você também pode criar um arquivo GIR GObjectIntrospection para sua biblioteca com a opção `--gir`:

    valac -C test.vala --library test --gir Test-1.0.gir

Arquivos GIR são descrições XML da API


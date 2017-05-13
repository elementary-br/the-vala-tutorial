# Criando uma biblioteca

### Usando Autotools

É possível usar Autotools para criar uma biblioteca escrita em Vala. Uma biblioteca é criada usando o código C gerado pelo compilador Vala, vinculando e instalando como qualquer outra biblioteca. Então você precisa dizer quais arquivos C devem ser usados para criar a biblioteca e quais deles devem ser distribuíveis, permitindo que outros compilem um arquivo do tipo tar sem Vala, usando apenas comandos Autotools padrão: **configure**, **make** and **make install**.

### Compilação e comando de vinculação using

A Vala ainda não é capaz de criar bibliotecas dinâmicas ou estáticas diretamente. Para criar uma biblioteca, prossiga com a opção `-c` (compilar somente) e vincule os arquivos de objeto com seu vinculador favorito, ou seja,` libtool` ou `ar`.

    $ valac -c ...(source files)
    $ ar cx ...(object files)


Ou compilando o código C intermediário com *gcc*

    $ valac -C ...(source files)
    $ gcc -o my-best-library.so --shared -fPIC ...(compiled C code files)...

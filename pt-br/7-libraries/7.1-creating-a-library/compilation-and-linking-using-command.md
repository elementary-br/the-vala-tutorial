# Compilação e comando de vinculação using

A Vala ainda não é capaz de criar bibliotecas dinâmicas ou estáticas diretamente. Para criar uma biblioteca, prossiga com a opção `-c` (compilar somente) e vincule os arquivos de objeto com seu vinculador favorito, ou seja,` libtool` ou `ar`.

    $ valac -c ...(source files)
    $ ar cx ...(object files)


Ou compilando o código C intermediário com *gcc*

    $ valac -C ...(source files)
    $ gcc -o my-best-library.so --shared -fPIC ...(compiled C code files)...

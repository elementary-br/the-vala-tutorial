# Ferramentas

Vala possui vários programas para ajudá-lo a construir e trabalhar com aplicativos Vala. Para obter mais detalhes de cada ferramenta, consulte o site.

### valac

*valac* é o compilador Vala. Sua função principal é transformar o código Vala em código C compilável, embora também possa automatizar todo o projeto de construção e link em casos simples.

Um exemplo simples:


    $ valac -o appname --pkg gee-1.0 file_name_1.vala file_name_2.vala


O parâmetro `-o` solicita que um arquivo de objeto seja criado, em vez de apenas produzir arquivos de origem C. A opção `--pkg` diz que essa compilação precisa de informações do pacote *gee-1.0*. Não é necessário especificar detalhes sobre quais bibliotecas será necessário vincular, o pacote tem essas informações internamente. Finalmente, é fornecida uma lista de arquivos de origem. Se você precisar de um processo de compilação mais complicado, use a opção `-C` para gerar arquivos C em vez de um binário e continuar o processo manualmente ou através de um script.

### vapigen

*vapigen* é uma ferramenta para fazer Bindings. Ele cria arquivos VAPI a partir de metadados de uma biblioteca e qualquer informação extra necessária. Veja também [Vala Bindings Tutorial](/Projects/Vala/Bindings).

<!-- ### vala-gen-introspect -->

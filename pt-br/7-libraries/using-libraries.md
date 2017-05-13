# Usando bibliotecas

Usar uma biblioteca em Vala é amplamente automatizado se você usar o compilador *valac*. Os arquivos de biblioteca específicos Vala compõem o que é conhecido como um pacote. Você diz ao compilador que um pacote é necessário pelo seu programa da seguinte maneira:

`$ valac --pkg gee-1.0 test.vala`

Este comando significa que seu programa pode usar qualquer uma das definições no arquivo *gee-1.0.vapi*, e também qualquer em qualquer um dos pacotes que *gee-1.0* depende. Essas dependências seriam listadas em *gee-1.0.deps* se houvesse alguma. Neste exemplo *valac* é definido para construir todo o caminho para o binário e, portanto, incorporar informações do *pkg-config* para ligar as bibliotecas corretas. É por isso que os nomes do *pkg-config* também são usados ​​para nomes de pacotes Vala.

Os pacotes são geralmente usados ​​com namespaces, mas não são tecnicamente relacionados. Isso significa que, mesmo que seu aplicativo seja construído com referência ao pacote, você ainda deve incluir as instruções `using` necessárias em cada arquivo, conforme apropriado, ou usar os nomes totalmente qualificados de todos os símbolos.

Também é possível tratar uma biblioteca local (que não está instalada) como um pacote. Para comparação, a própria Vala usa uma versão interna de Gee. Quando o *valac* é construído ele cria um arquivo VAPI desta biblioteca interna e usa-o aproximadamente da seguinte maneira:

`$ valac --vapidir ../gee --pkg gee ...`

Para obter detalhes sobre como gerar esta biblioteca, consulte a próxima seção ou o exemplo.

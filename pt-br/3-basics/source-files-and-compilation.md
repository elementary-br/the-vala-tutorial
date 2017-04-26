# Arquivos-fonte e compilação
Código vala é escrito em arquivos com extenção _.vala_. Ele não reforça a estrutura tanto quanto linguagens como Java - não existem conceitos de pacotes ou classes nos arquivos. Invés disso a estrutura é definida pelo texto dentro de cada arquivo, descrevendo a localização lógica do código com construtores como _namespaces_. Quando você quer compilar código Vala, você descreve ao compilador uma lista de arquivos requeridos, e Vala entende como eles se encaixam.

A vantagem disso é que você pode por quantas classes ou funções você quiser dentro do arquivo, até combinando partes de diferentes _namespaces_ juntas. Isso não é necessáriamente uma boa ideia. Existem certas convenções que você provavelmente quer seguir. Um bom exemplo de como estruturar um projeto em Vala é o próprio projeto Vala.

Todos os arquivos fonte para o pacote são supridos como parâmetros da linha de comando para o compilador Vala `valac`, junto com as bandeiras(_flags_) do compilador. Por exemplo:

    $ valac compiler.vala --pkg libvala

irá produzir um binário com o nome _compiler_ que vincula com o pacote _libvala_. De fato, é como o compilador _valac_ é produzido!

Se você quer que o binário tenha um nome diferente ou se você passou multiplos arquivos fonte ao compilador você pode especificar o nome do executável explicitamente com o parâmetro `-o`:

    $ valac source1.vala source2.vala -o meuprograma
    $ ./meuprograma

Se você passar o parầmetro `-C` ao _valac_, ele não compilará seu programa em arquivo binário.
Invés disso a saída será o código C para cada código fonte Vala correspondente, nesse caso _source1.c_ e _source2.c_. Se você olhar o conteudo desses arquivo você pode ver programar uma classe em Vala é equivalente a mesma tarefa em C, porém bem mais sucinto. Você vai também perceber que essa classe é registrada dinamicamente na execução. Isso é um bom exemplo do poder da plataforma GNOME, mas como foi dito antes, você não precisa saber sobre isso para usar Vala.

Se você quer ter um arquivo header em C para o seu projeto você pode usar o parâmetro `-H`:

    $ valac ola.vala -C -H ola.h

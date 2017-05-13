### O que é Vala?

Vala é uma linguagem de programação que habilita técnicas modernas à serem usadas para escrever aplicações que rodam na plataforma Gnome, particulamente Glib e GObject. Esta plataforma tem à bastante tempo um ambiente de programação completo, com certas características como um sistema de tipos dinâmico e gerenciamento de memória assistida. Antes de Vala, o único caminho para programar para a plataforma era com a apis nativas da máquina c, que expôe com muita frequência detalhes indesejados, com uma linguagem de alto nível que tem um assistente de máquina virtual, tais como as linguagens Python ou o Mono/c\#, ou alternativamente, com c++ através de uma wrapper library.

Vala é diferente de todas estas outras técnicas, como suas saídas são códigos gerados em C que podem ser compiladas para executar sem a necessidade de suporte a bibliotecas extras além da plataforma Gnome. Isto tem muitas consequências, porém mais importante:

-   Programas escritos em Vala devem ter performance amplamente similar daqueles escritos diretamente em C, sendo mais fácil e rápido escrever e manter.
-   Uma aplicação em vala não pode fazer nada que não possa ser feito em C. Enquanto Vala introduz várias funcionalidades na linguagem que não estão acessíveis em C, estas são todas mapeadas para contrução em C, embora sejam  frequentemente aquelas que são difíceis ou muito demorado para escrever diretamente.

Assim sendo, enquanto Vala é uma linguagem moderna com todos os recursos que você esperaria, ela ganha seu poder de uma plataforma existente, e deve de certa forma obedecer algumas regras por ela estabelecida.

### Para quem é este tutorial?

Este tutorial não irá entrar em profundidade sobre as práticas básicas de programação.
Ele irá apenas explicar brevemente as práticas de programação orientado à objetos, ao invés de focar em como Vala aplica os conceitos. Assim sendo, será útil se você já têm experiência de uma variedade de linguagens de programação, embora o conhecimento aprofundado de qualquer uma linguagem em particular não seja necessário.

Vala compartilha muitas sintaxes com C\#, porém o tutorial irá tentar evitar descrever características em termos de similaridades ou diferenças com C\# ou Java, com o objetivo de faze-lo mais acessível.

O que será bem útil é uma compreenção razoável de C, ao passo que isso não seja necessário para entender Vala. É importante perceber que programas em Vala são executados como C, e irá frequentemente interagir com biblitecas em C. Ter uma compreensão razoável de C irá ajudar a criar um entendimento aprofundado em Vala mais facilmente.

### Convenções
O código será em `texto monoespaçado`, e os comandos serão todos prefaciados com o caractere `$` do prompt.
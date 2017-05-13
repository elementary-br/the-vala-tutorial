### O que é Vala?

Vala é uma linguagem de programação que habilita técnicas modernas à serem usadas para escrever aplicações que rodam na plataforma Gnome, particulamente Glib e GObject. Esta plataforma tem à bastante tempo um ambiente de programação completo, com certas características como um sistema de tipos dinâmico e gerenciamento de memória assistida. Antes de Vala, o único caminho para programar para a plataforma era com a apis nativas da máquina c, que expôe com muita frequência detalhes indesejados, com uma linguagem de alto nível que tem um assistente de máquina virtual, tais como as linguagens Python ou o Mono/c\#, ou alternativamente, com c++ através de uma wrapper library.

Vala é diferente de todas estas outras técnicas, como suas saídas são códigos gerados em C que podem ser compiladas para executar sem a necessidade de suporte a bibliotecas extras além da plataforma Gnome. Isto tem muitas consequências, porém mais importante:

-   Programas escritos em Vala devem ter performance amplamente similar daqueles escritos diretamente em C, sendo mais fácil e rápido escrever e manter.
-   Uma aplicação em vala não pode fazer nada que não possa ser feito em C. Enquanto Vala introduz várias funcionalidades na linguagem que não estão acessíveis em C, estas são todas mapeadas para contrução em C, embora sejam  frequentemente aquelas que são difíceis ou muito demorado para escrever diretamente.

Assim sendo, enquanto Vala é uma linguagem moderna com todos os recursos que você esperaria, ela ganha seu poder de uma plataforma existente, e deve de certa forma obedecer algumas regras por ela estabelecida.
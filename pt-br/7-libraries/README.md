# Bibliotecas

A nível do sistema, uma biblioteca Vala é exatamente uma biblioteca C e, portanto, as mesmas ferramentas são usadas. A fim de tornar o processo mais simples, e para que o compilador Vala possa entender o processo, há um nível extra de informações específicas de Vala.

Uma "biblioteca Vala" é, portanto, a parte do sistema:

-   Uma biblioteca de sistema (por exemplo, *libgee.so*)
-   Uma entrada *pkg-config* (por exemplo, *gee-0.8.pc*)

Ambos estão instalados nos locais padrão. E os arquivos específicos de Vala:

-   Um arquivo VAPI (por exemplo, *gee-0.8.vapi*)
-   Um arquivo de dependência opcional (por exemplo, *gee-0.8.deps*)

Esses arquivos serão explicados mais adiante nesta seção. Deve-se notar que os nomes das bibliotecas são os mesmos nos arquivos específicos de Vala como nos arquivos *pkg-config*.

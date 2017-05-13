# Construindo bibliotecas com VAPI

Os arquivos VAPI são descrições da interface pública de bibliotecas externas de Vala. Quando uma biblioteca é escrita em Vala, este arquivo é criado pelo compilador Vala e, basicamente, um ajuntamento de todas as definições públicas de todos os arquivos de origem Vala. Para uma biblioteca escrita em C, o arquivo VAPI fica mais complicado, especialmente se as convenções de nomenclatura da biblioteca não seguem a convenção GLib. O arquivo VAPI neste caso conterá muitas anotações descrevendo como a interface Vala padronizada ficará na versão C.

O processo de criar geralmente equivale a três etapas,

-   Executar *vala-gen-introspect* para extrair metadados da biblioteca C.
-   Adicionar metadados extras para padronizar a interface ou fazer várias outras alterações.
-   Gerar um arquivo VAPI das fontes acima usando *vapigen*.

Instruções específicas sobre como gerar bindings estão no [Vala Bindings Tutorial](/Projects/Vala/Bindings)

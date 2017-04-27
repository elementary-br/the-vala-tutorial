# Atributos de código

Atributos de códigos instruem ao compilador Vala detalhes de como o código deve funcionar na plataforma desejada. Sua sintaxe é
`[NomeDoAtributo]` ou `[NomeDoAtributo(param1 = valor1, param2 = valor2, ...)]`.

Eles são usados mais usados para bindings nos arquivos _vapi_, `[CCode(...)]` sendo o atributo mais proeminente aqui.

Outro exemplo é o atributo `[DBus(...)]` para exportar interfaces remotas pelo [D-Bus](http://www.freedesktop.org/wiki/Software/dbus)

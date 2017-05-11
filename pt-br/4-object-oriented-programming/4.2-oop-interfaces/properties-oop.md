# Propriedades

Uma interface pode definir propriedades que precisam ser implementadas para classes. A classe implementadora precisa definir uma propriedade com a mesma assinatura e permissão de acesso ao `get` e `set`.

Como qualquer propriedade GObject, você pode definir um corpo para o `get` e `set` da propriedade na classe implementadora, quando nenhum corpo é usado valores são set e get por padrão. Se dados, você precisa definir um campo privado para guardar os valores da propriedade para ser usado dentro ou fora da classe.

A definição da interface `Discavel`, define uma propriedade `atendendo`. Nesse caso essa interface define um `atendendo` com um `protected set`, permitindo uma propriedade somente leitura para qualquer objeto usando uma instância de `Discavel`, mas permite que os implementadores da classe escrevam valores nela, como a classe `SmartPhone` faz quando implementa o método `suspender()`.

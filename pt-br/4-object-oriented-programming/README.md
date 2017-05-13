# Programação orientada a objetos

Mesmo Vala não forçando você a trabalhar com objetos, alguns recursos não são disponiveis de outra forma. Sendo assim, você certamente vai querer programar programar em um estilo orientado a objetos na maioria do tempo. Como na maioria das linguagens atuais, com o objetivo de definir seus próprio objetos, você vai escrever uma definição de classe.

Uma definição de classe dita que tipo de dado cada objeto de seu tipo possúi, quais outros objetos ele tem referência, e quais métodos podem ser executados nela. Uma definição pode incluir o nome de outra classe a qual a nova deve ser uma subclasse. A instancia de uma classe é também uma instancia de todas as super classes da classe, por ela derivar todos os métodos e dados, entretanto ela pode não ser capaz de acessar toda a super classe. Uma classe pode também implementar qualquer quantidade de interfaces, quais são um conjunto de definições de métodos que devem ser implementados pela classe - uma instancia de uma classe é também uma instancia de cada interface implementada por sua classe ou super classe.

Classes em Vala podem também ter membros estáticos. Esse modificador permite que qualquer dado ou método seja pertencente a classe como um todo, invés de ser especifica de sua instancia. Tais membros podem ser acessados sem a posse de uma instancia de uma classe.

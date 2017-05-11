# Definindo pré-requisitos

Interfaces em Vala podem não herdar de nenhuma outra interface, mas elas podem declarar outras interfaces como pré-requisito, que funciona grosseiramente do mesmo jeito. Por exemplo, pode ser desejável dizer que qualquer classe que implemente uma interface `List` deva implementar também as interfaces `Collection` e `Traversable`. A sintaxe para isso é exatamente a mesma para descrever implementação de interfaces em classes:

```vala
public interface List : Collection, Traversable {
}
```

A definição de List não pode ser implementada em uma classe sem Collection ser implementada também, então Vala obriga o seguinte estilo de declaração para uma classe desejando implementar List, aonde todas as interfaces implementadas também devem ser descritas:

```vala
public class ListClass : GLib.Object, Collection, List {
}
```

Interfaces Vala também podem ter classes como pré-requisito. Se um nome de classe é dado na lista de pré-requisitos.a interface só pode ser implementada em uma classe que deriva dessa classe. Isso é usado frequentemente para garantir que uma instância da interface é também uma subclasse de GLib.Object, e então a interface pode ser usara, por exemplo, como o tipo de uma propriedade.

O fato que interfaces não podem herdar de outras interfaces é geralmente uma distinção técnica apenas - na pratica Vala funciona da mesma forma que outras linguagens nesse ponto, mas com o recurso extra de pré-requisitos de classe.

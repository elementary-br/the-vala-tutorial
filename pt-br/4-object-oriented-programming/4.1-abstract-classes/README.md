# Classes abstratas

Existe outro modificador para métodos, chamado `abstract`. Esse modificador permite que você descreva um método que não é atualmente implementado na classe. Invés disso, ele deve ser implementado pela subclasse antes de ser chamado. Isso permite que vocÊ defina operações que podem ser chamadas em todas instâncias de um tipo, enquanto ensegura-se de que todos os tipos mais específicos provêem sua própria versão da funcionalidade.

Uma classe contendo métodos abstratos deve ser declarada `abstract`(abstrata) também. O resultado disso é previnir qualquer instanciação do tipo.

```vala
public abstract class Animal : Object {

    public void comer() {
        stdout.printf("*nham nham*\n");
    }

    public abstract void diga_oi();
}

public class Tigre : Animal {

    public override void diga_oi() {
        stdout.printf("*rugido*\n");
    }
}

public class Pato : Animal {

    public override void diga_oi() {
        stdout.printf("*quack*\n");
    }
}
```

A implementação de um método abstrato deve ser marcada com `override`. Propriedades também podem ser abstratas.

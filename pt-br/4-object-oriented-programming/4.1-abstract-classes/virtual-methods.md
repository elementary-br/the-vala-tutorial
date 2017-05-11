# Métodos virtuais

Um método `virtual` permite que sejam definidas implementações padrão para classes `abstract`(abstratas) e permitem que uma classe filha sobreponha seu comportamento, isso é diferente de esconder métodos.

```vala
public abstract class Discador : GLib.Object {
   public abstract string nome { get; protected set; }
   public abstract void atualizar (string novo_nome);
   public virtual bool restaurar ()
   {
      nome = "Sem nome";
      return true;
   }
}

public class ContatoCV : Discador
{
   public override string nome { get; protected set; }
   public override void atualizar (string novo_nome)
   {
     nome = "ContatoCV - " + novo_nome;
   }
   public override bool restaurar ()
   {
      nome = "ContatoCV-Nome";
      stdout.printf ("CotatoCV.restaurar () implemetação!\n");
      return true;
   }
}

public class Contato : Discador {
   public override string nome { get; protected set; }
   public override void atualizar (string novo_nome)
   {
     name = "Contato - " + novo_nome;
   }

   public static void main ()
   {
      var c = new Contato ();
      c.atualizar ("John Strauss");
      stdout.printf(@"Nome: $(c.nome)\n");
      c.restaurar ();
      stdout.printf(@"Restaurar Nome: $(c.nome)\n");

      var cv = new ContatoCV ();
      cv.atualizar ("Xochitl Calva");
      stdout.printf(@"Nome: $(cv.nome)\n");
      cv.restaurar ();
      stdout.printf(@"Restaurar Nome: $(cv.nome)\n");
      stdout.printf("FIM\n");
   }
}
```

Como você pode ver no exemplo acima, `Discador` é uma classe abstrata(`abstract`) definindo uma propriedade abstrata e um método abstrato, mas adiciona um método `virtual` que pode ser sobreposto pela classe derivada. A classe `Contato` implementa métodos e propriedades abstratas de `Discador`, enquanto usa a implementação padrão de `restaurar()` por não definir uma nova. A classe `ContatoCV` implemeta todas as definições abstratas do `Discador`, mas sobrepõe `restaurar()` para definir uma implementação própria.

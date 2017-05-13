# Definindo padrão de implementação em métodos

Existe também outra diferença importante entre interfaces de Vala e Java/C\# : As interfaces de Vala podem ter métodos não-abstratos.

Vala permite implementação de métodos em interfaces, então um método com uma implementação padrão deve ser declarado como `virtual`. Devido a este fato interfaces Vala podem agir como [mixins(em inglês)](http://en.wikipedia.org/wiki/Mixins).Isso é uma forma restrita de múltiplas heranças.

```vala
public interface Discavel : GLib.Object {
   public abstract bool atentendo { get; protected set; }
   public abstract void atender ();
   public virtual bool suspender ()
   {
      atender = false;
      return true;
   }
}
```

A interface `Discavel` define uma propriedade abstrata chamada `atendendo`, aonde qualquer classe implementando essa interface pode monitorar o estado de uma chamada, detalhes sobre `atender` são um problema do implementador, mas `suspender` define uma implementação padrão para por `atendendo` em falso quando uma chamada for suspensa.

```vala
public class Fone : GLib.Object, Discavel {
   public bool atendendo { get; protected set; }
   public void atender ()
   {
     /* implementação de código do responder */
   }

   public static void main ()
   {
      var f = new Fone ();
      if (f.suspender ())
         stdout.printf("Suspenção concluída.\n");
      else
         stdout.printf("Erro na suspenção!\n");
      stdout.printf("FIM\n");
   }
}
```

Quando compilar e executar, você discobrirá que a classe `Fone` não implementa o método `Discavel.suspender()`, mas é capaz de usa-lo, então o resultado é a mensagem `Suspenção concluída`.

```vala
public class SmartPhone : GLib.Object, Discavel
{
   public bool atendendo { get; protected set; }
   public void atender ()
   {
      /* implementação de código do responder */
   }
   public bool suspender ()
   {
      atendendo = false;
      stdout.printf ("Implementação SmartPhone.suspender ()!");
      return false;
   }
}
```

Nesse caso `SmartPhone` é outra implementação ao `Discavel`, então quando o método `suspender()` é chamado na instância de `SmartPhone` ele retornará `falso` e imprimirá a mensagem `Implementação SmartPhone.suspender ()!`, escondendo completamente a implementação padrão `Discavel.suspender()`

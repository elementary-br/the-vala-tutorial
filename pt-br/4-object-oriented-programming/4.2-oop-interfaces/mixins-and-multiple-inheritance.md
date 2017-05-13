# Mixins e mútiplas heranças

Como descrito antes, Vala enquanto é apoiado em C e GObjects, pode prover um mecanismo limitado de mútipla herança, ai adicionar métodos virtuais as interfaces. É possível adicionar alguns jeitos de definir implementação padrão a métodos em classes implementadoras das interfaces e permitir que classes derivadas sobreponham esses métodos.

Se você definir um método `virtual` em uma interface e implementar isso em uma classe, você não pode sobrepor o método da interface sem deixar a classe derivada incapaz de acessar a implementação padrão da interface.
Considere o caso a seguir:

```vala
public interface Callable : GLib.Object {
   public abstract bool answering { get; protected set; }
   public abstract void answer ();
   public abstract bool hang ();
   public static bool default_hang (Callable call)
   {
      stdout.printf ("At Callable.hang()\n");
      call.answering = false;
      return true;
   }
}

public abstract class Caller : GLib.Object, Callable
{
   public bool answering { get; protected set; }
   public void answer ()
   {
     stdout.printf ("At Caller.answer()\n");
     answering = true;
     hang ();
   }
   public virtual bool hang () { return Callable.default_hang (this); }
}

public class TechPhone : Caller {
        public string number { get; set; }
}

public class Phone : Caller {
   public override bool hang () {
        stdout.printf ("At Phone.hang()\n");
        return false;
   }

   public static void main ()
   {
      var f = (Callable) new Phone ();
      f.answer ();
      if (f.hang ())
         stdout.printf("Hand done.\n");
      else
         stdout.printf("Hand Error!\n");

      var t = (Callable) new TechPhone ();
      t.answer ();
      if (t.hang ())
         stdout.printf("Tech Hand done.\n");
      else
         stdout.printf("Tech Hand Error!\n");
      stdout.printf("END\n");
   }
}
```

Nesse caso, nós definimos uma interface `Callable` com uma implementação padrão para `abstract bool hang ()` chamada `default_hang`, ela pode ser um método `static` ou `virtual`. Então `Caller` é a classe base implementando `Callable` para as classes `TechPhone` e `Phone`, enquanto o método `hang ()` da `Caller` usa a implementação padrão de `Callable`. `TechPhone` não faz nada e pega `Caller` como classe base, usando a implementação padrão do método, mas `Phone` sobrepõe `Caller.hang ()` e isso faz com que ele usa sua própria implementação, permitindo sempre chama-lo mesmo se for convertido em um objeto `Callable`.

##### Implementação explícita de método

A implementação explicita de métodos de interface permite que sejam implementadas duas interfaces que tenham os mesmos métodos (não propriedades) com o mesmo nome.

Exemplo:

```vala
interface Foo {
 public abstract int m();
}

interface Bar {
 public abstract string m();
}

class Cls: Foo, Bar {
 public int Foo.m() {
  return 10;
 }

 public string Bar.m() {
  return "bar";
 }
}

void main () {
 var cls = new Cls ();
 message ("%d %s", ((Foo) cls).m(), ((Bar) cls).m());
}
```

A saída será 10 bar.

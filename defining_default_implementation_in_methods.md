# Defining default implementation in methods

There's another important difference between Vala interfaces and Java/C\# interfaces: Vala interfaces may have non-abstract methods.

Vala actually allows method implementations in interfaces, then a method with a default implementation must be declared as `virtual`. Due to this fact Vala interfaces can act as [mixins](http://en.wikipedia.org/wiki/Mixins). This is a restricted form of multiple inheritance. 



```vala
public interface Callable : GLib.Object {
   public abstract bool answering { get; protected set; }
   public abstract void answer ();
   public virtual bool hang ()
   {
      answering = false;
      return true;
   }
}
```

Interface `Callable` defines an abstract property called `answering`, where any class implementing this interface can monitor the state of a call, details about `answer` a call is a mautter of the implementator, but `hang` defines a default implementation to set `answering` to false when hanging a call. 

```vala
public class Phone : GLib.Object, Callable {
   public bool answering { get; protected set; }
   public void answer ()
   {
     /* answer code implementation */
   }
   
   public static void main ()
   {
      var f = new Phone ();
      if (f.hang ())
         stdout.printf("Hand done.\n");
      else
         stdout.printf("Hand Error!\n");
      stdout.printf("END\n");
   }
}
```

When compiling and running, you will find that `Phone` class actually no implements `Callable.hang()` method, but it is able to use it, then the result is a message `Hang done.`

```vala
public class TechPhone : GLib.Object, Callable
{
   public bool answering { get; protected set; }
   public void answer ()
   {
     /* answer code implementation */
   }
   public bool hang ()
   {
      answering = false;
      stdout.printf ("TechPhone.hang () implementation!");
      return false;
   }
}
```

In this case `TechPhone` is another implementation to `Callable`, then when `hang()` method is called on an instance of `TechPhone` it will always return `false` and print the message `TechPhone.hang () implementation!`, hidding completelly `Callable.hang()` default implementation. 
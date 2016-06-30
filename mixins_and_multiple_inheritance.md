# Mixins and Multiple Inheritance

As described above, Vala while it is backed by C and GObject, can provide a limited multiple inheritance mechanism, by adding virtual methods to Interfaces. Is possible to add some ways to define default method implementations in interface implementor class and allow derived classes to override that methods. 

If you define a `virtual` method in an interface and implement it in a class, you can't override interface's method without leaving derived classes unable to access to interface default one.
Consider following code: 

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

In this case, we have defined a `Callable` interface with a default implementation for `abstract bool hang ()` called `default_hang`, it could be a `static` or `virtual` method. Then `Caller` is a base class implementing `Callable` for the `TechPhone` and `Phone` classes, while `Caller`'s `hang ()` method simple call `Callable` default implementation. `TechPhone` doesn't do anything and just takes `Caller` as base class, using the default method implementations; but `Phone` overrides `Caller.hang ()` and this makes to use its own implementation, allowing to always call it even if it is cast to `Callable` object.
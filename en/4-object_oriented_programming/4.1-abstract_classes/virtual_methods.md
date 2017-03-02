# Virtual Methods

A `virtual` method allows to define default implementations to `abstract` classes and allows to derived classes to override its behavior, this is different than hiding methods. 

```vala
public abstract class Caller : GLib.Object {
   public abstract string name { get; protected set; }
   public abstract void update (string new_name);
   public virtual bool reset ()
   {
      name = "No Name";
      return true;
   }
}

public class ContactCV : Caller
{
   public override string name { get; protected set; }
   public override void update (string new_name)
   {
     name = "ContactCV - " + new_name;
   }
   public override bool reset ()
   {
      name = "ContactCV-Name";
      stdout.printf ("CotactCV.reset () implementation!\n");
      return true;
   }
}

public class Contact : Caller {
   public override string name { get; protected set; }
   public override void update (string new_name)
   {
     name = "Contact - " + new_name;
   }
   
   public static void main ()
   {
      var c = new Contact ();
      c.update ("John Strauss");
      stdout.printf(@"Name: $(c.name)\n");
      c.reset ();
      stdout.printf(@"Reset Name: $(c.name)\n");
      
      var cv = new ContactCV ();
      cv.update ("Xochitl Calva");
      stdout.printf(@"Name: $(cv.name)\n");
      cv.reset ();
      stdout.printf(@"Reset Name: $(cv.name)\n");
      stdout.printf("END\n");
   }
}
```

As you can see in the above example, `Caller` is an `abstract` class defining both an abstract property and a method, but adds a `virtual` method which can be overridden by derived classes. `Contact` class implements abstract methods and properties of `Caller`, while using the default implementation for `reset()` by avoiding to define a new one. `ContactCV` class implements all abstract definitions on `Caller`, but overrides `reset()` so as to define its own implementation. 
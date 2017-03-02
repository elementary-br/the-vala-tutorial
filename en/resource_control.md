# Resource Control

Whenever more than one thread of execution is running simultaneously, there is a chance that data are accessed simultaneously. This can lead to race conditions, where the outcome depends on when the system decides to switch between threads. 

In order to control this situation, you can use the `lock` keyword to ensure that certain blocks of code will not be interrupted by other threads that need to access the same data. The best way to show this is probably with an example: 

```vala
public class Test : GLib.Object {

    private int a { get; set; }

    public void action_1() {
        lock (a) {
            int tmp = a;
            tmp++;
            a = tmp;
        }
    }

    public void action_2() {
        lock (a) {
            int tmp = a;
            tmp--;
            a = tmp;
        }
    }
}
```

This class defines two methods, where both need to change the value of "a". If there were no lock statements here, it would be possible for the instructions in these methods to be interweaved, and the resulting change to "a" would be effectively random. As there are the `lock` statements here, Vala will guarantee that if one thread has locked "a", another thread that needs the same lock will have to wait its turn. 

In Vala it is only possible to lock members of the object that is executing the code. This might appear to be a major restriction, but in fact the standard use for this technique should involve classes that are individually responsible for controlling a resource, and so all locking will indeed be internal to the class. Likewise, in the example above, all accesses to "a" are encapsulated in the class. 

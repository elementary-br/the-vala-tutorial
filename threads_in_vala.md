# Threads in Vala

A program written in Vala may have more than one thread of execution, allowing it it do more than one thing at a time. Exactly how this is managed is outside of Vala's scope - threads may be sharing a single processor core or not, depending on the environment. 

A thread in Vala is not defined at compile time, instead it is simply a portion of Vala code that is requested at runtime to be executed as a new thread. This is done using the static methods of the *Thread* class in GLib, as shown in the following (very simplified) example: 

```vala
void* thread_func() {
    stdout.printf("Thread running.\n");
    return null;
}

int main(string[] args) {
    if (!Thread.supported()) {
        stderr.printf("Cannot run without threads.\n");
        return 1;
    }

    try {
        Thread.create(thread_func, false);
    } catch (ThreadError e) {
        return 1;
    }

    return 0;
}
```

This short program will request a new thread be created and executed.The code to be run being that in *thread\_func*. Also note the test at the start of the main method - a Vala program will not be able to use threads unless compiled appropriately, so if you build this example in the usual way, it will just display an error and stop running. Being able to check for thread support at runtime allows a program to be built to run either with or without threads if that is wanted. In order to build with thread support, run: 

    $ valac --thread threading-sample.vala

This will both include required libraries and make sure the threading system is initialised whenever possible. 

The program will now run without segmentation faults, but it will still not act as expected. Without any sort of event loop, a Vala program will terminate when its primary thread (the one created to run "main") ends.

In order to control this behaviour, you can allow threads to cooperate. This can be done powerfully using event loops and asynchronous queues, but in this introduction to threading we will just show the basic capabilities of threads. 

It is possible for a thread to tell the system that it currently has no need to execute, and thereby suggest that another thread should be run instead, this is done using the static method *Thread.yield()*. If this statement was placed at the end of the above *main* method, the runtime system will pause the main thread for an instant and check if there are other threads that can be run - on finding the newly created thread in a runnable state, it will run that instead until it is finished - and the program will act is it appears it should. However, there is no guarantee that this will happen still. The system is able to decide when threads run, and as such might not allow the new thread to finish before the primary thread is restarted and the program ends. 

In order to wait for a thread to finish entirely there is the *join()* method. Calling this method on a *Thread* object causes the calling thread to wait for the other thread to finish before proceeding. It also allows a thread to receive the return value of another, if that is useful. To implement joining threads: 

```vala
try {
    unowned Thread thread = Thread.create(thread_func, true);
    thread.join();
} catch (ThreadError e) {
    return 1;
}
```

This time, when we create the thread we give `true` as the last argument. This marks the thread as "joinable". We also remember the value returned from the creation - an unowned reference to a `Thread` object (unowned references are explained later and are not vital to this section.) With this reference it is possible to join the new thread to the primary thread. With this version of the program it is guaranteed that the newly created thread will be allowed to fully execute before the primary thread continues and the program terminates. 

All these examples have a potential problem, in that the newly created thread doesn't know the context in which it should run. In C you would supply the thread creation method with some data, in Vala instead you would normally pass an instance method to `Thread.create`, instead of a static method. 
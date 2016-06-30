# Compilation and linking using Command

Vala is not yet capable of directly creating dynamic or static libraries. To create a library, proceed with the `-c` (compile only) switch and link the object files with your favourite linker, i.e. `libtool` or `ar`. 

    $ valac -c ...(source files)
    $ ar cx ...(object files)


or by compiling the intermediate C code with *gcc* 

    $ valac -C ...(source files)
    $ gcc -o my-best-library.so --shared -fPIC ...(compiled C code files)...

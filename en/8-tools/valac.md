# valac

*valac* is the Vala compiler. It's primary function is to transform Vala code into compilable C code, though it can also automate the entire build and link project in simple cases. 

The simple case for use is: 


    $ valac -o appname --pkg gee-1.0 file_name_1.vala file_name_2.vala


The `-o` switch requests that an object file is created, rather than just outputting C source files. The `--pkg` option says that this build needs information from the *gee-1.0* package. You do not need to specify details about what libraries to link in, the package has this information internally. Finally, a list of source files is given. If you need a more complicated build process, use the `-C` switch to generate C files instead of a binary, and continue the process manually, or through a script. 
# Contents

1.  [Vala Tutorial](#Vala_Tutorial)
    1.  [Introduction](#Introduction)
        1.  [What is Vala?](#What_is_Vala.3F)
        2.  [Who is this tutorial for?](#Who_is_this_tutorial_for.3F)
        3.  [Conventions](#Conventions)

    2.  [A First Program](#A_First_Program)
        1.  [Compile and Run](#Compile_and_Run)

    3.  [Basics](#Basics)
        1.  [Source Files and Compilation](#Source_Files_and_Compilation)
        2.  [Syntax Overview](#Syntax_Overview)
        3.  [Comments](#Comments)
        4.  [Data Types](#Data_Types)
            1.  [Value Types](#Value_Types)
            2.  [Strings](#Strings)
            3.  [Arrays](#Arrays)
            4.  [Reference Types](#Reference_Types)
            5.  [Static Type Casting](#Static_Type_Casting)
            6.  [Type Inference](#Type_Inference)
            7.  [Defining new Type from other](#Defining_new_Type_from_other)

        5.  [Operators](#Operators)
        6.  [Control Structures](#Control_Structures)
        7.  [Language Elements](#Language_Elements)
            1.  [Methods](#Methods)
            2.  [Delegates](#Delegates)
            3.  [Anonymous Methods/Closures](#Anonymous_Methods_.2BAC8_Closures)
            4.  [Namespaces](#Namespaces)
            5.  [Structs](#Structs)
            6.  [Classes](#Classes)
            7.  [Interfaces](#Interfaces)

        8.  [Code Attributes](#Code_Attributes)

    4.  [Object Oriented Programming](#Object_Oriented_Programming)
        1.  [Basics](#Basics-1)
        2.  [Construction](#Construction)
        3.  [Destruction](#Destruction)
        4.  [Signals](#Signals)
        5.  [Properties](#Properties)
        6.  [Inheritance](#Inheritance)
        7.  [Abstract Classes](#Abstract_Classes)
            1.  [Virtual Methods](#Virtual_Methods)

        8.  [Interfaces](#Interfaces-1)
            1.  [Defining Prerequisites](#Defining_Prerequisites)
            2.  [Defining default implementation in methods](#Defining_default_implementation_in_methods)
            3.  [Properties](#Properties-1)
            4.  [Mixins and Multiple Inheritance](#Mixins_and_Multiple_Inheritance)

        9.  [Polymorphism](#Polymorphism)
        10. [Method Hiding](#Method_Hiding)
        11. [Run-Time Type Information](#Run-Time_Type_Information)
        12. [Dynamic Type Casting](#Dynamic_Type_Casting)
        13. [Generics](#Generics)
        14. [GObject-Style Construction](#GObject-Style_Construction)

    5.  [Advanced Features](#Advanced_Features)
        1.  [Assertions and Contract Programming](#Assertions_and_Contract_Programming)
        2.  [Error Handling](#Error_Handling)
        3.  [Parameter Directions](#Parameter_Directions)
        4.  [Collections](#Collections)
            1.  [ArrayList<G\>](#ArrayList.3CG.3E)
            2.  [HashMap\<K,V\>](#HashMap.3CK.2CV.3E)
            3.  [HashSet\<G\>](#HashSet.3CG.3E)
            4.  [Read-Only Views](#Read-Only_Views)

        5.  [Methods With Syntax Support](#Methods_With_Syntax_Support)
        6.  [Multi-Threading](#Multi-Threading)
            1.  [Threads in Vala](#Threads_in_Vala)
            2.  [Resource Control](#Resource_Control)

        7.  [The Main Loop](#The_Main_Loop)
        8.  [Asynchronous Methods](#Asynchronous_Methods)
            1.  [Examples](#Examples)

        9.  [Weak References](#Weak_References)
        10. [Ownership](#Ownership)
            1.  [Unowned References](#Unowned_References)
            2.  [Methods ownership](#Methods_ownership)
            3.  [Properties ownership](#Properties_ownership)
            4.  [Ownership Transfer](#Ownership_Transfer)

        11. [Variable-Length Argument
            Lists](#Variable-Length_Argument_Lists)
        12. [Pointers](#Pointers)
        13. [Non-Object classes](#Non-Object_classes)
        14. [D-Bus Integration](#D-Bus_Integration)
        15. [Profiles](#Profiles)

    6.  [Experimental Features](#Experimental_Features)
        1.  [Chained Relational
            Expressions](#Chained_Relational_Expressions)
        2.  [Regular Expression Literals](#Regular_Expression_Literals)
        3.  [Strict Non-Null Mode](#Strict_Non-Null_Mode)

    7.  [Libraries](#Libraries)
        1.  [Using Libraries](#Using_Libraries)
        2.  [Creating a Library](#Creating_a_Library)
            1.  [Using Autotools](#Using_Autotools)
            2.  [Compilation and linking using Command
                Line](#Compilation_and_linking_using_Command_Line)

        3.  [Binding Libraries with VAPI
            Files](#Binding_Libraries_with_VAPI_Files)

    8.  [Tools](#Tools)
        1.  [valac](#valac)
        2.  [vapigen](#vapigen)
        3.  [vala-gen-introspect](#vala-gen-introspect)

    9.  [Techniques](#Techniques)
        1.  [Debugging](#Debugging)
        2.  [Using GLib](#Using_GLib)
            1.  [File Handling](#File_Handling)

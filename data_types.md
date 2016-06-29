# Data Types

Broadly speaking there are two types of data in Vala: *reference types*
and *value types*. These names describe how instances of the types are passed around the system - a value type is copied whenever it is assigned to a new identifier, a reference type is not copied, instead the new identifier is simply a new reference to the same object. 

A constant is defined by putting `const` before the type. The naming convention for constants is `ALL_UPPER_CASE`. 


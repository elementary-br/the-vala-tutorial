# Unowned References

Normally when creating an object in Vala you are returned a reference to it. Specifically this means that as well as being passed a pointer to the object in memory, it is also recorded in the object itself that this pointer exists. Similarly, whenever another reference to the object is created, this is also recorded. As an object knows how many references there are to it, it can automatically be removed when needed. This is the basis of [Vala's memory management](/Projects/Vala/ReferenceHandling). 

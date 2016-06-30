# Methods With Syntax Support

Vala recognizes some methods with certain names and signatures and provides syntax support for them. For example, if a type has a *contains()* method objects of this type can be used with the `in` operator. The following table lists these special methods. *T* and *Tn* are only type placeholders in this table and meant to be replaced with real types. 

**Indexers**

`T2 get(T1 index)`

index access: `obj[index]`

`void set(T1 index, T2 item)`

index assignment: `obj[index] = item`

**Indexers with multiple indices**

`T3 get(T1 index1, T2 index2)`

index access: `obj[index1, index2]`

`void set(T1 index1, T2 index2, T3 item)`

index assignment: `obj[index1, index2] = item`

(... and so on for more indices)

**Others**

`T slice(long start, long end)`

slicing: `obj[start:end]`

`bool contains(T needle)`

`in` operator: `bool b = needle in obj`

`string to_string()`

support within string templates: `@"$obj"`

`Iterator iterator()`

iterable via `foreach`

`T2 get(T1 index)` \  `T1 size { get; }`

iterable via `foreach`

The *Iterator* type can have any name and must implement one of these two protocols: 

| | |
|---|---|
| `bool next()` / `T get()` | standard iterator protocol: iterating until *.next()* returns `false`. The current element is retrieved via *.get()*. |
| `T? next_value()` | alternative iterator protocol: If the iterator object has a *.next_value()* function that returns a nullable type then we iterate by calling this function until it returns `null`.|

This example implements some of these methods: 







```vala
public class EvenNumbers {
    public int get(int index) {
        return index * 2;
    }

    public bool contains(int i) {
        return i % 2 == 0;
    }

    public string to_string() {
        return "[This object enumerates even numbers]";
    }

    public Iterator iterator() {
        return new Iterator(this);
    }

    public class Iterator {
        private int index;
        private EvenNumbers even;

        public Iterator(EvenNumbers even) {
            this.even = even;
        }

        public bool next() {
            return true;
        }

        public int get() {
            this.index++;
            return this.even[this.index - 1];
        }
    }
}

void main() {
    var even = new EvenNumbers();
    stdout.printf("%d\n", even[5]);   // get()
    if (4 in even) {                  // contains()
        stdout.printf(@"$even\n");    // to_string()
    }
    foreach (int i in even) {         // iterator()
        stdout.printf("%d\n", i);
        if (i == 20) break;
    }
}
```
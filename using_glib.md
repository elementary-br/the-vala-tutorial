# Using GLib

GLib includes a large set of utilities, including wrappers for most of the standard libc functions and more. These tools are available on all Vala platforms, even those which are not POSIX compliant. For a complete description of all that GLib provides, see the [GLib Reference Manual](https://developer.gnome.org/glib/). That reference is related to the C API for GLib, but it is mainly very simple to work out how to translate into Vala. 

The GLib functions are available in Vala through the following naming convention: 

| C API | Vala | Example |
| --- | --- | --- |
|GLib.Topic.foobar() |GLib.Path.get\_basename() | g\_topic\_foobar() |

The GLib types can be used similarly: 

|Instantiate with |Call an object member with|
|---|---|
|GLib.Foo foo = new GLib.Foo();|foo.bar();|

The APIs are not identical between C and Vala, but these naming rules should mean you can find the functions you need in the GLib VAPI files shipped with Vala, and from there find the parameters. This will hopefully suffice until more Vala documentation can be generated. 
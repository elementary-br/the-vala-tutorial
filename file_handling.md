# File Handling

For flexible file I/O and file handling see [GIO Samples](/Projects/Vala/GIOSamples). 

You can also use FileUtils.get_contents to load a file into a string.

```vala
string content;
FileUtils.get_contents("file.vala", out content);
```
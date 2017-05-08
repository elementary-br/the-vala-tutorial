# Relação encadeada

Este recurso permite que você escreva expressões relacionais complexas como

```vala
if (1 < a && a < 5) {}

if (0 < a && a < b && b < c && c < d && d < 255) {
    // do something
}
```

De uma forma mais natural:


```vala
if (1 < a < 5) {}

if (0 < a < b < c < d < 255) {
    // do something
}
```

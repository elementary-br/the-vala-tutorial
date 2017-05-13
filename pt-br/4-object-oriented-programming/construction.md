# Contrutor

Vala suporta dois construtores de esquemas levemente diferentes: o estilo de construção do estilo Java/C\# qual iremos focar agora, e o estilo GObject que será descrito na seção no final do capítulo.

Vala não suporta sobrecarga de construtores pela mesma razão que sobrecarga de métodos não é permitida, o que significa que uma classe não pode ter múltiplos construtores com o mesmo nome. Porém, isso não é um problema porque Vala suporta _construtores nomeados_.
Se você quer oferecer múltiplos construtores você pode dar diferentes nomes adicionais:


```vala
public class Button : Object {

    public Button() {
    }

    public Button.with_label(string label) {
    }

    public Button.from_stock(string stock_id) {
    }
}
```
A ínicialização é análoga:

```vala
new Button();
new Button.with_label("Click me");
new Button.from_stock(Gtk.STOCK_OK);
```

Você pode encadear construtores pelo `this()` ou `this.`_nome\_extenção_():

```vala
public class Point : Object {
    public double x;
    public double y;

    public Point(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public Point.rectangular(double x, double y) {
        this(x, y);
    }

    public Point.polar(double radius, double angle) {
        this.rectangular(radius * Math.cos(angle), radius * Math.sin(angle));
    }
}

void main() {
    var p1 = new Point.rectangular(5.7, 1.2);
    var p2 = new Point.polar(5.7, 1.2);
}
```

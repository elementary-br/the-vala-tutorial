# Interfaces

Uma classe em Vala pode implementar qualquer número de interfaces. Cada interface é um tipo, como uma classe, mas um que não pode ser instanciado. Por "implementar" uma ou mais interfaces, uma classe pode declarar suas instâncias como instâncias da interface, e portanto pode ser usada em qualquer situação em que uma instância dessa interface é esperada.

O procedimento para implementar uma interface é o mesmo de herdar de classes com métodos abstratos - se a classe é útil ela deve prover implementações para todos os métodos que são descritos mas não ainda implementados

Uma definição simples de interface se parece assim:

```vala
public interface ITeste : GLib.Object {
    public abstract int dado_1 { get; set; }
    public abstract void metodo_1();
}
```

Esse código descreve uma interface `ITeste` que requer GLib.Object como pai da classe implementadora e contem dois membros. `dado\_1` é uma propriedade, como descrito acima, exceto que esteja declarado abstrata. Vala irá portanto não implementar a propriedade, mas invés requerer que a classe implementando essa interface tenha uma propriedade chamada `dado_1` que tenha os dois acessores `get` e `set` - é necessário que seja abstrata(`abstract`) pois as interfaces não podem ter dados. O segundo membro `metodo_1` é um método. Aqui é declarado que esse método deve ser implementado pelas classes que implementam essa interface.

A implementação mais simples possível dessa interface é:

```vala
public class Teste1 : GLib.Object, ITeste {
    public int dado_1 { get; set; }
    public void metodo_1() {
    }
}
```

E pode ser usada como a seguir:

```vala
var t = new Teste1();
t.metodo_1();

ITeste i = t;
i.metodo_1();
```

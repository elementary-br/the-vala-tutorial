# Tipo Referência

Os tipos referencias são todos os tipos declarados como uma classe, independente de ser descendente de um objeto Glib(_Object_). Vala vai assegurar que quando você passar um objeto por referencia o sistema guardar o números de referencias ativas para gerenciar a memoria para você. O valor de uma referencia que não aponta para lugar nenhum é `null`. Mais sobre classes e seus recursos na sessão sobre programação orientada a objetos.

```vala
/* definindo uma classe */
class Track : GLib.Object {             /* herdando de 'GLib.Object' */
    public double mass;                 /* um campo público */
    public double name { get; set; }    /* uma propriedade pública */
    private bool terminated = false;    /* um campo privado */
    public void terminate() {           /* um método público */
        terminated = true;
    }
}
```

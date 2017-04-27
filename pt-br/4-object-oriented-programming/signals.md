# Sinais
Sinais são um sistema proveniente da classe Objeto da GLib, e são fácilmente acessíveis ao Vala em todos os descendentes dos Objetos. Um sinal é reconhecível por um programador C\# como um evento, ou aos programadores Java como uma alternativa à implementar _event listeners_. Brevemente, um sinal é um jeito simples de executar um número arbitrário de métodos externamente identicos (ex. os com o mesmo sinal) aproximadamente no mesmo tempo. Os métodos atuais de execução são internos ao _gobject_, e não importante aos programas Vala.

Um sinal é definido como um membro de uma classe, e aparenta similar a um método sem um corpo. Gerenciadores de sinais podem então cer adicionados ao sinal usando o método `connect()`. Para finalizar, o exemplo a seguir também introduz expressões lambda, uma forma útil de escrever gerenciadores de sinais em Vala:

```vala
public class Teste : GLib.Object {

    public signal void sig_1(int a);

    public static int main(string[] args) {
        Teste t1 = new Teste();

        t1.sig_1.connect((t, a) => {
            stdout.printf("%d\n", a);
        });

        t1.sig_1(5);

        return 0;
    }
}
```

Esse código introduz uma nova classe chamada "Teste", usando uma síntaxe familiar. O primeiro mémbro dessa classe é um sinal, chamado "sig\_1", que é definido recebendo um inteiro. No método principal do programa(_main_), nós primeiro criamos uma instância de Teste - Um requerimento desde que sinais sempre pertencem à instâncias da classe. Em seguida, nós atribuimos para nossa instância um gerenciador de sinal "sig\_1", no qual definimos uma expressão lambda. A definição dita que o método receberá dois argumentos quais chamaremos "t" e "a", mas não provemos tipos. //TODO: We can be this terse because porque Vala já conhece a definição do sinal e pode compreender que tipos são requeridos.

The reason there are two parameters to the handler is that whenever a signal is emitted, the object on which it is emitted is passed as the first argument to the handler. The second argument is that one that the signal says it will provide.

Finally, we get impatient and decide to emit a signal. We do this by calling the signal as though it was a method of our class, and allow gobject to take care of forwarding the message to all attached handlers. Understanding the mechanism used for this is not required to use signals from Vala.

NB: Currently the `public` access modifier is the only possible option - all signals can be both connected to and emitted by any piece of code.

```vala
    [Signal (action=true, detailed=true, run=true, no_recurse=true, no_hooks=true)]
    public signal void sig_1 ();
```

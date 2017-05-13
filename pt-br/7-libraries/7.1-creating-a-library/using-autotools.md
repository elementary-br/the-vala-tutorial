# Usando Autotools

É possível usar Autotools para criar uma biblioteca escrita em Vala. Uma biblioteca é criada usando o código C gerado pelo compilador Vala, é vinculado e instalado como qualquer outra biblioteca. Então você precisa dizer quais arquivos C devem ser usados para criar a biblioteca e quais deles devem ser distribuíveis, permitindo que outros compilem um arquivo do tipo tar sem Vala usando comandos Autotools padrão: **configure**, **make** and **make install**.

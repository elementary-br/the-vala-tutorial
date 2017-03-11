<!-- Esse arquivo é o readme do github, não do livro -->
# Tradução do The Vala Tutorial para português brasileiro.
[![Build Status](https://travis-ci.org/elementary-br/the-vala-tutorial.svg?branch=master)](https://travis-ci.org/elementary-br/the-vala-tutorial)
[![Telegram](https://img.shields.io/badge/join-telegram-blue.svg)](https://t.me/Vala_BR)

## Como contribuir

##### **não-membros**

- Faça um fork do projeto
- Pegue a issue referente ao que você gostaria de colaborar
- Nos envie um pull request.
- Opcional: entre no [grupo do telegram](https://t.me/Vala_BR)

##### **membros**

- Pegue uma issue
- Crie uma branch referente com um nome curto porem descritivo
- Outros tradutores devem fazer revisão da sua branch antes dela ser aceita na master

## Como fazer a tradução

Ache a issue referente ao capitulo, crie a branch referente ao capitulo à ser traduzido.

Copie o capítulo do diretório original en/ para o diretorio pt-br/

Todos os arquivos devem manter o **nome original** da pasta em inglês, os nomes dos arquivos devem usar traço ( - ) para fazer espaçamento, e não deverão conter sublinhas ( _ ).

## Teste de erros

Existem casos onde um link quebrado, um nome com inconsistências ou um arquivo órfão pode passar despercebidos, pensando nisso desenvolvemos testes que podem detectar essas falhas.

Para executá-lo no projeto:

`$ ./test.sh`

Além disso o gitbook também dispõe de uma ferramenta pra fazer a montagem do livro.

- Para fazer a instalação

`# npm install gitbook-cli -g`

- ou

`$ npm install gitbook-cli`

- Para rodar os testes

`$ gitbook build ./ --log=debug --debug`

- Para executar um servidor local

`$ gitbook serve`

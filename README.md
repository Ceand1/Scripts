# Descrição
Scripts desenvolvidos durante a cadeira de Programação com scripts.

## Ferramentas

### Shell
### AWK
### AWS

## Observações

As 3 primeiras atividades foram feitas apenas no terminal, por isso não estão presentes.

## 4

### O script chamado saudacao.sh, imprime:
"Olá nome,

Hoje é dia x, do mês x do ano de 2021."

No luga de nome deve ter o usuário que está executando o scripts, depois a data de execução. Em toda execução do script, a saída deve ser guardada em saudacao.log.

Execução: ./saudacao.sh

### O script sed.sh deve:

#### a - Selecionar todos os arquivos .html no diretório de execução, mudar as letras dos nomes para maiúsculas e mudar a extensão para .htm.

#### b - Será recebido um arquivo de texto com vários 5 colunas, nome, turma, nota1, nota2 e nota3, as turmas são divididas em A, B e C.

##### 1 - Em um único comando sed, o script altera A para INF, B para LOG e C para RED.

##### 2 - Cria um arquivo para cada turma, contendo apenas os alunos daquela turma.

##### 3 - Cria um arquivo de recuperação, contendo os alunos com média abaixo de 6.

Execução: ./sed.sh arquivo

## 5

### maiorDe3Verificado.sh recebe 3 parâmetros, retorna o maior número dos 3 e reclama caso um dos parâmetros não for número.

Execução: ./maiorDe3Verificado.sh n1 n2 n3

### O script agenda.sh gerencia a agenda de contatos agenda.db. Possui 3 operações:

#### 1 - adicionar:
Execução: ./agenda.sh adicionar nome email

#### 2 - listar:
Execução: ./agenda.sh listar

#### 3 - remover:
Execução ./agenda.db remover email


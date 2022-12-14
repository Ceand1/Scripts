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

## 6

### O script latencia.sh recebe um arquivo de texto com 1 IP por linha.

Deve enviar 10 pacotes ICMP, por meio do comando ping, para cada IP e retornar o tempo médio de resposta para cada IP, em ordem crescente.

Execução: ./latencia.sh arquivo

### O script cinco_diretorios.sh deve criar 5 diretorios e em cada:

#### 1 - Criar 5 subdiretórios.

#### 2 - Em cada subdiretório, criar 4 arquivos de texto. Em cada arquivo ter linhas iguais ao número do arquivo.

Execução: ./cinco_diretorios.sh

## 7

### alertaDiretorio.sh recebe um inteiro e um caminho de diretorio e deve a cada intervalo de tempo representado pelo inteiro:

#### 1 - Informar se houve alteração no diretório, com a data da mesma.

#### 2 - Quantos arquivos existiam antes da alteração.

#### 3 - Quantos arquivos há depois da alteração.

#### 4 - Qual arquivo foi adicionado ou removido.

Execução: ./alertaDiretorio.sh n caminho

## 8

### O script calculadora.sh funciona como uma calculadora para operações básicas, para inteiros e ponto flutuante.

### contaPalavras.sh, conta a quantidade de cada palavra em um arquivo de texto e retorna o resultado em ordem decrescente.

Execução: ./contaPalavras.sh

## 9

### hosts.sh relaciona nomes de máquinas com IPs e guarda cada par no arquivo hosts.db. Possui as seguintes funções:

#### 1 - adicionar.

Execução: ./hosts.sh -a hostname -i IP

#### 2 - remover.

Execução: ./hosts.sh -d hostname

#### 3 - procurar.

Execução: ./hosts.sh -l

## 10

### Atividade 3 e questão 1 da atividade 6 feitas usando awk.

Execução: awk -f file.awk auth.log / awk -f ips_latencia.awk ips.txt

## 11

### O script compactador.sh:

#### 1 - Apresenta uma tela requisitando o caminho de um diretório.

#### 2 - Listar os nomes dos arquivos (sem subdiretórios) do diretório citado. O usuário pode escolher um ou mais arquivos.

#### 3 - Exibe duas opções de compactação: gzip ou b2zip.

#### 4 - Pede o nome do arquivo compactado criado.

#### 5 - Cria o arquivo compactado com os arquivos selecionados.

Execução: ./compactador.sh

### cliente.sh e servidor.sh não estão funcionando.

## 12

### Cria um servidor web com uma página que implime nome e matrícula.

Execução: ./servidorWeb chave_de_segurança

## 13

### O script:

#### 1 - Cria uma instância.

#### 2 - Carrega uma instância no SystemD que pega as seguintes informações:

##### a - Horário e data da coleta das informações.

##### b - Tempo em que a máquina está ativa.

##### c - Carga média do sistema.

##### d - Quantidade de memória livre e ocupada.

##### e - Quantidade de bytes recebidos e enviados através da interface eth0.

#### 3 - Carrega um servidor web que coloca as informações coletadas em uma página.

Execução: ./instanciaServico chave_de_segurança

## 14

### Cria 2 instâncias:

#### 1 - A primeira é criada com um servidor do MySQL.

#### 2 - A segunda é criada com um cliente MySQL e pode acessar o banco de dados da primeira.

Execução: ./criarDuasInstancias.sh chave_de_segurança user_do_BD password_do_BD

### Cria 2 instâncias:

#### 1 - A primeira é criada com um servidor do MySQL.

#### 2 - A segunda é criada com um cliente MySQL e configura o wordpress por meio do pacote LAMP.


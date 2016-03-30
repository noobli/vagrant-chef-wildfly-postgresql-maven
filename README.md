#vagrant-chef-wildfly-postgresql-maven

Projeto Vagrant com provisionamento através do Chef Solo e inclusão dos seguintes itens:
* Java JDK 8 da Oracle
* git para atualização de código fontes sem depender do host
* maven para rodar comando internamente na máquina virtual
* PostgreSQL com acesso pela máquina HOST
* Banco de dados de teste 'testdb'
* wildfly configurado para deploy através da máquina host ou usando o maven
* Datasource configurado para acesso a base de teste do PostgresSQL (jndi = 'java:jboss/datasources/PostgreDS')

O projeto roda tanto em máquinas com virtualbox, quanto com lxc

##Modo de usar:
* inicie a máquina através do vagrant up
* crie um projeto baseado no arquétipo wildfly-javaee7-webapp-archetype
http://stackoverflow.com/questions/24578154/are-there-no-wildfly-8-java-ee-7-quickstart-archetypes
* execute o projeto com o comando 'mvn wildfly:deploy'

##Pré-requisitos
* vagrant (com o provider de sua preferência[virtualbox ou lxc])
  1. Instalar Gem:
    - sudo apt-get install ruby ruby-dev
  2. Instalar Vagrant:
    - Baixar a versão do site;
    - ./vagrant_1.8.1_x86_64.deb
  3. Instalar o LXC:
    - sudo apt-get install lxc lxc-templates
  4. Plugins:
    - vagrant plugin install vagrant-lxc
    - vagrant plugin install vagrant-vbguest
    - vagrant plugin install vagrant-berkshelf
    - vagrant plugin install vagrant-omnibus
    - vagrant plugin install vagrant-cachier
   
* git

##Inicializando o repositório em uma maquina com o git instalado:
```
git clone git://github.com/noobli/vagrant-chef-wildfly-postgresql-maven.git
git submodule init
git submodule update
```

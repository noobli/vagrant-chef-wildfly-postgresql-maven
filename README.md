# vagrant-chef-wildfly-postgresql-maven
Projeto Vagrant com provisionamento através do Chef Solo e inclusão dos seguintes itens:
* Java JDK 8 da Oracle
* git para atualização de código fontes sem depender do host
* maven para rodar comando internamente na máquina virtual
* PostgreSQL com acesso pela máquina HOST
* Banco de dados de teste 'testdb'
* wildfly configurado para deploy através da máquina host ou usando o maven
* Datasource configurado para acesso a base de teste do PostgresSQL (jndi = 'java:jboss/datasources/PostgreDS')


Modo de usar:
* inicie a máquina através do vagrant up
* crie um projeto baseado no arquétipo do wildfly-web
* execute o projeto com o comando 'mvn wildfly:deploy'

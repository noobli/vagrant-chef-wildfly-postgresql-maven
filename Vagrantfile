# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  
  config.vm.network "forwarded_port", guest: 5432, host: 5432
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 9990, host: 9990
#  config.vm.network "forwarded_port", guest: 8787, host: 8787

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
	 vb.cpus   = 2
  end

  config.vm.provision "chef_solo" do |chef|
    
	chef.add_recipe "java"
	chef.add_recipe "git"
	chef.add_recipe "maven"
	chef.add_recipe "postgresql::server"
	chef.add_recipe "postgresql::client"
	chef.add_recipe "database::postgresql"
	chef.add_recipe "postgresql_config"
	chef.add_recipe "wildfly"
	chef.add_recipe "wildfly::postgres_datasources"
	
	chef.json = {
	  :java => {
	    :jdk_version => '8',
		:set_default => true,
		:install_flavor => 'oracle',
		:oracle => { :accept_oracle_download_terms => true },
		:jdk => {
		  :'8' => {
		    :x86_64 => {
			  :url      => 'http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jdk-8u40-linux-x64.tar.gz',
			  :checksum => 'da1ad819ce7b7ec528264f831d88afaa5db34b7955e45422a7e380b1ead6b04d'
			}
		  }
		}
	  },
	  :maven => {
	    :install_java => false
	  },
	  :postgresql => {
        :pg_hba => [
          {type: 'host',  db: 'all', user: 'all',      addr: '0.0.0.0/0',    method: 'md5'},
        ],
        :initdb_locale => 'en_US.UTF8',
		:config => {listen_addresses: '*'},
        :password => {postgres: 'postgres'}
      },
	  :wildfly => {
	    :postgresql => { 
		  :enable => true,
		  :jndi => {
		    :datasources => [
		      {
                jndi_name: 'java:jboss/datasources/PostgreDS',
                server: '127.0.0.1',
                port: '5432',
                db_name: 'testdb',
                db_user: 'postgres',
                db_pass: 'postgres',
                pool_min: '5',
                pool_max: '20'
			  }
		    ]
		  } 
		}
	  }
	}
  end
end
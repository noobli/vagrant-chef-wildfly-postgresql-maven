postgresql_connection_info = {
  :host     => '127.0.0.1',
  :port     => 5432,
  :username => 'postgres',
  :password => 'postgres'
}

postgresql_database 'testdb' do
  connection postgresql_connection_info
  template 'DEFAULT'
  encoding 'DEFAULT'
  tablespace 'DEFAULT'
  connection_limit '-1'
  owner 'postgres'
  action :create
end

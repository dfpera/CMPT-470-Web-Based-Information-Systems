# Make sure the Apt package lists are up to date, so we're downloading versions that exist.
cookbook_file "apt-sources.list" do
  path "/etc/apt/sources.list"
end
execute 'apt_update' do
  command 'apt-get update'
end

# Base configuration recipe in Chef.
package "wget"
package "ntp"
cookbook_file "ntp.conf" do
  path "/etc/ntp.conf"
end
execute 'ntp_restart' do
  command 'service ntp restart'
end

#install ruby
package "ruby"
package "ruby-dev"
package "libsqlite3-dev"
# package "sqlite3"
package "zlib1g-dev"
package "nodejs"
package "build-essential"
package "mysql-server"
package "libmysqlclient-dev"
package "npm"

execute 'install_boostrap' do
  command 'npm install bootstrap'
end

execute 'install_nokogiri' do
  command 'sudo gem install nokogiri'
end

execute 'gem_bundler' do
  command 'sudo gem install bundler --conservative'
end

execute 'bundle' do
  command 'bundle install'
  cwd '/home/ubuntu/project/noted'
  user 'ubuntu'
end

execute 'gem_rails' do
	command 'gem install rails'
end

execute 'init_DBs' do
  command 'sudo mysql -u root < "/home/ubuntu/project/data/init.sql"'
end

execute 'DB_migrate' do
  command 'sudo rails db:migrate'
  cwd '/home/ubuntu/project/noted'
end

execute 'server' do
  command 'rails server -d -b 0.0.0.0'
  cwd '/home/ubuntu/project/noted/bin'
end

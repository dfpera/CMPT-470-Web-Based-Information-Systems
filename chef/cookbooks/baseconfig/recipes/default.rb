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

# Install ruby
package "ruby"
package "ruby-dev"
package "libsqlite3-dev"
package "zlib1g-dev"
package "nodejs"
package "build-essential"
package "mysql-server"
package "libmysqlclient-dev"
package "npm"

# Install rbenv
package "rbenv"
package "git-core"
package "curl"
package "libssl-dev"
package "libreadline-dev"
package "libyaml-dev"
package "libsqlite3-dev"
package "sqlite3"
package "libxml2-dev"
package "libxslt1-dev"
package "libcurl4-openssl-dev"
package "python-software-properties"
package "libffi-dev"

# Install production server
package "nginx"

<<<<<<< HEAD
# Import cookbook files
cookbook_file "unicorn_noted" do
  path '/etc/init.d/unicorn_noted'
end
cookbook_file "nginx-default" do
  path "/etc/nginx/sites-available/default"
end

=======
>>>>>>> 091c3ecb5ddf2b073544dcacdcc76a81ad35e865
# Install dependencies
execute 'install_boostrap' do
  command 'npm install bootstrap'
end
execute 'install_nokogiri' do
  command 'sudo gem install nokogiri'
end

# rbenv setup
<<<<<<< HEAD
execute 'rbenv_install' do
 command 'sudo git clone git://github.com/sstephenson/rbenv.git .rbenv'
 cwd '/home/ubuntu'
end
execute 'rbenv_export' do
  command 'echo "export PATH="$HOME/.rbenv/bin:$PATH"" >> ~/.bashrc'
  cwd '/home/ubuntu'
end
execute 'rbenv_eval' do
  command 'echo "eval "$(rbenv init -)"" >> ~/.bashrc'
  cwd '/home/ubuntu'
end
execute 'rbenv_build_install' do
  command 'sudo git clone git://github.com/sstephenson/ruby-build.git .rbenv/plugins/ruby-build'
  cwd '/home/ubuntu'
end
execute 'rbenv_build_export' do
  command 'echo "export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"" >> ~/.bashrc'
  cwd '/home/ubuntu'
end
execute 'rbenv_build_source' do
  command 'sudo -s source .bashrc'
  cwd '/home/ubuntu'
end
execute 'rbenv_vars_install' do
=======
execute 'rbenv-install' do
  command 'sudo git clone git://github.com/sstephenson/rbenv.git .rbenv'
  cwd '/home/ubuntu'
end
execute 'rbenv-export' do
  command 'echo "export PATH="$HOME/.rbenv/bin:$PATH"" >> ~/.bashrc'
  cwd '/home/ubuntu'
end
execute 'rbenv-eval' do
  command 'echo "eval "$(rbenv init -)"" >> ~/.bashrc'
  cwd '/home/ubuntu'
end
execute 'rbenv-build-install' do
  command 'sudo git clone git://github.com/sstephenson/ruby-build.git .rbenv/plugins/ruby-build'
  cwd '/home/ubuntu'
end
execute 'rbenv-build-export' do
  command 'echo "export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"" >> ~/.bashrc'
  cwd '/home/ubuntu'
end
execute 'rbenv-build-source' do
  command 'sudo -s source .bashrc'
  cwd '/home/ubuntu'
end
execute 'rbenv-vars-install' do
>>>>>>> 091c3ecb5ddf2b073544dcacdcc76a81ad35e865
  command 'sudo git clone https://github.com/sstephenson/rbenv-vars.git'
  cwd '/home/ubuntu/.rbenv/plugins'
end

# Bundler setup
execute 'gem_bundler' do
  command 'sudo gem install bundler --conservative'
end
execute 'bundle' do
  command 'bundle install'
  cwd '/home/ubuntu/project/noted'
  user 'ubuntu'
end

# Install rails
execute 'gem_rails' do
	command 'gem install rails'
end

# Database setup
execute 'init_DBs' do
  command 'sudo mysql -u root < "/home/ubuntu/project/data/init.sql"'
end
execute 'DB_migrate_dev' do
  command 'sudo rails db:migrate'
  cwd '/home/ubuntu/project/noted'
end
execute 'DB_migrate_prod' do
  command 'sudo RAILS_ENV=production rails db:migrate'
  cwd '/home/ubuntu/project/noted'
end

<<<<<<< HEAD
# Precompile assets for Production
execute 'precompile_assets' do
=======
execute 'precompile-assets' do
>>>>>>> 091c3ecb5ddf2b073544dcacdcc76a81ad35e865
  command 'RAILS_ENV=production rake assets:precompile'
  cwd '/home/ubuntu/project/noted'
end

# Unicorn setup
<<<<<<< HEAD
execute 'unicorn_permissions' do
  command 'sudo chmod 755 /etc/init.d/unicorn_noted'
end
execute 'unicorn_init' do
  command 'sudo update-rc.d unicorn_noted defaults'
end
execute 'unicorn_start' do
=======
execute 'unicorn-logdir' do
  command 'mkdir -p shared/pids'
  cwd '/home/ubuntu/project/noted'
end
cookbook_file "unicorn_noted" do
  path '/etc/init.d/unicorn_noted'
end
execute 'unicorn-permissions' do
  command 'sudo chmod 755 /etc/init.d/unicorn_noted'
end
execute 'unicorn-init' do
  command 'sudo update-rc.d unicorn_noted defaults'
end
execute 'unicorn-start' do
>>>>>>> 091c3ecb5ddf2b073544dcacdcc76a81ad35e865
  command 'sudo service unicorn_noted restart'
end

# nginx start
<<<<<<< HEAD
execute 'nginx_restart' do
  command 'sudo service nginx restart'
end

# Initialize test data
execute 'test_data' do
=======
cookbook_file "nginx-default" do
  path "/etc/nginx/sites-available/default"
end
execute 'nginx_restart' do
  command 'service nginx restart'
end

# Initialize test data
execute 'test-data' do
>>>>>>> 091c3ecb5ddf2b073544dcacdcc76a81ad35e865
  command 'sudo mysql -u root < "/home/ubuntu/project/data/testdata.sql"'
end

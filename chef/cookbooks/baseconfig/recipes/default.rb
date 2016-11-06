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
package "sqlite3"
package "zlib1g-dev"
package "nodejs"
package "build-essential"

execute 'gem_bundler' do
  command 'gem install bundler --conservative'
end

execute 'gem_rails' do
	command 'gem install rails'
end
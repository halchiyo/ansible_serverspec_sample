require 'serverspec'
require 'net/ssh'
# require 'custom_property'

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

host = ENV['TARGET_HOST'].dup
puts "\n## Running Tests on #{host} >>>"

options = Net::SSH::Config.for(host)

options[:user] ||= Etc.getlogin

set :backend,     :ssh
set :host,        options[:host_name] || host
set :ssh_options, options
set :request_pty, true

# Disable sudo
# set :disable_sudo, true


# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C' 

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'

# set_property custom_property

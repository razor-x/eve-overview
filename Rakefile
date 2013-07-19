# Standard library
require 'rake'
require 'yaml'
require 'fileutils'

# Load the configuration file
config = YAML.load_file '_config.yml'

testing_config = '_config.yml,_config.testing.yml'
dev_config = '_config.yml,_config.dev.yml'

# Set "rake watch" as default task
task :default => :draft

# spawn a server and kill it gracefully when interrupt is received
def spawn *cmd
  pid = Process.spawn *cmd

  switch = true
  Signal.trap 'SIGINT' do
    Process.kill( :QUIT, pid ) && Process.wait
    switch = false
  end
  while switch do sleep 1 end
end

# rake build
desc 'Generate the site'
task :build do
  system 'jekyll', 'build'
end

# rake test
desc 'Generate the site and start a server (no auto generate).'
task :test do
  spawn 'jekyll', 'serve', '--config', testing_config
end

# rake watch
desc 'Start a server and watch the site for changes.'
task :watch do
  spawn 'jekyll', 'serve', '--watch', '--config', testing_config
end

# rake dev
desc 'Start a server and watch the site for changes.' + "\n" +
     'Loads _config.dev.yml as an additional config file.'
task :dev do
  spawn 'jekyll', 'serve', '--watch', '--config', dev_config
end

# rake draft
desc 'Start a server and watch the site for changes.' + "\n" +
     'Include all drafts in site.'
task :draft do
  spawn 'jekyll', 'serve', '--watch', '--drafts', testing_config
end

# rake deploy
desc 'Deploy the site using rsync.'
task :deploy => :build do
  raise '>> error: must add :depoly: section to _config.yml.' if config[:deploy].nil?

  local = File.expand_path '_site/'
  server = config[:deploy][:server]
  user = config[:deploy][:user]
  port = config[:deploy][:port]
  path = config[:deploy][:path]

  flags = %w{ -r -t --del -z -v }
  rsync = [ 'rsync', *flags, '-e', %Q{"ssh -p #{port}"}, local + '/', "#{user}@#{server}:#{path}" ].join(' ')

  p "Now running: #{rsync}"
  system rsync
end

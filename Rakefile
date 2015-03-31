# Standard library
require 'fileutils'
require 'rake'
require 'tmpdir'
require 'yaml'

# Load the configuration file
config = YAML.load_file '_config.yml'

testing_config = '_config.yml,_config.testing.yml'
dev_config = '_config.yml,_config.dev.yml'

config[:destination] ||= '_site/'
config[:sub_content] ||= []
destination = File.join config[:destination], '/'

# Set "rake draft" as default task
task :default => :draft

# Spawn a server and kill it gracefully when interrupt is received
def spawn *cmd
  pid = Process.spawn 'bundle', 'exec', *cmd

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
  sh 'bundle', 'exec', 'jekyll', 'build'

  config[:sub_content].each do |content|
    repo = content[0]
    branch = content[1]
    dir = content[2]
    rev = content[3]
    Dir.chdir config[:destination] do
      FileUtils.mkdir_p dir
      sh "git clone -b #{branch} #{repo} #{dir}"
      Dir.chdir dir do
        sh "git checkout #{rev}" if rev
        FileUtils.remove_entry_secure '.git'
        FileUtils.remove_entry_secure '.nojekyll' if File.exists? '.nojekyll'
      end if dir
    end if Dir.exists? config[:destination]
  end
end

# rake test
desc 'Generate the site and start a server (no auto-regeneration).'
task :test do
  spawn 'jekyll', 'serve', '--no-watch', '--config', testing_config
end

# rake watch
desc 'Start a server and watch the site for changes.'
task :watch do
  spawn 'jekyll', 'serve', '--config', testing_config
end

# rake dev
desc 'Start a server and watch the site for changes.' + "\n" +
     'Loads _config.dev.yml as an additional config file.'
task :dev do
  spawn 'jekyll', 'serve', '--config', dev_config
end

# rake draft
desc 'Start a server and watch the site for changes.' + "\n" +
     'Include all drafts in site.'
task :draft do
  spawn 'jekyll', 'serve', '--drafts', '--config', testing_config
end

# rake deploy
desc 'Deploy the site using rsync.'
task :deploy => :build do
  raise '>> error: must add :depoly: section to _config.yml.' if config[:deploy].nil?

  local = File.expand_path destination
  protocol = config[:deploy][:protocol]
  server = config[:deploy][:server]
  user = config[:deploy][:user]
  port = config[:deploy][:port]
  path = config[:deploy][:path]
  upload_only = config[:deploy][:upload_only]

  case protocol
  when :rsync

    flags = %w{-r -t -z -v}
    if port.to_i != 22
      flags << '-e'
      flags << %Q{"ssh -p #{port}"}
    end

    excludes = upload_only.nil? ? [] : upload_only.collect { |e| "--exclude='#{e}'" }

    rsync = [ 'rsync', *flags, '--del', *excludes, "#{local}/", "#{user}@#{server}:#{path}" ].join(' ')

    p "Now running: #{rsync}"
    sh rsync

    if upload_only
      rsync_uploads = [ 'rsync', *flags, "#{local}/", "#{user}@#{server}:#{path}" ].join(' ')
      p "Now running: #{rsync_uploads}"
      sh rsync_uploads
    end
  end
end

# rake ghpages
desc 'Generate site and publish to GitHub Pages.'
task :ghpages do
  repo = %x(git config remote.origin.url).strip
  deploy_branch = repo.match(/github\.io\.git$/) ? 'master' : 'gh-pages'
  rev = %x(git rev-parse HEAD).strip

  sh 'bundle install'
  sh 'bower install'

  Dir.mktmpdir do |dir|
    sh "git clone --branch #{deploy_branch} #{repo} #{dir}"
    sh 'bundle exec rake build'
    sh %Q(rsync -rt --delete-after --exclude=".git" --exclude=".nojekyll" --exclude=".deploy_key*" #{destination} #{dir})
    Dir.chdir dir do
      sh 'git add --all'
      sh "git commit -m 'Built from #{rev}'."
      sh 'git push'
    end
  end
end

# rake travis
desc 'Generate site from Travis CI and publish site to GitHub Pages.'
task :travis do
  # if this is a pull request, do a simple build of the site and stop
  if ENV['TRAVIS_PULL_REQUEST'].to_s.to_i > 0
    puts 'Pull request detected. Executing build only.'
    sh 'bundle exec rake build'
    next
  end

  verbose false do
    sh 'chmod 600 .deploy_key'
    sh 'ssh-add .deploy_key'
  end

  repo = %x(git config remote.origin.url).gsub(/^git:/, 'https:').strip
  deploy_branch = repo.match(/github\.io\.git$/) ? 'master' : 'gh-pages'
  rev = %x(git rev-parse HEAD).strip

  Dir.mktmpdir do |dir|
    dir = File.join dir, 'site'
    sh 'bundle exec rake build'
    fail "Build failed." unless Dir.exists? destination
    sh "git clone --branch #{deploy_branch} #{repo} #{dir}"
    sh %Q(rsync -rt --del --exclude=".git" --exclude=".nojekyll" --exclude=".deploy_key*" #{destination} #{dir})
    Dir.chdir dir do
      # setup credentials so Travis CI can push to GitHub
      verbose false do
        sh "git config user.name '#{ENV['GIT_NAME']}'"
        sh "git config user.email '#{ENV['GIT_EMAIL']}'"
      end

      sh 'git add --all'
      sh "git commit -m 'Built from #{rev}'."

      verbose false do
        sh "git push -q #{repo} #{deploy_branch}"
      end
    end
  end
end

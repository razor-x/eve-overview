require 'fileutils'
require 'rake'
require 'rake-jekyll'
require 'tmpdir'
require 'yaml'

# Load the configuration file.
config = YAML.load_file '_config.yml'

testing_config = '_config.yml,_config.testing.yml'
dev_config = '_config.yml,_config.dev.yml'

config[:destination] ||= '_site/'
destination = File.join config[:destination], '/'

# Set "rake draft" as default task.
task default: [:draft]

# Spawn a server and kill it gracefully when interrupt is received.
def spawn *cmd
  pid = Process.spawn 'bundle', 'exec', *cmd

  switch = true
  Signal.trap 'SIGINT' do
    Process.kill(:QUIT, pid) && Process.wait
    switch = false
  end
  while switch do sleep 1 end
end

# Generate a staging config if staging URL is set.
def generate_staging_config(url, config)
  staging = {'domain' => url, 'baseurl' => url,
             'assets' => {'baseurl' => "#{url}/assets"}}
  File.open(config, 'w') { |f| f.write staging.to_yaml }
end

# Command to build static site to destination (as an Array).
def build_site_command(destination=nil, staging_url='')
  config = '_config.staging.yml'
  generate_staging_config(staging_url, config) unless staging_url.empty?

  args = []
  args.concat ['--destination', destination] unless destination.nil?

  if File.exists? config
    args.concat ['--config', "_config.yml,#{config}"]
  end

  ['bundle', 'exec', 'jekyll', 'build', *args]
end

# rake build
desc 'Generate the site'
task :build do
  staging_url = ENV['STAGING_URL'].to_s
  sh(*build_site_command(nil, staging_url))
  if File.exists?('_config.staging.yml') && !staging_url.empty?
    File.delete '_config.staging.yml'
  end
end

# rake test
desc 'Generate the site and start a server (no auto-regeneration)'
task :test do
  spawn 'jekyll', 'serve', '--no-watch', '--config', testing_config
end

# rake watch
desc 'Start a server and watch the site for changes'
task :watch do
  spawn 'jekyll', 'serve', '--config', testing_config
end

# rake dev
desc 'Start a server and watch the site for changes:' + "\n" +
     'loads _config.dev.yml as an additional config file'
task :dev do
  spawn 'jekyll', 'serve', '--config', dev_config
end

# rake draft
desc 'Start a server and watch the site for changes:' + "\n" +
     'include all drafts in site'
task :draft do
  spawn 'jekyll', 'serve', '--drafts', '--config', testing_config
end

# rake deploy
desc 'Deploy the site using rsync'
task deploy: [:build] do
  fail 'Error: must add :depoly: section to _config.yml.' if config[:deploy].nil?

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

    rsync = ['rsync', *flags, '--del', *excludes,
              "#{local}/", "#{user}@#{server}:#{path}"].join(' ')

    p "Now running: #{rsync}"
    sh rsync

    if upload_only
      rsync_uploads = ['rsync', *flags,
                        "#{local}/", "#{user}@#{server}:#{path}"].join(' ')
      p "Now running: #{rsync_uploads}"
      sh rsync_uploads
    end
  end
end

# rake publish
Rake::Jekyll::GitDeployTask.new(:publish) do |t|
  t.description = 'Generate the site and push changes to remote repository'
  t.author_date = -> { '' }

  t.remote_url = -> {
    %x(git config remote.origin.url)
    .gsub(%r{^git://}, 'git@')
    .sub(%r{/}, ':').strip
  }

  t.deploy_branch = -> {
    t.remote_url.match(/github\.io\.git$/) ? 'master' : 'gh-pages'
  }

  t.jekyll_build = -> (dest_dir) {
    Rake.sh(*build_site_command(dest_dir, ENV['STAGING_URL'].to_s))
  }

  t.skip_commit = -> {
    ENV['TRAVIS_PULL_REQUEST'].to_i > 0 ||
      %w[yes y true 1].include?(ENV['SKIP_COMMIT'].to_s.downcase) ||
      (!ENV['SOURCE_BRANCH'].nil? && ENV['SOURCE_BRANCH'] != ENV['TRAVIS_BRANCH'])
  }
end

# rake travis_env
desc 'Prepare the Travis CI build environment'
task :travis_env do
  # Setup the deploy key.
  puts 'Adding deploy key.'
  verbose false do
    sh 'chmod 600 .deploy_key'
    sh 'ssh-add .deploy_key'
  end
end

# rake travis
desc 'Generate site from Travis CI and publish site to GitHub Pages'
task travis: [:travis_env, :publish]

require 'rake-jekyll'
require 'yaml'

# Load the configuration file.
config = YAML.load_file '_config.yml'

# Set environment config file combinations.
testing_config = '_config.yml,_config.testing.yml'
dev_config = '_config.yml,_config.dev.yml'

# Set staging environment config file name.
staging_config_file = '_config.staging.yml'

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

# Command to build static site to destination (as an Array).
def build_site_command(destination=nil)
  staging_config_file = '_config.staging.yml'
  args = []
  args.concat ['--destination', destination] unless destination.nil?

  if File.exists? staging_config_file
    args.concat ['--config', "_config.yml,#{staging_config_file}"]
  end

  ['bundle', 'exec', 'jekyll', 'build', *args]
end

# Clean modifications from the staging environment.
def clean_staging
  staging_config_file = '_config.staging.yml'
  File.delete staging_config_file if File.exists? staging_config_file
  sh 'git checkout robots.txt'
end

# Set `rake draft` as default task.
task default: [:draft]

# rake travis
desc 'Generate site from Travis CI and publish site to GitHub Pages'
task travis: [:staging_env, :travis_env, :publish]

# rake build
desc 'Generate the site'
task build: [:staging_env] do
  clean_staging if ENV['STAGING_URL'].to_s.empty?
  sh(*build_site_command)
  clean_staging
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
  fail 'Error: must add :depoly: section to _config.yml.' if config['deploy'].nil?

  # Load or set destination.
  destination = File.join(
    config[:destination] ? config[:destination] : '_site', '/')

  # Load deploy settings.
  local = File.expand_path destination
  protocol = config['deploy']['protocol']
  server = config['deploy']['server']
  user = config['deploy']['user']
  port = config['deploy']['port']
  path = config['deploy']['path']
  upload_only = config['deploy']['upload_only']

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
    sh rsync

    if upload_only
      rsync_uploads = [
        'rsync', *flags,
        "#{local}/", "#{user}@#{server}:#{path}"
      ].join(' ')
      sh rsync_uploads
    end
  end
end

# rake publish
Rake::Jekyll::GitDeployTask.new(:publish) do |t|
  t.description = 'Generate the site and push changes to remote repository'

  t.jekyll_build = -> (dest_dir) {
    Rake.sh(*build_site_command(dest_dir))
  }
end

# rake travis_env
desc 'Prepare the Travis CI build environment'
task :travis_env do
  next if ENV['SKIP_DEPLOY'].to_s == 'true' && ENV['REQUIRE_KEY'].to_s != 'true'

  deploy_key = ENV['DEPLOY_KEY'].to_s
  .split('[NL]').join("\n").gsub('[SP]', ' ')
  unless deploy_key.empty?
    File.open('.deploy_key', 'w') { |f| f.write deploy_key }
  end

  if File.exists? '.deploy_key'
    sh 'chmod 600 .deploy_key'
  end

  unless deploy_key.empty?
    sh 'ssh-add .deploy_key'
  end
end

# rake staging_env
desc 'Prepare the staging environment'
task :staging_env do
  url = ENV['STAGING_URL'].to_s
  next if url.empty?

  staging_config = {
    'domain' => url, 'baseurl' => url,
    'assets' => {'baseurl' => "#{url}/assets"}
  }

  File.open(staging_config_file, 'w') { |f| f.write staging_config.to_yaml }
  File.open('robots.txt', 'w') { |f| f.write "User-agent: *\nDisallow: /" }

  cname = ENV['CNAME'].to_s
  if cname == 'false'
    File.delete('CNAME') if File.exists?('CNAME')
  elsif !cname.empty?
    File.open('CNAME', 'w') { |f| f.write cname }
  end
end

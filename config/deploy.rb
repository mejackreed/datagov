set :application, 'datagov'
set :repo_url, 'https://github.com/mejackreed/datagov.git'
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :user, 'datagov'
set :home_directory, "/opt/app/#{fetch(:user)}"

set :deploy_to, "#{fetch(:home_directory)}/#{fetch(:application)}"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :info

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/blacklight.yml public/robots.txt}

# Default value for linked_dirs is []
set :linked_dirs, %w{config/settings log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/sitemaps}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

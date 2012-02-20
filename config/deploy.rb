set  :application, "fanarts"
role :web, "176.34.51.174"
role :app, "176.34.51.174"
role :db,  "176.34.51.174", :primary => true

set :scm,         :git
set :user,        "app"
set :use_sudo,    false

# set :branch,      "develop"
# set :repository,  "/Users/cohakim/Dropbox/projects/Rails/FanArts"
# set :deploy_via,  :copy
# set :deploy_to,   "/var/www/app/fanarts"

set :branch,      "master"
set :repository,  "git@github.com:cohakim/fanarts-ruby.git"
set :deploy_via,  :remote_cache
set :deploy_to,   "/var/www/app/fanarts/"

# for bundler
require "bundler/capistrano"
set :bundle_gemfile,  "Gemfile"
set :bundle_dir,      File.join(fetch(:shared_path), 'bundle')
set :bundle_flags,    "--quiet"
set :bundle_without,  [:development, :test]
set :bundle_cmd,      "bundle"
set :bundle_roles,    [:app]

# for whenever
require "whenever/capistrano"
set :whenever_command, "bundle exec whenever"
set :whenever_roles, [:app]

# for unicorn
namespace :app do
  task :start, :roles => :app, :except => { :no_release => true } do
    run "sudo -S /etc/init.d/fanarts start"
  end
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "sudo -S /etc/init.d/fanarts stop"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "sudo -S /etc/init.d/fanarts restart"
  end
end

after 'deploy:symlink' do
  run "mkdir -p #{shared_path}/sockets"
  run "ln -s #{shared_path}/sockets #{current_path}/tmp/sockets"
end

require "bundler/capistrano"

set :application, "fanarts"
set :user,        "app"
set :use_sudo,    false

set :scm, :git
set :branch,      "develop"
set :repository,  "/Users/cohakim/Public/Dropbox/projects/Rails/FanArts"
set :deploy_via,  :copy
set :deploy_to,   "/var/www/app/fanarts/"

# set :branch,      "master"
# set :repository,  "git@github.com:cohakim/simple1000.git"
# set :deploy_via,  :remote_cache
# set :deploy_to,   "/var/www/app/fanarts/"

role :web, "106.187.39.247"
role :app, "106.187.39.247"
role :db,  "106.187.39.247", :primary => true

# set :default_environment, {
#   'PATH' => "/home/app/.rbenv/shims:/home/app/.rbenv/bin:$PATH"
# }
set :bundle_gemfile,  "Gemfile"
set :bundle_dir,      File.join(fetch(:shared_path), 'bundle')
set :bundle_flags,    "--deployment --quiet"
set :bundle_without,  [:development, :test]
set :bundle_cmd,      "bundle"
set :bundle_roles,    [:app]


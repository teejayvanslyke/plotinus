set :application, "plotinus"
set :domain,      "plotinus.net"
set :repository,  "git@github.com/teejayvanslyke/plotinus.git"
set :use_sudo,    false
set :deploy_to,   "/var/www/#{application}"
set :scm,         "git"

role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

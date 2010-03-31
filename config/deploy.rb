default_run_options[:pty] = true
ssh_options[:paranoid] = false
set :application, "kernohan_vocals"
set :repository,  "git@github.com:bentreflection/kernohan_rails.git"

set :scm, :git
set :scm_passphrase, ""

set :deploy_to, "~/#{application}"

server "singwithkellykernohan.com", :app, :web, :db, :primary => true

set :user, "kellyker"


set :use_sudo, false

namespace :deploy do
  task :symlink_configs, :role => :app do
    %w(settings.yml database.yml).each do |filename|
      run "ln -nfs #{shared_path}/config/#{filename} #{release_path}/config/#{filename}"
    end
  end
end


desc "Restart the web server. Overrides the default task for Site5 use."
task :restart, :roles => :app do
  #run "killall -q dispatch.fcgi"
  run "chmod 755 #{current_path}/public/dispatch.fcgi"
  run "touch #{current_path}/public/dispatch.fcgi"
end

set :application, "kernohan_vocals"
set :repository,  "git@github.com:bentreflection/kernohan_rails.git"

set :scm, :git

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

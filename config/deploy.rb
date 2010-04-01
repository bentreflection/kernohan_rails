after "deploy:symlink", "deploy:symlink_configs"
after "deploy:symlink", "deploy:symlink_htaccess"
after "deploy:symlink", "deploy:symlink_dirs"
after "deploy:symlink", "deploy:compile_sass"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :application, "kernohan_vocals"
set :repository,  "git@github.com:bentreflection/kernohan_rails.git"

set :scm, :git
set :scm_passphrase, ""

set :deploy_to, "~/#{application}"

set :rails_env,  "production"

set :branch, "master"
server "singwithkellykernohan.com", :app, :web, :db, :primary => true

set :user, "kellyker"

set :keep_releases, 2
set :use_sudo, false

namespace :deploy do
  task :symlink_configs, :role => :app do
    %w(settings.yml database.yml).each do |filename|
      run "ln -nfs #{shared_path}/#{filename} #{release_path}/config/#{filename}"
    end
  end
  
  desc "Update CSS files and replace relative urls with absolute ones"
  task :compile_sass, :roles => :app do
    haml_dir = 'haml'
    run "ls #{current_path}/vendor/gems | grep haml" do |channel, stream, data|
      haml_dir = data
    end
    run <<-BASH
      for file in #{current_path}/public/stylesheets/sass/*.sass; do
        #{current_path}/vendor/gems/#{haml_dir}/bin/sass $file #{current_path}/public/stylesheets/`basename ${file%.sass}`.css ; done
    BASH
  end
  
  
  task :symlink_htaccess, :role => :app do
    run "ln -s #{shared_path}/.htaccess #{release_path}/public/.htaccess"
  end
  
  desc "Symlink persisted directories"
  task :symlink_dirs, :roles => :app, :except => { :no_symlink => true } do
    # this is a little weird, we can't just link public/images because that's
    # in the repo, but the Image model is also a dynamic upload path, so we're
    # pre-linking a bunch of possible dynamic folder destinations, add more if
    # necessary...
    %w( tmp/milton public/assets).each do |directory|
      run "mkdir -p #{shared_path}/#{directory}"
      run "ln -nfs #{shared_path}/#{directory} #{release_path}/#{directory}"
    end
  end    
  
end




desc "Restart the web server. Overrides the default task for Site5 use."
task :restart, :roles => :app do
  run "killall -q dispatch.fcgi"
  run "chmod 755 #{current_path}/public/dispatch.fcgi"
  run "touch #{current_path}/public/dispatch.fcgi"
end


task :set_permissions do
donothing = true
end

# REQUIRED VARIABLES
set :application, "smspatio"
set :repository,  "http://code.autistici.org/svn/hamlab/smspatio/trunk"

# ROLES
role :app, "pluton.cadenalibre.net"
role :web, "pluton.cadenalibre.net"
role :db,  "pluton.cadenalibre.net", :primary => true

# OPTIONAL VARIABLES
set :keep_releases, 3
set :monit_group, 'mongrelsp'
set :deploy_to, "/home/htdocs/#{application}"
set :user, "appsrv"
set :scm, :subversion
set :use_sudo, false

# TASKS
task :after_update_code do
  run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml"
  run "ln -nfs #{deploy_to}/#{shared_dir}/config/clickatell_http.yml #{release_path}/config/clickatell_http.yml"
  run "ln -nfs #{deploy_to}/#{shared_dir}/config/send_sms.erb #{release_path}/app/views/mailer/send_sms.erb"
end

namespace :deploy do
  %W(start stop restart).each do |event|
    desc "#{event} using Monit"
    task event, :except => { :no_release => true } do
      sudo "/usr/sbin/monit -g #{monit_group} #{event} all"
    end
  end
end

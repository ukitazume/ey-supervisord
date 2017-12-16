#
# Cookbook Name:: resque
# Recipe:: default
#
if node['supervisord']['is_the_instance']
  
  package "app-admin/supervisor" do
    version node['supervisord']['version']
    action :install
  end

  template "/etc/monit.d/supervisord.monitrc" do
    owner 'root' 
    group 'root' 
    mode 0644 
    source "monitrc.conf.erb" 
  end

  template "/etc/supervisord.conf" do
    owner 'root' 
    group 'root' 
    mode 0644 
    source "supervisord.conf.erb" 
  end

  directory "/etc/supervisord.d" do
    owner 'root'
    group 'root'
    mode 0755
  end

  directory "/var/log/engineyard/apps/supervisord" do
    owner 'root'
    group 'root'
    mode 0755
  end

  template "/etc/supervisord.d/custom_program.ini" do
    owner 'root' 
    group 'root' 
    mode 0755
    source "custom_program.ini.erb" 
  end

  execute "reload" do
    command "monit reload && supervisord start all && supervisorctl reload"
  end

end

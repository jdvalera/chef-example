#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

package "apache2" do
    case node[:platform]
    when 'centos'
        package_name 'httpd' 
        action :install
    when 'ubuntu'
        package_name 'apache2'
        action :install
    end
end

service "apache2" do
    case node[:platform]
    when 'centos'
         service_name 'httpd'
         action [ :enable, :start ]
    when 'ubuntu'
         service_name 'apache2'
         action [ :enable, :start ]
    end
end

template "/var/www/html/index.html" do
    source 'index.html.erb'
    mode '0644'
end

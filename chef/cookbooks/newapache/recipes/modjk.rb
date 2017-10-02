include_recipe 'newapache::install'


remote_file "#{node['newapache']['MODJK']['DOWN_LOC']}/#{node['newapache']['MODJK']['TAR_FILE']}" do
  source "#{node['newapache']['MODJK']['URL']}"
  action :create
end

execute 'Extract TAR File' do
  command "tar xf #{node['newapache']['MODJK']['TAR_FILE']}"
  cwd '/opt'
  #not_if { File.exists?("/file/contained/in/tar/here") }
end

execute 'Compile tomcat connector' do
  command './configure --with-apxs=/usr/bin/apxs && make && make install'
  cwd "/opt/#{node['newapache']['MODJK']['TAR_DIR']}/native"
end

cookbook_file "/etc/httpd/conf.d/mod_jk.conf" do 
	source 'mod_jk.conf'
	action :create
end

template "/etc/httpd/conf.d/workers.properties" do 
	source 'workers.properties'
	action :create
end

#%w(httpd httpd-devel).each do |foo|
#	package "#{foo}" do 
#		action :install
#	end
#end

package %w(httpd httpd-devel gcc)  do
  action :install
end

service "httpd" do
  action [:start, :enable]
end

remote_file '/opt/tomcat-connectors-1.2.42-src.tar.gz' do
  source 'http://redrockdigimark.com/apachemirror/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.42-src.tar.gz'
  action :create
end

execute 'Extract TAR File' do
  command 'tar xf tomcat-connectors-1.2.42-src.tar.gz'
  cwd '/opt'
  #not_if { File.exists?("/file/contained/in/tar/here") }
end

execute 'Compile tomcat connector' do 
  command './configure --with-apxs=/usr/bin/apxs && make && make install'
  cwd '/opt/tomcat-connectors-1.2.42-src/native'
end

%w(modjk.conf workers.properties).each do |file|
	cookbook_file "/etc/httpd/conf.d/#{file}" do
  		source "#{file}"
  		action :create
	end
end

service "httpd" do
  action :restart 
end

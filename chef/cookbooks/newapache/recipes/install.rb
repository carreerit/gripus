node['newapache']['PACK_LIST'].each do |packname|
	package "#{packname}"  do
		action :install
	end
end

service "#{node['newapache']['SERV_NAME']}" do
  action [:start, :enable]
end

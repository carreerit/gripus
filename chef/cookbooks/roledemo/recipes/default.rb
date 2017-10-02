#
# Cookbook:: roledemo
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

log 'message' do
  message 'Hello World -v2'
  level :fatal
end

log 'message-new' do
  message "SAMPLE = #{node['roledemo']['SAMPLE']}"
  level :fatal
end

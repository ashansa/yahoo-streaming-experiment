#
# DO NOT EDIT THIS FILE DIRECTLY - UNLESS YOU KNOW WHAT YOU ARE DOING
#

user node[:yahoo-streaming-experiment][:user] do
  action :create
  supports :manage_home => true
  home "/home/#{node[:yahoo-streaming-experiment][:user]}"
  shell "/bin/bash"
  not_if "getent passwd #{node[:yahoo-streaming-experiment]['user']}"
end

group node[:yahoo-streaming-experiment][:group] do
  action :modify
  members ["#{node[:yahoo-streaming-experiment][:user]}"]
  append true
end


private_ip = my_private_ip()
public_ip = my_public_ip()



# Pre-Experiment Code


# Configuration Files



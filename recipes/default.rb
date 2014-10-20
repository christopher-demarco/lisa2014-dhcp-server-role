# Add IP addresses for each network we're listening on
service "networking" do
  action :nothing
end
# FIXME: This is probably the wrong way to do it, but until I find the right way...
# FIXME: Get the correct interface name from ohai
# FIXME: Get ip addresses from databags
template 'eth0.cfg' do
  source 'eth0.cfg.erb'
  mode '0644'
  owner 'root'
  group 'root'
  action :create
  notifies :start "service[networking]", :immediately
end
# FIXME: quick-n-dirty, make it unstoopid


include_recipe 'dhcp::server'



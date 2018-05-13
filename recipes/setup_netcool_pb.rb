# set the IP and probe server name
hostsfile_entry node['PAP'] do
  hostname node['PA']
  action   :create
  unique   true
end

# create omni.dat via template
template "#{node['prbsrv']['nc_dir']}/etc/omni.dat" do
  source 'omni.dat.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode 0664
end

# create the interface file
execute 'create_interface' do
  command "#{node['prbsrv']['nc_dir']}/bin/nco_igen"
  cwd "#{node['prbsrv']['nc_dir']}/bin"
  not_if { File.exist?("#{node['prbsrv']['nc_dir']}/etc/interfaces.linux2x86") }
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  action :run
end

# create ncoms property file
template "#{node['prbsrv']['ob_dir']}/etc/#{node['prbsrv']['ncoms']}.props" do
  source 'ncoms.props.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode 0444
end

# create configuration files for PA
template "#{node['prbsrv']['ob_dir']}/etc/#{node['prbsrv']['os_pa_name']}.conf" do
  source 'nco_pa.conf.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode 0444
end
template "#{node['prbsrv']['ob_dir']}/etc/#{node['prbsrv']['os_pa_name']}.props" do
  source 'nco_pa.props.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode 0444
end

## create files for PAM
# netcool
template '/etc/pam.d/netcool' do
  source 'netcool.erb'
  mode 0644
end
# object server
template '/etc/pam.d/nco_objserv' do
  source 'nco_objserv.erb'
  mode 0644
end

# This is so PAD can read shadow file
file '/etc/shadow' do
  mode 0004
end

# create setup script for netcool applications
template '/etc/init.d/nco_pa' do
  source 'nco_pa.erb'
  mode 0755
end

# add script to system configuration
service 'nco_pa' do
  action [:enable, :start]
end

# create sql file to verify netcool
template "#{node['prbsrv']['ob_dir']}/verify_nc.sql" do
  source 'verify_nc.sql.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode 0444
end
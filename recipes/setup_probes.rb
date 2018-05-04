# This will setup the gateways
# create the mttrapd Gateway dir
directory node['prbsrv']['rdy_dir'] do
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode '0755'
  recursive true
  action :create
end

# copy mttrapd template from default location
execute 'copy_default_mttrapd' do
  command "find #{node['prbsrv']['ob_dir']}/probes/mttrapd -maxdepth 1 -type f -exec cp -t #{node['prbsrv']['rdy_dir']} {} +"
  cwd '/usr/bin'
  not_if { File.exist?("#{node['prbsrv']['rdy_dir']}/mttrapd.map") }
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  action :run
end

# create mttrapd configuration files
# map file
template "#{node['prbsrv']['rdy_dir']}/mttrapd.map" do
  source 'mttrapd.map.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode 0444
end
# props file
template "#{node['prbsrv']['rdy_dir']}/G_BMC_mttrapd.props" do
  source 'G_BMC_mttrapd.props.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode 0444
end
# env file
template "#{node['prbsrv']['rdy_dir']}/nco_g_bmc_mttrapd.env" do
  source 'nco_g_bmc_mttrapd.env.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode 0444
end

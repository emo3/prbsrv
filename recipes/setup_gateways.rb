# This will setup the gateways
# create the Remedy Gateway dir
directory node['prbsrv']['rdy_dir'] do
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode '0755'
  recursive true
  action :create
end

# copy remedy template from default location
execute 'copy_default_remedy' do
  command "find #{node['prbsrv']['ob_dir']}/gates/bmc_remedy -maxdepth 1 -type f -exec cp -t #{node['prbsrv']['rdy_dir']} {} +"
  cwd '/usr/bin'
  not_if { File.exist?("#{node['prbsrv']['rdy_dir']}/bmc_remedy.map") }
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  action :run
end

# create remedy configuration files
# map file
template "#{node['prbsrv']['rdy_dir']}/bmc_remedy.map" do
  source 'bmc_remedy.map.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode 0444
end
# props file
template "#{node['prbsrv']['rdy_dir']}/G_BMC_REMEDY.props" do
  source 'G_BMC_REMEDY.props.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode 0444
end
# env file
template "#{node['prbsrv']['rdy_dir']}/nco_g_bmc_remedy.env" do
  source 'nco_g_bmc_remedy.env.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode 0444
end

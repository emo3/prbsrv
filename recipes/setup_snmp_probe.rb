# This will setup the probes
# create the base netcool dir
directory node['prbsrv']['nc_dir'] do
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode '0755'
  recursive true
  action :create
end

######
# create mttrapd configuration files
# bi rules file
template "#{node['prbsrv']['ob_dir']}/etc/mttrapd.bidir.rules" do
  source 'mttrapd.bidir.rules.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode '0444'
end
# rules file
template "#{node['prbsrv']['ob_dir']}/etc/mttrapd.rules" do
  source 'mttrapd.rules.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode '0444'
end
# flood rules file
template "#{node['prbsrv']['ob_dir']}/etc/mttrapd_flood_control.rules" do
  source 'mttrapd_flood_control.rules.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode '0444'
end
# props file
template "#{node['prbsrv']['nc_dir']}/etc/mttrapd.props" do
  source 'mttrapd.props.erb'
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode '0444'
end

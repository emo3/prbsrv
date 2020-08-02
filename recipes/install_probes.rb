# Install the Netcool tools defined between ()
%w(nco-p-mttrapd nco-p-tivoli-eif nco-p-stdin).each do |tool|
  install_tool 'do PRB install tool' do
    tool_package node['nc_tools'][tool]['tool_package']
    tool_url node['nc_tools'][tool]['tool_url']
    tool_dir node['nc_tools'][tool]['tool_dir']
    tool_lif node['nc_tools'][tool]['tool_lif']
    tool_version node['nc_tools'][tool]['tool_version']
    tool_name node['nc_tools'][tool]['tool_name']
    tool_imd node['nc_tools'][tool]['tool_imd']
    action :install
  end
end

# cmd tool file
tcmd = []
%w(nco-p-mttrapd nco-p-tivoli-eif).each do |cmd|
  tcmd << node['nc_tools'][cmd].merge(\
    {'pa_name' => node['prbsrv']['ps_pa_name']}).merge(\
    {'nc_act' => node['prbsrv']['nc_act']}).merge(\
    {'nc_pwd' => node['prbsrv']['nc_pwd']})
end

template "#{node['prbsrv']['nc_home']}/ncprofile-c" do
  source 'ncprofilec.erb'
  variables(
    tools: tcmd
  )
  sensitive true
  owner node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode '0755'
end

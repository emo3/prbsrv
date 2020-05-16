# Install the Netcool tools defined between ()
%w(nco-p-mttrapd nco-p-tivoli-eif nco-p-stdin).each do |tool|
  install_tool 'do install tool' do
    tool_package node['nc_tools']['tool_package']
    tool_url node['nc_tools']['tool_url']
    tool_dir node['nc_tools']['tool_dir']
    tool_lif node['nc_tools']['tool_lif']
    tool_version node['nc_tools']['tool_version']
    tool_name node['nc_tools']['tool_name']
    tool_imd node['nc_tools']['tool_imd']
    action :install
  end
end

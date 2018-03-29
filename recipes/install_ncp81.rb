# Create the dir's that are needed by netcool
directory node['prbsrv']['install_dir'] do
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  not_if { File.exist?("#{node['prbsrv']['nc_dir']}/omnibus/probes/linux2x86/nco_p_mttrapd") }
  recursive true
  mode '0755'
end

# Download the probes package file
remote_file "#{node['prbsrv']['install_dir']}/#{node['prbsrv']['package']}" do
  source "#{node['prbsrv']['media_url']}/#{node['prbsrv']['package']}"
  not_if { File.exist?("#{node['prbsrv']['install_dir']}/#{node['prbsrv']['package']}") }
  not_if { File.exist?("#{node['prbsrv']['install_dir']}/nco-p-mttrapd_20_0/install.txt") }
  not_if { File.exist?("#{node['prbsrv']['nc_dir']}/omnibus/probes/linux2x86/nco_p_mttrapd") }
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode '0755'
  action :create
end

# unzip the probes package file
execute 'unzip_package' do
  command "unzip -q #{node['prbsrv']['install_dir']}/#{node['prbsrv']['package']}"
  cwd node['prbsrv']['install_dir']
  not_if { File.exist?("#{node['prbsrv']['install_dir']}/nco-p-mttrapd_20_0/install.txt") }
  not_if { File.exist?("#{node['prbsrv']['nc_dir']}/omnibus/probes/linux2x86/nco_p_mttrapd") }
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  umask '022'
  action :run
end

template "#{node['prbsrv']['temp_dir']}/install_product-probes81.xml" do
  not_if { File.exist?("#{node['prbsrv']['nc_dir']}/omnibus/probes/linux2x86/nco_p_mttrapd") }
  source 'install_product-probes81.xml.erb'
  mode 0755
end

execute 'install_probes' do
  command "#{node['prbsrv']['app_dir']}/InstallationManager/eclipse/tools/imcl \
  input #{node['prbsrv']['temp_dir']}/install_product-probes81.xml \
  -log #{node['prbsrv']['temp_dir']}/install-probes_log.xml \
  -acceptLicense"
  not_if { File.exist?("#{node['prbsrv']['nc_dir']}/omnibus/probes/linux2x86/nco_p_mttrapd") }
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  umask '022'
  action :run
end

file "#{node['prbsrv']['temp_dir']}/install_product-probes81.xml" do
  only_if { File.exist?("#{node['prbsrv']['nc_dir']}/omnibus/probes/linux2x86/nco_p_mttrapd") }
  action :delete
end

directory node['prbsrv']['install_dir'] do
  only_if { File.exist?("#{node['prbsrv']['nc_dir']}/omnibus/probes/linux2x86/nco_p_mttrapd") }
  recursive true
  action :delete
end

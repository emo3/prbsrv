# Create the dir's that are needed by netcool
directory node['prbsrv']['install_dir'] do
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  # not_if { File.exist?("#{node['prbsrv']['app_dir']}/netcool/bin/nco_id") }
  recursive true
  mode '0755'
end

# Download the probes package file
remote_file "#{node['prbsrv']['install_dir']}/#{node['prbsrv']['package']}" do
  source "#{node['prbsrv']['media_url']}/#{node['prbsrv']['package']}"
  not_if { File.exist?("#{node['prbsrv']['install_dir']}/#{node['prbsrv']['package']}") }
  # not_if { File.exist?("#{node['prbsrv']['install_dir']}/install_gui.sh") }
  # not_if { File.exist?("#{node['prbsrv']['app_dir']}/netcool/bin/nco_id") }
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  mode '0755'
  action :create
end

# unzip the probes package file
execute 'unzip_package' do
  command "unzip -q #{node['prbsrv']['install_dir']}/#{node['prbsrv']['package']}"
  cwd node['prbsrv']['install_dir']
  # not_if { File.exist?("#{node['prbsrv']['install_dir']}/install_gui.sh") }
  # not_if { File.exist?("#{node['prbsrv']['app_dir']}/netcool/bin/nco_id") }
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  umask '022'
  action :run
end

template "#{node['prbsrv']['temp_dir']}/install_product-probes81.xml" do
  # not_if { File.exist?("#{node['prbsrv']['app_dir']}/netcool/bin/nco_id") }
  source 'install_product-probes81.xml.erb'
  mode 0755
end

execute 'install_probes' do
  command "#{node['prbsrv']['app_dir']}/InstallationManager/eclipse/tools/imcl \
  input #{node['prbsrv']['temp_dir']}/install_product-probes81.xml \
  -log #{node['prbsrv']['temp_dir']}/install-probes_log.xml \
  -acceptLicense"
  # not_if { File.exist?("#{node['prbsrv']['app_dir']}/netcool/bin/nco_id") }
  user node['prbsrv']['nc_act']
  group node['prbsrv']['nc_grp']
  umask '022'
  action :run
end

file "#{node['prbsrv']['temp_dir']}/install_product-probes81.xml" do
  # only_if { File.exist?("#{node['prbsrv']['app_dir']}/netcool/bin/nco_id") }
  action :delete
end

directory node['prbsrv']['install_dir'] do
  # only_if { File.exist?("#{node['prbsrv']['app_dir']}/netcool/bin/nco_id") }
  recursive true
  action :nothing
end

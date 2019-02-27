# create local extra FS
include_recipe '::nc_filesystem'
# install the base Netcool software
include_recipe 'nc_base::make_nc_base'
include_recipe 'nc_base::add_x11'
include_recipe 'nc_base::install_nckl'
# install the netcool probes
include_recipe '::install_probes'
# setup PA
include_recipe '::setup_netcool_ps'
# setup the probes
include_recipe '::setup_probes'

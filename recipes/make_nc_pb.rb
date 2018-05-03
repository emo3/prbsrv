# install the base Netcool software
include_recipe 'nc_base::my_nc_base'
# install the netcool probes
include_recipe '::install_probes'
# setup and start Object server
include_recipe '::setup_probes'
# setup the remedy gateway
# include_recipe '::setup_gateways'

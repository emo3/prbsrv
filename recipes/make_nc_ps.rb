# create local extra FS
include_recipe '::nc_filesystem'
# install the base Netcool software
include_recipe 'nc_base::make_nc_base'
# include_recipe 'nc_base::add_x11'
# install the netcool probes
include_recipe '::install_probes'
# setup nco_pa for probe
include_recipe '::setup_netcool_ps'
# setup both mttrapd and eif
include_recipe '::setup_probes'

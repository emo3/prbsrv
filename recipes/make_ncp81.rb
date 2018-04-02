# install the netcool base software
include_recipe 'objsrv::make_nc_base'
# install the netcool probes
include_recipe '::install_ncp81'

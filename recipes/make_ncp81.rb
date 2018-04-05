# Make vg for netcool install
include_recipe 'nc_base::nc_filesystem'
# install the netcool base software
include_recipe 'nc_base::make_nc_base'
# Add X11 functionality, comment out when not needed
include_recipe 'nc_base::add_x11'
# Add Netcool Knowledge Library
include_recipe 'nc_base::install_nckl'
# install the netcool probes for probe server
include_recipe '::install_ncp81'

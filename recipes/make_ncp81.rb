# add/create any file systems that are needed for netcool
include_recipe 'objsrv::filesystem'
# fix anything with RHEL that is needed for netcool
include_recipe 'objsrv::fix_netcool'
# install the latest version of installation manager
include_recipe 'objsrv::install_im'
# install base netcool
include_recipe 'objsrv::install_nco81'
# remove when you do not need any X11 stuff
include_recipe 'objsrv::add_x11'
# Update Netcool to latest fix pack
include_recipe 'objsrv::update_nco81'
# install the netcool knowledge library
include_recipe 'objsrv::install_nckl'
# install the netcool probes
include_recipe '::install_ncp81'

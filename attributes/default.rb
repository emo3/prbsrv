default['prbsrv']['package']     = 'nc81-probes.zip'
default['prbsrv']['cots_dir']    = '/sfcots'
default['prbsrv']['app_dir']     = "#{node['prbsrv']['cots_dir']}/apps"
default['prbsrv']['nc_dir']      = "#{node['prbsrv']['app_dir']}/netcool"
default['prbsrv']['media_dir']   = "#{node['prbsrv']['app_dir']}/media"
default['prbsrv']['install_dir'] = "#{node['prbsrv']['media_dir']}/ncp81"
default['prbsrv']['temp_dir']    = '/tmp'
default['prbsrv']['media_url']   = 'http://10.1.1.30/media'

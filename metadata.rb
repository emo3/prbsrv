name 'prbsrv'
maintainer 'Ed Overton'
maintainer_email 'infuse.1301@gmail.com'
license 'Apache 2.0'
description 'Installs/Configures prbsrv'
long_description 'Installs/Configures prbsrv'
version '0.1.0'
chef_version '>= 13.0'
supports 'redhat'
supports 'centos'

issues_url 'https://github.com/<insert_org_here>/prbsrv/issues' if respond_to?(:issues_url)
source_url 'https://github.com/<insert_org_here>/prbsrv'

depends 'nc_base'
depends 'nc_tools'
depends 'server_utils'

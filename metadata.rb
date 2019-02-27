name 'prbsrv'
maintainer 'Ed Overton'
maintainer_email 'infuse.1301@gmail.com'
license 'Apache 2.0'
description 'Installs/Configures prbsrv'
long_description 'Installs/Configures prbsrv'
version '0.1.0'
chef_version '>= 13.0'
supports 'redhat'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/prbsrv/issues' if respond_to?(:issues_url)

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/prbsrv'
depends 'nc_base', '~> 0.1.0'
depends 'nc_tools', '~> 0.1.0'
depends 'server_utils', '~> 0.1.0'

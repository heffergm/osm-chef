name             'osm2pgsql'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures osm2pgsql'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ apt git }.each do |dep|
    depends dep
end

%w{ ubuntu }.each do |os|
    supports os
end


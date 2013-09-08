curl -L https://get.rvm.io | bash
/bin/bash -l -c 'rvm install 1.9.3-p448'
/bin/bash -l -c 'rvm --default use 1.9.3-p448'
/bin/bash -l -c "gem install chef -v='11.4.2' --no-ri --no-rdoc"
/bin/bash -l -c 'chef-solo -c /opt/auger-chef/solo.rb -j /opt/auger-chef/solo.json'

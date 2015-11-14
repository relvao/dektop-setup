# install salt
apt-get install python-software-properties
add-apt-repository -y ppa:saltstack/salt
apt-get update
apt-get install salt-minion -y
# enable standalone mode - minion only
sed -i 's/file_client: remote/file_client: local/' /etc/salt/minion
# activate partener sources
sed -i 's/# deb http:\/\/archive\.canonical\.com\/ubuntu trusty partner/deb http:\/\/archive\.canonical\.com\/ubuntu trusty partner/' /etc/apt/sources.list
sed -i 's/# deb-src http:\/\/archive\.canonical\.com\/ubuntu trusty partner/deb-src http:\/\/archive\.canonical\.com\/ubuntu trusty partner/' /etc/apt/sources.list
# run salt for the first time
salt-call --local state.highstate

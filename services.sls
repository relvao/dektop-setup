## MongoDB
mongodb-org:
  pkgrepo.managed:
    - humanname: MongoDB PPA
    - name: deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse
    - dist: trusty/mongodb-org/stable
    - file: /etc/apt/sources.list.d/mongodb-org-3.0.list
    - keyid: 7F0CEB10
    - keyserver: keyserver.ubuntu.com

services-repos:
  pkg.installed:
    - pkgs:
      - mongodb-org

services-debs:
  pkg.installed:
    - sources:
      - rabbitmq-server: salt://packages/rabbitmq-server_3.5.6-1_all.deb

## Meteor
meteor:
  cmd.run:
    - user: relvao
    - name: "curl https://install.meteor.com/ | sh"
    - onlyif: 'test ! -e ~/.meteor'

# Redis
redis:
  cmd.run:
    - name: |
        cd /tmp
        wget http://download.redis.io/releases/redis-stable.tar.gz
        tar xzf redis-stable.tar.gz
        cd redis-stable
        make
        make test
        make install
        cd utils
        yes | sudo ./install_server.sh
      # does this yes thing hang the proces??
    - cwd: /tmp
    - shell: /bin/bash
    - unless: test -e /usr/local/bin/redis-server

# Oracle Java
# https://gist.github.com/renoirb/6722890
oracle-ppa:
  pkgrepo.managed:
    - humanname: WebUpd8 Oracle Java PPA repository
    - ppa: webupd8team/java

oracle-license-select:
  cmd.run:
    - unless: which java
    - name: '/bin/echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections'
    - require_in:
      - pkg: oracle-java7-installer
      - cmd: oracle-license-seen-lie

oracle-license-seen-lie:
  cmd.run:
    - name: '/bin/echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 seen true  | /usr/bin/debconf-set-selections'
    - require_in:
      - pkg: oracle-java7-installer

oracle-java7-installer:
  pkg:
    - installed
    - require:
      - pkgrepo: oracle-ppa

# Elastic Search - soem error!! needs looking into
elastic-search-2:
  pkg.installed:
    - sources:
      - atom: salt://packages/elasticsearch-2.0.0.deb

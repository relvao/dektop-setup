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
        yes | sudo ./install_server.sh
    # does this yes thing hang the proces??
    - cwd: /tmp
    - shell: /bin/bash
    - unless: test -e /usr/local/bin/redis-server

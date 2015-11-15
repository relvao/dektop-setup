## Nodenv
nodenv:
  git.latest:
    - name: git@github.com:OiNutter/nodenv.git
    - user: relvao #todo get current user var from jinja
    - rev: master
    - target: ~/.nodenv
    - identity: ~/.ssh/id_rsa
  # - require:
  # - pkg: git
nodenv-path:
  file.append:
    - name: ~/.bashrc
    - text: export PATH="$HOME/.nodenv/bin:$PATH"
nodenv-init:
  file.append:
    - name: ~/.bashrc
    - text: eval "$(nodenv init -)"
node-build:
  git.latest:
    - name: git@github.com:OiNutter/node-build.git
    - user: relvao #todo get current user var from jinja
    - rev: master
    - target: ~/.nodenv/plugins/node-build
    - identity: ~/.ssh/id_rsa
nodenv-install-v4:
  cmd.run:
    - user: relvao
    - name:  "export PATH=\"$HOME/.nodenv/bin:$PATH\"; eval \"$(nodenv init -)\"; nodenv install 4.2.2; nodenv global 4.2.2"
    - onlyif: 'test ! -e ~/.nodenv/versions/4.2.2'
nodenv-install-v012:
  cmd.run:
    - user: relvao
    - name: "export PATH=\"$HOME/.nodenv/bin:$PATH\"; eval \"$(nodenv init -)\"; nodenv install 0.12.7"
    - onlyif: 'test ! -e ~/.nodenv/versions/0.12.7'


## rbenv
rbenv:
  git.latest:
    - name: git@github.com:sstephenson/rbenv.git
    - user: relvao #todo get current user var from jinja
    - rev: master
    - target: ~/.rbenv
    - identity: ~/.ssh/id_rsa
rbenv-path:
  file.append:
    - name: ~/.bashrc
    - text: export PATH="$HOME/.rbenv/bin:$PATH"
rbenv-init:
  file.append:
    - name: ~/.bashrc
    - text: eval "$(rbenv init -)"
rbenv-build:
  git.latest:
    - name: git@github.com:sstephenson/ruby-build.git
    - user: relvao #todo get current user var from jinja
    - rev: master
    - target: ~/.rbenv/plugins/ruby-build
    - identity: ~/.ssh/id_rsa

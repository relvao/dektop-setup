spotify-client:
  pkgrepo.managed:
    - humanname: Spotify PPA
    - name: deb http://repository.spotify.com stable non-free
    - dist: stable
    - file: /etc/apt/sources.list.d/spotify.list
    - keyid: BBEBDCB318AD50EC6865090613B00F1FD2C19886
    - keyserver: keyserver.ubuntu.com

base-repos:
  pkg.installed:
    - pkgs:
      - htop
      - iotop
      - git
      - skype
      - chromium-browser
      - gitg
      - spotify-client
      - filezilla

base-debs:
  pkg.installed:
    - sources:
      - atom: salt://packages/atom-amd64.deb
      - robomongo: salt://packages/robomongo-0.8.5-x86_64.deb
      - slack-desktop: salt://packages/slack-desktop-1.2.6-amd64.deb


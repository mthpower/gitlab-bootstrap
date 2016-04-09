apt-transport-https:
  pkg.latest

curl -s https://packages.gitlab.com/gpg.key | apt-key add -:
  cmd.run:
    - unless: apt-key list | grep -i gitlab
    - require_in:
      - pkg: gitlab-ce

gitlab_apt:
  pkgrepo.managed:
    - humanname: Gitlab APT Repository
    - name: deb https://packages.gitlab.com/gitlab/gitlab-ce/debian/ jessie main
    - dist: jessie
    - file: /etc/apt/sources.list.d/gitlab.list
    - require:
      - pkg: apt-transport-https
    - require_in:
      - pkg: gitlab-ce
    - refresh: True

gitlab-ce:
  pkg.latest:
    - refresh: True

/etc/gitlab/gitlab.rb:
  file.managed:
    - source: salt://gitlab.rb
    - mode: 644
    - template: jinja

gitlab-ctl reconfigure 2>&1 | tee /tmp/gitlab-reconfigure:
  cmd.wait:
    - watch:
      - pkg: gitlab-ce
      - file: /etc/gitlab/gitlab.rb

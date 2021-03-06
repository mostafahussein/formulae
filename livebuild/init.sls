# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

live-build-package:
  pkg.installed:
    - pkgs:
      - live-build
{% set parent_directory = pget('livebuild:parent_directory', '') %}
{% if parent_directory %}
livebuild-parent-directory:
  file.directory:
    - name: {{ parent_directory }}
    - makedirs: true
      
{% set images = pget('livebuild:images', {}) %}
{% for imgname in images %}
{% set imgdir = '%s/%s' % (parent_directory, imgname) %}
{% set cfgdir = '%s/%s' % (imgdir, 'config') %}
livebuild-image-config-directory-{{ imgname }}:
  file.directory:
    - name: {{ cfgdir }}
    - makedirs: true
      
livebuild-execute-config-command-{{ imgname }}:
  cmd.run:
    - name: lb config
    - cwd: {{ imgdir }}
    - unless: test -h {{ cfgdir }}/hooks/0010-disable-kexec-tools.hook.chroot
      
{% for cfgfile in ['binary', 'bootstrap', 'build', 'chroot', 'common'] %}
livebuild-image-config-file-{{ imgname }}-{{ cfgfile }}:
  file.managed:
    - name: {{ cfgdir }}/{{ cfgfile }}
    - source: salt://livebuild/files/config/{{ cfgfile }}
    - template: jinja
    - context:
        imgname: {{ imgname }}
{% endfor %}

{% endfor %}

{% endif %}


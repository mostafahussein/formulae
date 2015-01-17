# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}
{% set default_realm = salt['grains.get']('domain').upper() %}
{% set mainrealm = pget('kerberos:mainrealm', default_realm) %}

include:
  - kerberos.client
  
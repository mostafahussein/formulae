#!jinja|yaml

{% from 'template/defaults.yaml' import rawmap_osfam with context %}
{% from 'template/defaults.yaml' import rawmap_os with context %}
{% set datamap = salt['grains.filter_by'](rawmap_osfam, merge=salt['grains.filter_by'](rawmap_os|default({}), grain='os', merge=salt['pillar.get']('template:lookup'))) %}

include: {{ datamap.sls_include|default([]) }}
extend: {{ datamap.sls_extend|default({}) }}

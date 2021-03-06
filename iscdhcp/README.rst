===============
iscdhcp-formula
===============

.. image:: https://api.flattr.com/button/flattr-badge-large.png
    :target: https://flattr.com/submit/auto?user_id=bechtoldt&url=https%3A%2F%2Fgithub.com%2Fbechtoldt%2Fiscdhcp-formula

Salt Stack Formula to set up and configure ISC DHCP, the Internet Systems Consortium DHCP Server

NOTICE BEFORE YOU USE
=====================

* This formula aims to follow the conventions and recommendations described at http://docs.saltstack.com/topics/conventions/formulas.html

TODO
====

None

Instructions
============

1. Add this repository as a `GitFS <http://docs.saltstack.com/topics/tutorials/gitfs.html>`_ backend in your Salt master config.

2. Configure your Pillar top file (``/srv/pillar/top.sls``), see pillar.example

3. Include this Formula within another Formula or simply define your needed states within the Salt top file (``/srv/salt/top.sls``).

Available states
================

.. contents::
    :local:

``iscdhcp``
-----------
Installs ISC DHCP server, sets main configuration, static host entries and subnets

Additional resources
====================

None

Formula Dependencies
====================

None

Contributions
=============

Contributions are always welcome. All development guidelines you have to know are

* write clean code (proper YAML+Jinja syntax, no trailing whitespaces, no empty lines with whitespaces, LF only)
* set sane default settings
* test your code
* update README.rst doc

Salt Compatibility
==================

Tested with:

* 2014.1.x

OS Compatibility
================

Tested with:

* GNU/ Linux Debian Wheezy
* BSD/ FreeBSD 10 stable

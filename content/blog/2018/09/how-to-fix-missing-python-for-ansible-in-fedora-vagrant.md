---
title: "How to fix missing Python for Ansible in Fedora Vagrant"
date: 2018-09-18
categories: 
  - "fedora"
  - "tech"
tags: 
  - "ansible"
  - "fedora-planet"
  - "vagrant"
  - "virtual-machines-vm"
---

Recently, I started to use Vagrant to test Ansible playbooks on Fedora machines. I'm using the Fedora 28 cloud base image. However, when I tried to provision my Vagrant box, I was warned the Python binary is missing.

```
$ vagrant provision
==> default: Running provisioner: ansible...
    default: Running ansible-playbook...

PLAY [all] *********************************************************************

TASK [Gathering Facts] *********************************************************
fatal: [default]: FAILED! => {"changed": false, "module_stderr": "Shared connection to 192.168.121.3 closed.\r\n", "module_stdout": "\r\n/bin/sh: /usr/bin/python: No such file or directory\r\n", "msg": "MODULE FAILURE", "rc": 127}
	to retry, use: --limit @playbook.retry
```

<!--more-->

## Problem: Python 3 by default

This error appears because Fedora 28 does not provide a Python 2 binary by default. Only Python 3 is provided on the base cloud image. I verified this by SSHing into the Vagrant box.

```
[jflory@vagrant-host vagrant]$ vagrant ssh
[vagrant@localhost ~]$ dnf list installed | grep -i python
```

Annoyingly, I must install Python 2 manually in the box each time it fails to provision. Surely, there is an easier way? Fortunately, StackOverflow came [to the rescue](https://stackoverflow.com/questions/47423488/vagrant-ansible-python3).

## Solution: `ansible.extra_vars`

It's possible to tell Vagrant where the Python binary is located. You can pass the path to the `python3` binary manually in your Vagrantfile.

```
# Provisioning configuration for Ansible.
config.vm.provision :ansible do |ansible|
  ansible.playbook = "playbook.yml"
  ansible.extra_vars = { ansible_python_interpreter:"/usr/bin/python3" }
end
```

Adding these changes to your Vagrantfile allows Ansible to successfully run on the Fedora Vagrant guest. Python is successfully located.

This is an annoying workaround, but it solves the issue and lets you successfully test and iterate changes on Fedora systems. Here's hoping the Fedora cloud image maintainers add a default binary for `/usr/bin/python` to point to `/usr/bin/python3` in the future.

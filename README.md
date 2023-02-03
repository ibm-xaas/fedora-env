[![pre-commit](https://github.com/ibm-xaas/fedora-env/actions/workflows/pre-commit.yaml/badge.svg?branch=main)](https://github.com/ibm-xaas/fedora-env/actions/workflows/pre-commit.yaml)
[![Docker](https://github.com/ibm-xaas/fedora-env/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/ibm-xaas/fedora-env/actions/workflows/docker-publish.yml)
[![@seungyeop's Holopin board](https://holopin.me/seungyeop)](https://holopin.io/@seungyeop)

# fedora-env
##
tested in macOS Ventura
Host:
- linux/amd64


## PREP

Please install the items below:
* docker
* docker-compose

## How to run
```
$ export IBMCLOUD_API_KEY=<YOUR IBMCLOUD_API_KEY>
$ docker-compose run fedora-env
05:04:47 fedora@453ec9ff84a1 fedora-env ±|main|→ cat /etc/os-release | grep PRETTY_NAME
PRETTY_NAME="Fedora Linux 38 (Container Image Prerelease)"
05:04:54 fedora@453ec9ff84a1 fedora-env ±|main|→
```
## Available Tools
* fedora (38) based
* python 3.10 or later and pyenv, then pipenv
* ansible latest
* qemu and qemu-tools
* ohmybash latest


```
ubuntu@ubuntu-jenkins:/voljenkins/test/github/fedora-env$ docker-compose run fedora-env
```

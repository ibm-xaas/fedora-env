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

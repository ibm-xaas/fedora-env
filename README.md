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
* ubuntu jammy (22.04) base
* terraform latest and tfenv
* terragrunt latest and tgenv
* packer latest and pkenv
* python 3.10 or later and pyenv, then pipenv
* ansible latest
* docker-ce and docker-compose
* ibmcloud cli latest
* qemu and qemu-tools
* golang 1.18 or later
* docker-in-docker
* packer plugins:
  * [packer-provisioner-goss](https://github.com/YaleUniversity/packer-provisioner-goss) : the details on [goss](https://github.com/aelsabbahy/goss)
  * [packer-provisioner-comment](https://github.com/ibm-xaas/packer-provisioner-comment)
* node lts and nvm
* cdktf-cli
* typescript latest
* awscli v2 latest
* azure cli latest
* pre-commit latest
* terraform-docs latest
* tfsec latest
* terraform-linters latest
* kubectl client and helm v3
* detect-secret latest
* consul and vault latest
* golint, goimports, gocyclo, pylint latest
* artifactory cli: jf v2 latest
* boundary latest
* butane latest
* shelltestrunner latest(apt)
* bats latest(apt)
* yarn latest
* rust latest
* tomlv latest
* ohmybash latestß


```
ubuntu@ubuntu-jenkins:/voljenkins/test/github/fedora-env$ docker-compose run fedora-env
```

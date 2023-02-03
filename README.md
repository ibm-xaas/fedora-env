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
05:04:54 fedora@453ec9ff84a1 fedora-env ±|main|→ git status
On branch readme_230203
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
05:05:55 fedora@453ec9ff84a1 fedora-env ±|readme_230203 ✗|→ git add *
05:05:58 fedora@453ec9ff84a1 fedora-env ±|readme_230203 ✗|→ git commit -m "README"
[INFO] Initializing environment for https://github.com/pre-commit/pre-commit-hooks.
[INFO] Initializing environment for https://github.com/ibm/detect-secrets.
[INFO] Initializing environment for https://github.com/dnephin/pre-commit-golang.
[INFO] Installing environment for https://github.com/pre-commit/pre-commit-hooks.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
[INFO] Installing environment for https://github.com/ibm/detect-secrets.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
trim trailing whitespace.................................................Passed
fix end of files.........................................................Passed
check yaml...........................................(no files to check)Skipped
check for added large files..............................................Passed
Detect secrets...........................................................Passed
go fmt...............................................(no files to check)Skipped
go lint..............................................(no files to check)Skipped
go imports...........................................(no files to check)Skipped
go-cyclo.............................................(no files to check)Skipped
validate toml........................................(no files to check)Skipped
Check files aren't using go's testing package........(no files to check)Skipped
go-unit-tests........................................(no files to check)Skipped
go-build.............................................(no files to check)Skipped
go-mod-tidy..........................................(no files to check)Skipped
[readme_230203 f83dd29] README
 1 file changed, 3 insertions(+)
05:06:38 fedora@453ec9ff84a1 fedora-env ±|readme_230203|→ git push
fatal: The current branch readme_230203 has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin readme_230203

To have this happen automatically for branches without a tracking
upstream, see 'push.autoSetupRemote' in 'git help config'.

05:06:42 fedora@453ec9ff84a1 fedora-env ±|readme_230203|→ git push --set-upstream origin readme_230203
Warning: Permanently added 'github.com' (ED25519) to the list of known hosts.
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 8 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 433 bytes | 21.00 KiB/s, done.
Total 3 (delta 2), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
remote: This repository moved. Please use the new location:
remote:   git@github.com:ibm-xaas/fedora-env.git
remote:
remote: Create a pull request for 'readme_230203' on GitHub by visiting:
remote:      https://github.com/ibm-xaas/fedora-env/pull/new/readme_230203
remote:
To github.com:syyang-in-cloud/fedora-env.git
 * [new branch]      readme_230203 -> readme_230203
branch 'readme_230203' set up to track 'origin/readme_230203'.
05:06:51 fedora@453ec9ff84a1 fedora-env ±|readme_230203|→
```
## Available Tools
* fedora (38) based
* python 3.10 or later and pyenv, then pipenv
* ansible latest
* qemu and qemu-tools
* ohmybash latest


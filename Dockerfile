FROM fedora:latest

ARG USERNAME=fedora
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME && \
	useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME

LABEL "maintainer"="SeungYeop Yang"
ENV WORKDIR=/fedora-env
WORKDIR $WORKDIR
ENV TZ America/Central
ENV LC_ALL "C.UTF-8"
ENV LANG "en_US.UTF-8"

RUN source /root/.bash_profile && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && chmod 0440 /etc/sudoers.d/$USERNAME

RUN set -ex dnf groupinstall -y @development-tools @development-libraries && \
	dnf -y --setopt=tsflags=nodocs install git mercurial wget jq
RUN set -ex && dnf -y --setopt=tsflags=nodocs install unzip iputils bind-utils qemu
RUN set -ex && dnf -y --setopt=tsflags=nodocs install cloud-utils graphviz expect nmap traceroute
RUN set -ex && dnf -y --setopt=tsflags=nodocs install pwgen tcpdump golang zlib-devel openssl openssl-devel python3-smart_open sqlite-devel libffi-devel bzip2-devel ncurses-devel readline-devel lzma-sdk-devel xz xz-libs xz-devel
RUN set -ex && dnf -y --setopt=tsflags=nodocs install dnf-plugins-core && dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
RUN set -ex && dnf -y --setopt=tsflags=nodocs install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# add the USERNAME into the group docker
RUN set -ex && usermod -aG docker $USERNAME && usermod -aG root $USERNAME
##		&& \
##	dnf clean all
USER $USERNAME
ENV HOME "/home/${USERNAME}"

# golang latest
RUN set -ex && \
	cd ${HOME} && \
	mkdir -p ${HOME}/go && \
	sudo chown ${USER_UID}:${USER_GID} ${HOME}/go && \
	echo 'export GOPATH=${HOME}/go' >> ~/.bashrc

# pyenv
ENV PYENV_ROOT "${HOME}/.pyenv"
ENV PATH "${HOME}/.pyenv/shims:${PYENV_ROOT}/bin:${PATH}"
RUN echo "export PYENV_ROOT=${HOME}/.pyenv" >> ~/.bashrc
RUN echo "export PATH=${HOME}/.pyenv/shims:${PYENV_ROOT}/bin:${PATH}" >> ~/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
###
### COPY requirements.txt ${HOME}/requirements.txt
###
RUN set -ex && \
	curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash && \
	pyenv install 3.10.5 && \
	pyenv global 3.10.5 && \
	pip install --upgrade pip && \
	##	# Ansible
	pip install ansible && \
	pip install pipenv && \
	pip install pre-commit

### go pre-commit hook
##RUN set -ex && \
##	cd ${HOME} && \
##	go install golang.org/x/lint/golint@latest && \
##	go install golang.org/x/tools/cmd/goimports@latest && \
##	go install github.com/fzipp/gocyclo/cmd/gocyclo@latest
##
### pylint
##RUN set -ex && \
##	cd ${HOME} && \
##	pip install --upgrade pylint
##
### artifactory cli: jf
##RUN set -ex && \
##	cd ${HOME} && \
##	curl -fL https://getcli.jfrog.io/v2-jf | sh && \
##	sudo mv jf /usr/local/bin/
##
### syft cli
##RUN set -ex && \
##	curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sudo sh -s -- -b /usr/local/bin && \
##	curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sudo sh -s -- -b /usr/local/bin
##
### butane for Fedora CoreOS
##RUN set -ex && \
##  cd ${HOME} && \
##	LATEST_BUTANE_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/coreos/butane/releases/latest | jq -r .tag_name) && \
##	BUTANE_BINARY="butane-$(uname -m)-unknown-linux-gnu" &&\
##	LATEST_BUTANE_ARTIFACT_URL="https://github.com/coreos/butane/releases/download/$LATEST_BUTANE_VERSION/$BUTANE_BINARY" && \
##	wget $LATEST_BUTANE_ARTIFACT_URL && \
##	sudo mv $BUTANE_BINARY /usr/local/bin/butane && \
##	chmod +x /usr/local/bin/butane
##
### rust
##RUN set -ex && \
##	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
##	. ~/.profile
##
### tomlv
##RUN set -ex && \
##	cd ${HOME} && \
##	go install github.com/BurntSushi/toml/cmd/tomlv@latest
##
# ohmybash
RUN set -ex && \
	cd ${HOME} && \
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

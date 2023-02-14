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
	dnf -y --setopt=tsflags=nodocs install git curl
#pyenv requirements
RUN set -ex && dnf -y --setopt=tsflags=nodocs install make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel gdbm-devel libnsl2-devel
RUN set -ex && dnf -y --setopt=tsflags=nodocs install dnf-plugins-core && dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
RUN set -ex && dnf -y --setopt=tsflags=nodocs install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose
# add the USERNAME into the group docker
RUN set -ex && usermod -aG docker $USERNAME && usermod -aG root $USERNAME
RUN set -ex && \
	dnf clean all
USER $USERNAME
ENV HOME "/home/${USERNAME}"

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
	curl https://pyenv.run | bash && \
	pyenv install 3.10 && \
	pyenv global 3.10 && \
	pip install --upgrade pip && \
	##	# Ansible
	pip install ansible && \
	pip install pipenv && \
	pip install pre-commit

# pylint
RUN set -ex && \
	cd ${HOME} && \
	pip install --upgrade pylint

# syft cli
RUN set -ex && \
	curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sudo sh -s -- -b /usr/local/bin && \
	curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sudo sh -s -- -b /usr/local/bin

# ohmybash
RUN set -ex && \
	cd ${HOME} && \
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

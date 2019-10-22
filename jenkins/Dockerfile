# serviceRoot: location of services folder mount (must match host file path)
ARG SERVICES_ROOT

FROM jenkinsci/blueocean

USER root

ENV DOCKER_CHANNEL stable
# ENV DOCKER_TLS_CERTDIR=/certs
ENV DOCKER_VERSION 19.03.4
ENV DOCKER_VERSION_MINOR 19.03

# Ensure Docker can write certs
# RUN mkdir ${DOCKER_TLS_CERTDIR} ${DOCKER_TLS_CERTDIR}/client && \
#   chmod 1777 ${DOCKER_TLS_CERTDIR} ${DOCKER_TLS_CERTDIR}/client

# Install Linux packages
RUN apk update && apk add --no-cache \
  ca-certificates \
  docker \
  gcc \
  jq \
  libc-dev \
  libffi-dev \
  make \
  openssl-dev \
  py-pip \
  python-dev

# set up nsswitch.conf for Go's "netgo" implementation (which Docker explicitly uses)
RUN [ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf

RUN set -eux; \
  \
  # Install docker
  if ! wget -O docker.tgz "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz"; then \
		echo >&2 "error: failed to download 'docker-${DOCKER_VERSION}' from '${DOCKER_CHANNEL}' for 'x86_64'"; \
		exit 1; \
	fi; \
  \
  tar --extract \
		--file docker.tgz \
		--strip-components 1 \
		--directory /usr/local/bin/ \
	; \
  rm docker.tgz; \
  \
	dockerd --version; \
	docker --version; \
  \
  # Install dind
	wget -O /usr/local/bin/dind "https://raw.githubusercontent.com/docker/docker/37498f009d8bf25fbb6199e8ccd34bed84f2874b/hack/dind"; \
	chmod +x /usr/local/bin/dind; \
  \
  # Install docker-compose
  pip install docker-compose; \
  \
  # Fetch docker and dockerd entrypoint scripts
  wget -O /usr/local/bin/docker-entrypoint.sh "https://raw.githubusercontent.com/docker-library/docker/master/${DOCKER_VERSION_MINOR}/docker-entrypoint.sh"; \
  wget -O /usr/local/bin/dockerd-entrypoint.sh "https://raw.githubusercontent.com/docker-library/docker/master/${DOCKER_VERSION_MINOR}/dind/dockerd-entrypoint.sh"; \
  chmod +x /usr/local/bin/docker-entrypoint.sh /usr/local/bin/dockerd-entrypoint.sh;

# Setup entrypoint script
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

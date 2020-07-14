FROM matthijsbos/nerdrage-base

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
   && apt-get -y upgrade \
   && apt-get -y install --no-install-recommends \
         git-all \
         ansible \
         openssh-client \
         sshpass \
         less \
         iproute2 \
         procps \
         curl \
         wget \
         unzip \
         nano \
         vim \
         jq \
         lsb-release \
         ca-certificates \
         apt-transport-https \
         dialog \
         gnupg \
         gnupg2 \
         libc6 \
         libgcc1 \
         libgssapi-krb5-2 \
         libicu[0-9][0-9] \
         liblttng-ust0 \
         libstdc++6 \
         zlib1g \
         locales \
         python3 \
         python3-pip \
         iputils-ping \
         net-tools \
         dnsutils \
   # Install Docker
   # https://github.com/microsoft/vscode-dev-containers/tree/master/containers/docker-from-docker
    && curl -fsSL https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/gpg | apt-key add - 2>/dev/null \
    && echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get install -y docker-ce-cli \
    # Install Docker Compose
    && LATEST_COMPOSE_VERSION=$(curl -sSL "https://api.github.com/repos/docker/compose/releases/latest" | grep -o -P '(?<="tag_name": ").+(?=")') \
    && curl -sSL "https://github.com/docker/compose/releases/download/${LATEST_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
   # Clean up
   && apt-get autoremove -y \
   && apt-get clean -y \
   && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog


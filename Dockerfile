FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
   && apt-get -y install --no-install-recommends \
         git-all \
         ansible \
         openssh-client \
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
         libc6 \
         libgcc1 \
         libgssapi-krb5-2 \
         libicu[0-9][0-9] \
         liblttng-ust0 \
         libstdc++6 \
         zlib1g \
         locales \
   # Clean up
   && apt-get autoremove -y \
   && apt-get clean -y \
   && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog


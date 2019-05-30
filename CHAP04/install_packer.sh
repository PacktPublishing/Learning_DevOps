#!/bin/bash

curl -Os https://releases.hashicorp.com/packer/1.4.0/packer_1.4.0_linux_amd64.zip \
&& curl -Os https://releases.hashicorp.com/packer/1.4.0/packer_1.4.0_SHA256SUMS \
&& curl https://keybase.io/hashicorp/pgp_keys.asc | gpg --import \
&& curl -Os https://releases.hashicorp.com/packer/1.4.0/packer_1.4.0_SHA256SUMS.sig \
&& gpg --verify packer_1.4.0_SHA256SUMS.sig packer_1.4.0_SHA256SUMS \
&& shasum -a 256 -c packer_1.4.0_SHA256SUMS 2>&1 | grep "1.4.0_linux_amd64.zip:\sOK" \
&& unzip -o packer_1.4.0_linux_amd64.zip -d /usr/local/bin
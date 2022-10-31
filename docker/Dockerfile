# A docker file for scripts/make/build-docker.sh.

FROM docker.io/library/node:18-alpine3.16@sha256:ccd756ecfba8272d6638b0a39f2a2f175b4a3c03f2f045be1c5a9d29914fbc0e as build_adwireguard

ARG BUILD_DATE
ARG VERSION
ARG VCS_REF

LABEL\
	maintainer="iganeshk <kumar@iganesh.com>" \
	org.opencontainers.image.authors="iganeshk" \
	org.opencontainers.image.created=$BUILD_DATE \
	org.opencontainers.image.description="AdWireGuard (AdGuard+WireGuard_ Dark Themed" \
	org.opencontainers.image.licenses="GPL-3.0" \
	org.opencontainers.image.revision=$VCS_REF \
	org.opencontainers.image.source="https://github.com/iganeshk/adwireguard" \
	org.opencontainers.image.title="AdWireGuard" \
	org.opencontainers.image.url="https://github.com/iganeshk/adwireguard" \
	org.opencontainers.image.vendor="iganeshk" \
	org.opencontainers.image.version=$VERSION

# Update certificates.
RUN apk --no-cache add ca-certificates libcap tzdata curl &&\
	mkdir -p /opt/adwireguard/conf /opt/adwireguard/work && \
	chown -R nobody: /opt/adwireguard

# # Copy wg-easy Web UI
# FROM docker.io/library/node:14-alpine@sha256:dc92f36e7cd917816fa2df041d4e9081453366381a00f40398d99e9392e78664 AS build_node_modules
# COPY wg-easy/src/ /opt/adwireguard/
# WORKDIR /opt/adwireguard
# RUN npm ci --production

# # Copy build result to a new image.
# # This saves a lot of disk space.
# FROM docker.io/library/node:14-alpine@sha256:dc92f36e7cd917816fa2df041d4e9081453366381a00f40398d99e9392e78664
# COPY --from=build_node_modules /opt/adwireguard /opt/adwireguard

# RUN mv /opt/adwireguard /node_modules

# # Enable this to run `npm run serve`
# RUN npm i -g nodemon

ARG WG_PATH
ARG DIST_DIR
ARG TARGETARCH
ARG TARGETOS
ARG TARGETVARIANT

COPY \
	#--chown=nobody:nogroup\
	./${DIST_DIR}/docker/AdGuardHome_${TARGETOS}_${TARGETARCH}_${TARGETVARIANT}\
	/opt/adwireguard/AdGuardHome

COPY \
	#--chown=nobody:nogroup\
	./${DIST_DIR}/docker/AdGuardHome_${TARGETOS}_${TARGETARCH}_${TARGETVARIANT}\
	/opt/adwireguard/AdGuardHome

# COPY --chown=nobody:nogroup\
# 	./wg-easy/src	/opt/adwireguard/

RUN mkdir /opt/adwireguard/wg-easy-dark &&\
  curl --location https://codeload.github.com/iganeshk/wg-easy-dark/tar.gz/refs/heads/production \
    | tar xz --directory /opt/adwireguard/wg-easy-dark --strip-components 1

RUN mv /opt/adwireguard/wg-easy-dark/src/* /opt/adwireguard/
RUN curl -o /opt/adwireguard/wg-easy-dark/entrypoint.sh https://raw.githubusercontent.com/iganeshk/AdGuardHome-Dark/dev-assets/docker/entrypoint.sh
COPY --chmod=0755 /opt/adwireguard/wg-easy-dark/entrypoint.sh /opt/adwireguard/entrypoint.sh
RUN rm -rf /opt/adwireguard/wg-easy-dark

WORKDIR /opt/adwireguard
RUN npm ci --production

FROM docker.io/library/node:18-alpine3.16@sha256:ccd756ecfba8272d6638b0a39f2a2f175b4a3c03f2f045be1c5a9d29914fbc0e

RUN apk --no-cache add ca-certificates tzdata \
  	wireguard-tools \
  	wget curl libcap dumb-init

COPY --from=build_adwireguard /opt/adwireguard /opt/adwireguard

RUN setcap 'cap_net_bind_service=+eip' /opt/adwireguard/AdGuardHome

RUN mv /opt/adwireguard/node_modules /node_modules
RUN ls -lsa /opt/adwireguard

# Enable this to run `npm run serve`
RUN npm i -g nodemon

# 53     : TCP, UDP : DNS
# 67     :      UDP : DHCP (server)
# 68     :      UDP : DHCP (client)
# 80     : TCP      : HTTP (main)
# 443    : TCP, UDP : HTTPS, DNS-over-HTTPS (incl. HTTP/3), DNSCrypt (main)
# 784    :      UDP : DNS-over-QUIC (experimental)
# 853    : TCP, UDP : DNS-over-TLS, DNS-over-QUIC
# 3000   : TCP, UDP : HTTP(S) (alt, incl. HTTP/3)
# 3001   : TCP, UDP : HTTP(S) (beta, incl. HTTP/3)
# 5443   : TCP, UDP : DNSCrypt (alt)
# 6060   : TCP      : HTTP (pprof)
# 8853   :      UDP : DNS-over-QUIC (experimental)
# Wireguard-Easy Ports
# 51820  :      UDP : WireGuard Port
# 51821  :      TCP : wg-easy WebUI Port
#
# TODO(a.garipov): Remove the old, non-standard 784 and 8853 ports for
# DNS-over-QUIC in a future release.
EXPOSE 53/tcp 53/udp 67/udp 68/udp 80/tcp 443/tcp 443/udp 784/udp\
	853/tcp 853/udp 3000/tcp 3000/udp 3001/tcp 3001/udp 5443/tcp\
	5443/udp 6060/tcp 8853/udp 51820/udp 51821/tcp

# Set Environment
ENV DEBUG=Server,AdWireGuard

WORKDIR /opt/adwireguard

# ENTRYPOINT ["/opt/adwireguard"]
# CMD [ \
# 	"--no-check-update", \
# 	"-c", "/opt/adwireguard/conf/AdGuardHome.yaml", \
# 	"-h", "0.0.0.0", \
# 	"-w", "/opt/adwireguard/work" \
# ]

# Run AdGuard and wg-easy
CMD ["ls", "-lsa ./"]

ENTRYPOINT ["/opt/cloudmapper/entrypoint.sh"]
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/opt/adwireguard/entrypoint.sh"]

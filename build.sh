set -xe

SINGBOX_VERSION=v1.3-rc2
SINGBOX_TAGS=with_wireguard,with_clash_api,with_gvisor,with_acme,with_quic

# build sing-box
git clone https://github.com/SagerNet/sing-box -b ${SINGBOX_VERSION} --depth 1
cd sing-box
export CGO_ENABLED=0

go build -trimpath -tags ${SINGBOX_TAGS} \
        -o /usr/bin/sing-box \
        -ldflags "-s -w -buildid=" \
        ./cmd/sing-box

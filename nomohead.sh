#!/bin/bash
# nomohead.sh
echo "Loading config..."

DIR="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

. "${DIR}/config.cfg"


IP="$(ip route get 8.8.8.8 | awk '{print $7}')"

echo "Dweeting IP... "
wget --post-data="IP=${IP}" http://dweet.io/dweet/for/${dweet_id_ip} -O /dev/null

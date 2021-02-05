#!/bin/bash
echo "Creating config file..."


echo "Enter the Dweet ID for IP Address: "
read d_id_ip

if [ "$dweet_id_tunnel" = "" ]; then
	d_id_tun=$d_id_ip
fi

printf "dweet_id_ip=${d_id_ip}\n" > config.cfg

echo "Adding Cron job..."

DIR="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"


command="${DIR}/nomohead.sh"
job="*/1 * * * * bash $command"
echo "Adding to cron - ${job}"
cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab -

echo "Done."

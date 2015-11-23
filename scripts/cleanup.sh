#!/bin/sh

echo "Running $0 ($(date))"

#for ifcfg in `ls /etc/sysconfig/network-scripts/ifcfg-* | grep -v ifcfg-lo` ; do
#  rm -f $ifcfg
#done

cat <<EOF | cat >> /etc/rc.d/rc.local
LANG=C
for con in \`nmcli -t -f uuid con\`; do
  if [ "\$con" != "" ]; then
    nmcli con del \$con
  fi
done
gwdev=\`nmcli dev | grep ethernet | egrep -v 'unmanaged' | head -n 1 | awk '{print \$1}'\`
if [ "\$gwdev" != "" ]; then
  nmcli c add type eth ifname \$gwdev con-name \$gwdev
fi
chmod -x /etc/rc.d/rc.local
EOF

chmod +x /etc/rc.d/rc.local

rm -f /etc/ssh/ssh_host_*
rm -f /var/lib/NetworkManager/*
rm -rf /tmp/*
yum -y clean all

echo "Done running $0 ($(date))"

#!/bin/sh

echo "Running $0 ($(date))"

useradd --system --create-home vagrant

#echo "vagrant" | passwd vagrant --stdin

# Add the insecure public key, so vagrant can login.
mkdir ~vagrant/.ssh/
chown vagrant:vagrant ~vagrant/.ssh/
chmod 0700 ~vagrant/.ssh/
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" > ~vagrant/.ssh/authorized_keys
chown vagrant:vagrant ~vagrant/.ssh/authorized_keys
chmod 0600 ~vagrant/.ssh/authorized_keys

echo 'vagrant             ALL=(ALL)   NOPASSWD: ALL' >> /etc/sudoers.d/vagrant
echo 'Defaults:vagrant    env_keep += SSH_AUTH_SOCK' >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

echo "Done running $0 ($(date))"
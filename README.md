# packer-CentOS6-Proxy
Packer files and scripts for CentOS6 on virtualbox with proxies.

If you need to use proxies in an environment with packer, use these files.
Please set a proxy for VirtualBox to use:

    export HTTP_PROXY=http://${username}:${password}@${proxy}:${port}

Also edit these files:

    http/ks.cfg
    scripts/yumproxy.sh

Modify the values "USERNAME", "PASSWORD", "PROXY" and "PORT".

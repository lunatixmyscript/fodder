#!/bin/bash
clear

cat >/etc/systemd/system/autolock-vmess.service<<-END
[Unit]
Description=Auto Lock VMess Accounts Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/usr/local/sbin/lockedvme'
Restart=always
RestartSec=10
StartLimitInterval=0

[Install]
WantedBy=multi-user.target
END
systemctl daemon-reload
systemctl enable autolock-vmess.service
systemctl start autolock-vmess.service
#systemctl status autolock-vmess.service
echo "*/1 * * * * root /usr/local/sbin/lockedvme" >>/etc/crontab
echo "*/1 * * * * root /usr/local/sbin/lockedvme" >>/etc/cron.d/lockvmess


cat >/etc/systemd/system/autolock-vless.service<<-END
[Unit]
Description=Auto Lock VLess Accounts Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/usr/local/sbin/lockedvle'
Restart=always
RestartSec=10
StartLimitInterval=0

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable autolock-vless.service
systemctl start autolock-vless.service
#systemctl status autolock-vless.service
echo "*/1 * * * * root /usr/local/sbin/lockedvle" >>/etc/crontab
echo "*/1 * * * * root /usr/local/sbin/lockedvle" >>/etc/cron.d/lockvless


cat >/etc/systemd/system/autolock-trojan.service<<-END
[Unit]
Description=Auto Lock Trojan Accounts Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/usr/local/sbin/lockedtro'
Restart=always
RestartSec=10
StartLimitInterval=0

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable autolock-trojan.service
systemctl start autolock-trojan.service
#systemctl status autolock-trojan.service
echo "*/1 * * * * root /usr/local/sbin/lockedtro" >>/etc/crontab
echo "*/1 * * * * root /usr/local/sbin/lockedtro" >>/etc/cron.d/locktrojan

cat >/etc/systemd/system/autolock-shadowsocks.service<<-END
[Unit]
Description=Auto Lock Shadowsocks Accounts Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/usr/local/sbin/lockedssr'
Restart=always
RestartSec=10
StartLimitInterval=0

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable autolock-shadowsocks.service
systemctl start autolock-shadowsocks.service
#systemctl status autolock-shadowsocks.service
echo "*/1 * * * * root /usr/local/sbin/lockedssr" >>/etc/crontab
echo "*/1 * * * * root /usr/local/sbin/lockedssr" >>/etc/cron.d/lockshadowsocks


# // SERVICE QUOTA VMESS
cat >/etc/systemd/system/quota-vmess.service<<-END
[Unit]
Description=Check and Manage Vmess Quota Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/usr/local/sbin/quotavme'
Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
END
systemctl daemon-reload
systemctl start quota-vmess.service
systemctl enable quota-vmess.service

echo "*/1 * * * * root /usr/local/sbin/quotavme" >>/etc/crontab
echo "*/1 * * * * root /usr/local/sbin/quotadvme" >>/etc/cron.d/quotavmess


# // SERVICE QUOTA VLESS
cat >/etc/systemd/system/quota-vless.service<<-END
[Unit]
Description=Check and Manage VLess Quota Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/usr/local/sbin/quotavle'
Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
END
systemctl daemon-reload
systemctl start quota-vless.service
systemctl enable quota-vless.service


echo "*/1 * * * * root /usr/local/sbin/quotavle" >>/etc/crontab
echo "*/1 * * * * root /usr/local/sbin/quotadvle" >>/etc/cron.d/quotavless


# // SERVICE QUOTA TROJAN
cat >/etc/systemd/system/quota-trojan.service<<-END
[Unit]
Description=Check and Manage Trojan Quota Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/usr/local/sbin/quotatro'
Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl start quota-trojan.service
systemctl enable quota-trojan.service

echo "*/1 * * * * root /usr/local/sbin/quotatro" >>/etc/crontab
echo "*/1 * * * * root /usr/local/sbin/quotatro" >>/etc/cron.d/quotatrojan

# // SERVICE QUOTA SSR
cat >/etc/systemd/system/quota-shadowsocks.service<<-END
[Unit]
Description=Check and Manage Vmess Quota Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/usr/local/sbin/quotassr'
Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl start quota-shadowsocks.service
systemctl enable quota-shadowsocks.service

echo "*/1 * * * * root /usr/local/sbin/quotassr" >>/etc/crontab
echo "*/1 * * * * root /usr/local/sbin/quotassr" >>/etc/cron.d/quotashadowsocks
cd


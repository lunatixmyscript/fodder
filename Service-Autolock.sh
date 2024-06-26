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
cd


#!/bin/bash

# // AUTOLOCK VMESS
cat >/etc/systemd/system/autolock-vmess.service << EOF
[Unit]
Description=Auto Lock VMESS
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/usr/local/sbin/lockedvme'
Restart=always
RestartSec=10
StartLimitInterval=0

[Install]
WantedBy=multi-user.target
EOF
# // AUTOLOCK VLESS
cat >/etc/systemd/system/autolock-vless.service << EOF
[Unit]
Description=Auto Lock VLESS
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/usr/local/sbin/lockedvle'
Restart=always
RestartSec=10
StartLimitInterval=0

[Install]
WantedBy=multi-user.target
EOF
# // AUTOLOCK TROJAN
cat >/etc/systemd/system/autolock-trjan.service << EOF
[Unit]
Description=Auto Lock TROJAN
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/usr/local/sbin/lockedtro'
Restart=always
RestartSec=10
StartLimitInterval=0

[Install]
WantedBy=multi-user.target
EOF
# // AUTOLOCK SHADOWSOCKS
cat >/etc/systemd/system/autolock-sdwsk.service << EOF
[Unit]
Description=Auto Lock SHADOWSOCKS
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/usr/local/sbin/lockedssr'
Restart=always
RestartSec=10
StartLimitInterval=0

[Install]
WantedBy=multi-user.target
EOF


# // service Kuota Xray
cat >/etc/systemd/system/ssr-quota.service << EOF
[Unit]
Description=Auto Kill Accounts Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/sbin/quotassr
Restart=always

[Install]
WantedBy=multi-user.target
EOF

cat >/etc/systemd/system/tro-quota.service << EOF
[Unit]
Description=Auto Kill Accounts Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/sbin/quotatro
Restart=always

[Install]
WantedBy=multi-user.target
EOF

cat >/etc/systemd/system/vme-quota.service << EOF
[Unit]
Description=Auto Kill Accounts Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/sbin/quotavle
Restart=always

[Install]
WantedBy=multi-user.target
EOF

cat >/etc/systemd/system/vle-quota.service << EOF
[Unit]
Description=Auto Kill Accounts Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/sbin/quotavme
Restart=always

[Install]
WantedBy=multi-user.target
EOF

chmod +x /etc/systemd/system/autolock-sdwsk.service
chmod +x /etc/systemd/system/autolock-vmess.service
chmod +x /etc/systemd/system/autolock-vless.service
chmod +x /etc/systemd/system/autolock-trjan.service
chmod +x /etc/systemd/system/quota-vle.service
chmod +x /etc/systemd/system/quota-vme.service
chmod +x /etc/systemd/system/quota-tro.service
chmod +x /etc/systemd/system/quota-ssr.service

clear
echo -e "\e[92;1m MEMUAT ULANG CONFIG SERVICE \e[0m"
systemctl daemon-reload
sleep 1
echo -e "\e[92;1m RESTART VMESS \e[0m"
systemctl restart autolock-vmess
sleep 1
echo -e "\e[92;1m RESTART VLESS \e[0m"
systemctl restart autolock-vless
sleep 1
echo -e "\e[92;1m RESTART SDWSOCK \e[0m"
systemctl restart autolock-sdwsk
sleep 1
echo -e "\e[92;1m RESTART TROJAN \e[0m"
systemctl restart autolock-trjan
sleep 1
echo -e "\e[92;1m RESTART TROJAN QUOTA\e[0m"
systemctl restart quota-tro
sleep 1
echo -e "\e[92;1m RESTART SDWSK QUOTA \e[0m"
systemctl restart quota-ssr
sleep 1
echo -e "\e[92;1m RESTART VMESS QUOTA \e[0m"
systemctl restart quota-vme
sleep 1
echo -e "\e[92;1m RESTART VLESS QUOTA \e[0m"
systemctl restart quota-vle
sleep 1

echo -e "\e[92;1m MENJALANKAN SERVICE VMESS \e[0m"
systemctl enable autolock-vmess
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE VLESS \e[0m"
systemctl enable autolock-vless
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE SDWSOK \e[0m"
systemctl enable autolock-sdwsk
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE TROJAN \e[0m"
systemctl enable autolock-trjan
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE TROJAN QUOTA \e[0m"
systemctl enable quota-tro
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE SDWSK QUOTA \e[0m"
systemctl enable quota-ssr
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE VLESS QUOTA \e[0m"
systemctl enable quota-vle
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE VMESS QUOTA \e[0m"
systemctl enable quota-vme
sleep 1
clear

[Unit]
Description=Auto Lock VMess Accounts Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/path/to/your/script.sh'
Restart=always
RestartSec=10
StartLimitInterval=0

[Install]
WantedBy=multi-user.target

# */ */ */ */ */ */ */ */ */
# */ Service Limit Quota \*

[Unit]
Description=Check and Manage Vmess Quota Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/usr/local/sbin/quotavme'
Restart=always
RestartSec=1 # akan di jalankan setiap 5 menit

[Install]
WantedBy=multi-user.target

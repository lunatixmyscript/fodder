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


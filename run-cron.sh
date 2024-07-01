#!/bin/bash
clear

export PATH=/luna/run
# // Menjalankan Pungsi Dengan Crontab
########################################
### MEMASANG PUNGSI AUTO KE CRONTAB ###
########################################
echo -e "Memasang Autobackup ke crontab"
# // Backup Setiap 60 Menit
echo "*/59 * * * *  root /usr/local/sbin/otwbackup" >>/etc/crontab
sleep 1
echo " Memasang limit ssh ke crontab "
# // Jalankan pungsi Limit-ssh setiap 1 menit
echo "*/1 * * * *  root /luna/run/limit-ssh" >>/etc/crontab
sleep 1
echo " Memasang limit quota ke crontab "
# // Jalankan Pungsi Limit Quota Setiap 1 Menit
echo "*/1 * * * *  root /luna/run/limit-quota" >>/etc/crontab
sleep 1
echo " Memasang xp ke crontab "
# // Delete Account Trial Yang Sudah Expired Setiap 30 Menit
echo "*/30 * * * *  root /usr/local/sbin/xp" >>/etc/crontab
echo "*/1 * * * * root /usr/local/sbin/delexp" >>/etc/crontab
sleep 1
echo " Memasang Autokill ssh ke crontab "
echo "*/1 * * * *  root /luna/run/kill-ssh $iplimit" >>/etc/cron.d
sleep 1
clear
########################################
#### MEMASANG PUNGSI AUTO KE CRON.D ####
########################################
echo -e "\e[92;1m Memasang autobackup ke cron.d \e[0m"
# // Menjalankan pungsi Dengan Cron.d
echo "*/40 * * * *  root /usr/local/sbin/otwbackup" >>/etc/cron.d/autobackup
sleep 1
echo "\e[92;1m Memasang limit ssh ke cron.d \e[0m"
# // Jalankan pungsi Limit-ssh setiap 1 menit
echo "*/1 * * * *  root /luna/run/limit-ssh" >>/etc/cron.d/limit-ssh
sleep 1
echo "\e[92;1m Memasang xp ke cron.d \e[0m"
# // Delete Account Trial Yang Sudah Expired Setiap 30 Menit
echo "*/1 * * * *  root /usr/local/sbin/xp" >>/etc/cron.d/xp
sleep 1
echo "\e[92;1m Memasang autokill ssh ke cron.d \e[0m"
echo "*/1 * * * *  root /luna/run/kill-ssh" >>/etc/cron.d/kill-ssh
echo "*/1 * * * * root /usr/local/sbin/delexp" >>/etc/cron.d/delexp
sleep 1
echo " Memasang autokill xray ke cron.d "
echo "*/1 * * * *  root /usr/local/sbin/lockedvme" >>/etc/cron.d/lockvm
echo "*/1 * * * *  root /usr/local/sbin/lockedvle" >>/etc/cron.d/lockvl
echo "*/1 * * * *  root /usr/local/sbin/lockedssr" >>/etc/cron.d/lockss
echo "*/1 * * * *  root /usr/local/sbin/lockedtro" >>/etc/cron.d/locktr
systemctl daemon-reload
systemctl restart cron
sleep 2
clear
echo -e "\e[93;1mIzinkan Service \e[0m"
# // Mengizinkan Service
systemctl enable xray
systemctl enable nginx
systemctl enable udp-mini
systemctl enable limit-ssh
systemctl enable limit
systemctl enable cron
systemctl enable noobzvpns
echo -e "\e[93;1mJalankan Service \e[0m"
# // Menjalankan Service
systemctl restart xray
systemctl restart nginx
systemctl restart limit-ssh
systemctl restart udp-mini
systemctl restart cron
systemctl restart noobzvpns
clear
echo -e "\e[92;1m Succesfully installed All Service \e[0m"
sleep 2
clear
cd

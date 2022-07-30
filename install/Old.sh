#!/bin/bash
clear
echo -e "\033[1;36mHARMONIZANDO SERVIDOR E PAINEL WEB PLAY CONECT ⚡\033[0m"
sleep 10
echo "America/Sao_Paulo" > /etc/timezone
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata
clear
echo -e "\033[1;36mPOR FAVOR AGUARDE...\033[0m"
sleep 3
if [[ -e "/opt/sshplus/licenca.txt" ]]; then
crack=$(cut -d"'" -f2 /opt/sshplus/licenca.txt) > /dev/null 2>&1
fi
sleep 1.5
echo -e "\033[1;36mINJETANDO LICENÇA...\033[0m"
sleep 2
rm *.zip > /dev/null 2>&1
apt install unzip -y > /dev/null 2>&1
wget https://github.com/playconect/Painel4g-2022/raw/main/sincal/plugin-sync64.zip > /dev/null 2>&1
wget https://github.com/playconect/Painel4g-2022/raw/main/sincal/plugin-syncarm64.zip > /dev/null 2>&1
cat sshplus.zip* > monitor.zip && zip -F monitor.zip > /dev/null 2>&1
rm -rf /opt/sshplus > /dev/null 2>&1
unzip monitor.zip -d  /opt/sshplus/ > /dev/null 2>&1
chmod -R 777 /opt/sshplus > /dev/null 2>&1
sleep 1
if [[ -e "/opt/sshplus/licenca.txt" ]]; then
sed -i "s;TWYT-PCIA-QF3G;$crack;g" /opt/sshplus/licenca.txt > /dev/null 2>&1
fi
clear
service ssh restart
echo -e "\033[1;32mFINALIZADO COM SUCESSO!\033[0m"
sleep 3
clear
echo -e "\033[1;36mCONCLUIDO❤️\n1️⃣ VISITE SEU PAINEL WEB PLAY CONECT ⚡.\n2️⃣ CRIE UM USUÁRIO.\nVOLTE NO PAINEL SSH E VERIFIQUE SE CRIOU.\033[0m"
sleep 10
cat /dev/null > ~/.bash_history && history -c && clear
rm *.html > /dev/null 2>&1
rm *.zip > /dev/null 2>&1
rm *.001 > /dev/null 2>&1
rm *.002 > /dev/null 2>&1
rm *.003 > /dev/null 2>&1
clear

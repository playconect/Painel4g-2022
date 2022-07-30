#!/bin/bash
clear
echo -e "\033[1;36mINSTALANDO O SINCRONIZADOR GESTOR-SSH\033[0m"
echo "America/Sao_Paulo" > /etc/timezone
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata
clear
echo -e "\033[1;36mPOR FAVOR AGUARDE...\033[0m"
sleep 1.5
echo -e "\033[1;36mVALIDANDO UMA LICENÇA...\033[0m"
rm *.sh* > /dev/null 2>&1
rm *.zip > /dev/null 2>&1
apt install unzip -y > /dev/null 2>&1
wget github.com/playconect/SincAI/raw/SincAI/sincarm/sincpainel.zip > /dev/null 2>&1
unzip sincpainel.zip > /dev/null 2>&1
chmod +x *sh > /dev/null 2>&1
service ssh restart
sleep 1
clear
echo -e "\n\033[1;32mCONCLUÍDO!\033[0m"
sleep 3
clear
echo -e "\033[1;36mENTRE NO PAINEL WEB E CRIE UMA CONTA SSH PRA VER SE ESTÁ TUDO OK!\033[0m"
sleep 5
cat /dev/null > ~/.bash_history && history -c && clear
rm *.html > /dev/null 2>&1
rm *.zip > /dev/null 2>&1
clear
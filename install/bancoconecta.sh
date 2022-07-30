#!/bin/bash
painel_rest () {
clear
mkdir /root/restaurar > /dev/null 2>&1
cd /root/restaurar || exit
wget https://github.com/playconect/Painel4g-2022/raw/main/install/conectabd.sql > /dev/null 2>&1
cd || exit
clear
echo ""
echo -e "\033[1;33mADICIONAR BANCO DE DADOS CONECTA AO PAINELWEB PLAY CONECT!\033[0m" 
echo ""
echo -ne "\033[1;32mDE UM ENTER PRA CONTINUAR...\033[0m"; read -r

[[ ! -e /var/www/html/pages/system/pass.php ]] && {
echo -e "\n\033[1;31mO PAINEL NÃO ESTÁ INSTALADO!\033[0m"
echo ""
sleep 3
echo -e "\033[1;31mRETORNANDO...\033[0m"
sleep 3
cat /dev/null > ~/.bash_history && history -c
clear
pweb
exit;
}

[[ ! -e /root/restaurar/conectabd.sql ]] && {
echo -e "\n\033[1;31mARQUIVO (\033[1;32mconectabd.sql\033[1;31m) NÃO ENCONTRADO!\033[0m"
echo ""
sleep 3
echo -e "\033[1;31mRETORNANDO...\033[0m"
sleep 3
cat /dev/null > ~/.bash_history && history -c
clear
pweb
exit;
}

passdb=$(cut -d"'" -f2 /var/www/html/pages/system/pass.php)
[[ $(mysql -h localhost -u root -p$passdb -e "show databases" | grep -wc sshplus) == '0' ]] && {
echo -e "\n\033[1;31mSEU PAINELWEB NÃO É COMPATÍVEL!\033[0m"
echo ""
sleep 3
echo -e "\033[1;31mRETORNANDO...\033[0m"
sleep 3
cat /dev/null > ~/.bash_history && history -c
clear
pweb
exit;
}

mysql -h localhost -u root -p$passdb --default_character_set utf8 sshplus < /root/restaurar/conectabd.sql
echo ""
echo -e "\n\033[1;32mDADOS ADICIONADO COM SUCESSO!\033[0m"
echo ""
sleep 3
echo -e "\033[1;31mRETORNANDO...\033[0m"
rm -rf /root/restaurar > /dev/null 2>&1
rm -rf bancoconecta* > /dev/null 2>&1
sleep 3
cat /dev/null > ~/.bash_history && history -c
clear
pweb
exit;
}
painel_rest

#!/bin/bash
function msg {
  BRAN='\033[1;37m' && RED='\e[31m' && GREEN='\e[32m' && YELLOW='\e[33m'
  BLUE='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' && BLACK='\e[1m' && SEMCOR='\e[0m'
  case $1 in
  -ne) cor="${RED}${BLACK}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -ama) cor="${YELLOW}${BLACK}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verm) cor="${YELLOW}${BLACK}[!] ${RED}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -azu) cor="${MAG}${BLACK}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verd) cor="${GREEN}${BLACK}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -bra) cor="${RED}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -nazu) cor="${COLOR[6]}${BLACK}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -gri) cor="\e[5m\033[1;100m" && echo -ne "${cor}${2}${SEMCOR}" ;;
  "-bar2" | "-bar") cor="${RED}————————————————————————————————————————————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  esac
}
function fun_bar {
  comando="$1"
  _=$(
    $comando >/dev/null 2>&1
  ) &
  >/dev/null
  pid=$!
  while [[ -d /proc/$pid ]]; do
    echo -ne " \033[1;33m["
    for ((i = 0; i < 20; i++)); do
      echo -ne "\033[1;31m##"
      sleep 0.5
    done
    echo -ne "\033[1;33m]"
    sleep 1s
    echo
    tput cuu1
    tput dl1
  done
  echo -e " \033[1;33m[\033[1;31m########################################\033[1;33m] - \033[1;32m100%\033[0m"
  sleep 1s
}
function print_center {
  if [[ -z $2 ]]; then
    text="$1"
  else
    col="$1"
    text="$2"
  fi

  while read line; do
    unset space
    x=$(((54 - ${#line}) / 2))
    for ((i = 0; i < $x; i++)); do
      space+=' '
    done
    space+="$line"
    if [[ -z $2 ]]; then
      msg -azu "$space"
    else
      msg "$col" "$space"
    fi
  done <<<$(echo -e "$text")
}

function title {
  clear
  msg -bar
  if [[ -z $2 ]]; then
    print_center -azu "$1"
  else
    print_center "$1" "$2"
  fi
  msg -bar
}

function stop_install {
  [[ ! -e /bin/pweb ]]  && {
    title "INSTALAÇÃO CANCELADA"
    clear
    exit;
 } || {
    title "INSTALAÇÃO CANCELADA"
    clear
    exit;
}
}

function os_system {
  system=$(cat -n /etc/issue | grep 1 | cut -d ' ' -f6,7,8 | sed 's/1//' | sed 's/      //')
  distro=$(echo "$system" | awk '{print $1}')

  case $distro in
  Debian) vercion=$(echo $system | awk '{print $3}' | cut -d '.' -f1) ;;
  Ubuntu) vercion=$(echo $system | awk '{print $2}' | cut -d '.' -f1,2) ;;
  esac
}
function dependencias {
  soft="python bc screen sshpass at nano unzip lsof netstat net-tools dos2unix nload jq curl figlet python3 python-pip cron"
   for i in $soft; do
    leng="${#i}"
    puntos=$((21 - $leng))
    pts="."
    for ((a = 0; a < $puntos; a++)); do
      pts+="."
    done
    msg -nazu "    INSTALANDO $i$(msg -ama "$pts")"
    if apt install $i -y &>/dev/null; then
      msg -verd " INSTALADO"
    else
      msg -verm2 " ERRO"
      sleep 2
      tput cuu1 && tput dl1
      print_center -ama "APLICANDO FIX A $i"
      dpkg --configure -a &>/dev/null
      sleep 2
      tput cuu1 && tput dl1

      msg -nazu "    INSTALANDO $i$(msg -ama "$pts")"
      if apt install $i -y &>/dev/null; then
        msg -verd " INSTALADO"
      else
        msg -verm2 " ERRO"
      fi
    fi
  done
}
function install_start {
if [[ -e "/var/www/html/conexao.php" ]]; then
clear
msg -bar
echo -e "\033[1;31mPAINEL JÁ INSTALDO EM SUA VPS, RECOMENDO\033[0m"
echo -e "\033[1;31mUMA FORMATAÇÃO PARA UMA NOVA INSTALÇÃO!\033[0m"
msg -bar
sleep 5
systemctl restart apache2 > /dev/null 2>&1
cat /dev/null > ~/.bash_history && history -c
rm /bin/ubuinst* > /dev/null 2>&1
exit;
else
echo -e 'by: @play_conect' >/usr/lib/telegram
echo -e "\e[1;97m           \e[5m\033[1;100m   INSTALADOR PAINEL WEB PLAY CONECT ⚡   \033[1;37m"
echo -e "\033[1;37m┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\033[0m"
echo -e "\033[1;37m┃[ ! ] ESTA INSTALAÇÃO FORNECE UM CONJUNTO DE FERRAMENTAS PARA\033[38;5;197m\033[38;5;197m\033[1;37m ┃\E[0m"
echo -e "\033[1;37m┃GESTÃO E IMPLEMENTAÇÃO VPN UTILIZANDO OS SERVIDORES UBUNTU 18\033[38;5;197m\033[38;5;197m\033[1;37m ┃\E[0m"
echo -e "\033[1;37m┃[ ! ] O USUÁRIO É RESPONSAVEL A QUALQUER DANO/MÁ UTILIZAÇÃO.\033[38;5;197m\033[38;5;197m\033[1;37m  ┃\E[0m"
echo -e "\033[1;37m┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\033[0m"
  msg -ne "┗━┫ VAMOS INICIAR? [S/N]: "
  read opcion
  [[ "$opcion" != @(s|S) ]] && stop_install
  clear && clear
  os_system
  msg -bar
  echo -e "\e[1;97m           \e[5m\033[1;100m   ATUALIZAÇÃO DO SISTEMA   \033[1;37m"
  msg -bar
  apt install software-properties-common
  apt update -y
  apt install figlet -y
  add-apt-repository ppa:ondrej/php -y
  apt update -y
  apt upgrade -y
  clear
  msg -bar
  echo -e "\e[1;97m\e[5m\033[1;100m   ATUALIZAÇÃO DO SISTEMA CONCLUÍDA COM SUCESSO!   \033[1;37m"
  msg -bar
  sleep 3
  clear
fi
}

function install_continue {
  os_system
  msg -bar
  echo -e "      \e[5m\033[1;100m   CONCLUINDO PACOTES PARA O SCRIPT   \033[1;37m"
  msg -bar
  print_center -ama "$distro $vercion"
  print_center -verd "INSTALANDO DEPENDÊNCIAS"
  msg -bar3
  dependencias
  msg -bar3
  print_center -azu "Removendo pacotes obsoletos"
  apt autoremove -y &>/dev/null
  sleep 2
  tput cuu1 && tput dl1
  msg -bar
  print_center -ama "Se algumas das dependências falharem!!!\nQuando terminar, você pode tentar instalar\no mesmo manualmente usando o seguinte comando\napt install nome_do_pacote"
  msg -bar
  read -t 60 -n 1 -rsp $'\033[1;39m       << Pressione enter para continuar >>\n'
}
function install_continue2 {
cd /bin || exit
rm pweb > /dev/null 2>&1
wget https://github.com/playconect/Painel4g-2022/raw/main/pweb/pweb > /dev/null 2>&1
chmod 777 pweb > /dev/null 2>&1
clear
[[ ! -d /bin/ppweb ]] && mkdir /bin/ppweb
cd /bin/ppweb || exit
rm *.sh ver* > /dev/null 2>&1
wget https://github.com/playconect/Painel4g-2022/raw/main/pweb/verifatt.sh > /dev/null 2>&1
wget https://github.com/playconect/Painel4g-2022/raw/main/pweb/verpweb > /dev/null 2>&1
wget https://github.com/playconect/Painel4g-2022/raw/main/pweb/verweb > /dev/null 2>&1
verp=$(sed -n '1 p' /bin/ppweb/verpweb| sed -e 's/[^0-9]//ig') &>/dev/null
verw=$(sed -n '1 p' /bin/ppweb/verweb| sed -e 's/[^0-9]//ig') &>/dev/null
echo -e "$verp" >/bin/ppweb/attpweb
echo -e "$verw" >/bin/ppweb/attweb
chmod 777 *.sh > /dev/null 2>&1
[[ ! -e /etc/autostart ]] && {
	echo '#!/bin/bash
clear
#INICIO AUTOMATICO' >/etc/autostart
	chmod +x /etc/autostart
}
}
function inst_base {
    echo -e "\n\033[1;36mINSTALANDO O APACHE2 \033[1;33mAGUARDE...\033[0m"
apt-get install apache2 -y > /dev/null 2>&1
apt-get install php5 libapache2-mod-php5 php5-mcrypt -y > /dev/null 2>&1
service apache2 restart > /dev/null 2>&1
echo -e "\n\033[1;36mINSTALANDO O MySQL \033[1;33mAGUARDE...\033[0m"
echo "debconf mysql-server/root_password password $pwdroot" | debconf-set-selections
echo "debconf mysql-server/root_password_again password $pwdroot" | debconf-set-selections
apt-get install mysql-server -y > /dev/null 2>&1
mysql_install_db > /dev/null 2>&1
(echo "$senha"; echo n; echo y; echo y; echo y; echo y)|mysql_secure_installation > /dev/null 2>&1
echo -e "\n\033[1;36mINSTALANDO O PHPMYADMIN \033[1;33mAGUARDE...\033[0m"
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $pwdroot" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $pwdroot" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $pwdroot" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
apt-get install phpmyadmin -y > /dev/null 2>&1
php5enmod mcrypt > /dev/null 2>&1
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
service apache2 restart > /dev/null 2>&1
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
apt-get install libssh2-1-dev libssh2-php -y > /dev/null 2>&1
if [ "$(php -m |grep ssh2)" = "ssh2" ]; then
  true
else
  clear
  echo -e "\033[1;31m ERRO CRÍTICO\033[0m"
  cat /dev/null > ~/.bash_history && history -c
rm /root/*.sh* > /dev/null 2>&1
clear
    exit
pweb
fi
apt-get install php5-curl > /dev/null 2>&1
service apache2 restart > /dev/null 2>&1
clear
echo ""
mysql -h localhost -u root -p$pwdroot -e "CREATE DATABASE net"
clear
echo -e "\033[1;36m FINALIZANDO INSTALAÇÃO\033[0m"
echo ""
echo -e "\033[1;33m AGUARDE..."
echo ""
clear
cd /var/www/html || exit
wget https://github.com/playconect/Painel4g-2022/raw/main/pweb/gestorweb4g.zip > /dev/null 2>&1
unzip gestorweb4g.zip > /dev/null 2>&1
rm -rf gestorweb4g.zip index.html > /dev/null 2>&1
(echo yes; echo yes; echo yes; echo yes) | composer install > /dev/null 2>&1
(echo yes; echo yes; echo yes; echo yes) | composer require phpseclib/phpseclib:~2.0 > /dev/null 2>&1
ln -s /usr/share/phpmyadmin/ /var/www/html > /dev/null 2>&1
chmod 777 -R /var/www/html > /dev/null 2>&1
sleep 1
if [[ -e "/var/www/html/conexao.php" ]]; then
sed -i "s;suasenha;$pwdroot;g" /var/www/html/pages/system/pass.php > /dev/null 2>&1
fi
sleep 1
cd || exit
wget https://github.com/playconect/Painel4g-2022/raw/main/pweb/net.sql > /dev/null 2>&1
sleep 1
if [[ -e "$HOME/net.sql" ]]; then
    mysql -h localhost -u root -p"$pwdroot" --default_character_set utf8 sshplus < net.sql
    rm /root/net.sql
else
    clear
    echo -e "\033[1;31m ERRO CRÍTICO\033[0m"
    sleep 2
    service apache2 restart > /dev/null 2>&1
cat /dev/null > ~/.bash_history && history -c
rm /root/*.sh* > /dev/null 2>&1
clear
    exit
pweb
fi
clear

function pconf { 
sed "s/suasenha/$pwdroot/" /var/www/html/conexao.php > /tmp/pass
mv /tmp/pass /var/www/html/conexao.php

}

function inst_db { 
sleep 5
if [[ -e "/var/www/html/net.sql" ]]; then
    mysql -h localhost -u root -p"$pwdroot" --default_character_set utf8 net < /var/www/html/net.sql > /dev/null 2>&1
    rm /var/www/html/net.sql > /dev/null 2>&1
else
    clear
    echo -e "\033[1;31m ERRO CRÍTICO\033[0m"
    sleep 2
    systemctl restart apache2 > /dev/null 2>&1
cat /dev/null > ~/.bash_history && history -c
rm /bin/ubuinst* > /dev/null 2>&1
clear
exit;
fi
clear
}

function cron_set {
crontab -l > cronset > /dev/null 2>&1
echo "
@reboot /etc/autostart
* * * * * /etc/autostart
*/5 * * * * /usr/bin/php /var/www/html/cron.php
" > cronset
crontab cronset && rm cronset > /dev/null 2>&1
}
function fun_swap {
			swapoff -a
            rm -rf /bin/ram.img > /dev/null 2>&1
            fallocate -l 4G /bin/ram.img > /dev/null 2>&1
            chmod 600 /bin/ram.img > /dev/null 2>&1
            mkswap /bin/ram.img > /dev/null 2>&1
            swapon /bin/ram.img > /dev/null 2>&1
            echo 50  > /proc/sys/vm/swappiness
            echo '/bin/ram.img none swap sw 0 0' | tee -a /etc/fstab > /dev/null 2>&1
            sleep 2
}
function tst_bkp {
cd || exit
sed -i "s;suasenha;$pwdroot;g" /var/www/html/lib/Database/conexao.php > /dev/null 2>&1
}
clear
install_start
IP=$(wget -qO- ipv4.icanhazip.com)
echo "America/Sao_Paulo" > /etc/timezone > /dev/null 2>&1
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime > /dev/null 2>&1
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1
clear
echo -e "\E[44;1;37m    INSTALANDO PAINEL WEB    \E[0m"
echo ""
echo -e "PLAY CONECT" | figlet
echo -e "                              \033[1;31mBy @play_conect\033[1;36m"
echo ""
chave=$(curl -sSL "https://github.com/playconect/Painel4g-2022/raw/main/pweb/chave") &>/dev/null

read -p "DIGITE A CHAVE DE INSTALAÇÃO: " key
    
         if [[ "$key" = "$chave" ]]
          then
               echo -e "[*] VALIDANDO A CHAVE DE INSTALAÇÃO"
                sleep 2
                echo $key > /bin/chave_inst
                echo -e "[*] CHAVE ACEITA"
                sleep 2
            else
            echo "[-] ESSA CHAVE NÃO É VÁLIDA!"
            sleep 3
            clear
            cat /dev/null > ~/.bash_history && history -c
            rm /bin/ubuinst* > /dev/null 2>&1
            exit;
          fi
install_continue
install_continue2
[[ $(grep -c "prohibit-password" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/prohibit-password/yes/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "without-password" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/without-password/yes/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "#PermitRootLogin" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/#PermitRootLogin/PermitRootLogin/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "PasswordAuthentication" /etc/ssh/sshd_config) = '0' ]] && {
	echo 'PasswordAuthentication yes' > /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "PasswordAuthentication no" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "#PasswordAuthentication no" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/#PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
} > /dev/null
echo ""
echo -e "PLAY CONECT" | figlet
echo -e "                              \033[1;31mBy @play_conect\033[1;36m"
echo ""
echo -e "\033[1;36mDEFINA UMA NOVA SENHA PARA\033[0m"
echo -e "\033[1;36mO USUÁRIO ROOT DA VPS E\033[0m"
echo -e "\033[1;36mPARA O USUÁRIO DO PHPMYADMIN!\033[0m"
echo ""
read -p "DIGITE UMA NOVA SENHA ROOT: " pwdroot
echo "root:$pwdroot" | chpasswd
echo -e "\n\033[1;36mINICIANDO INSTALAÇÃO \033[1;33mAGUARDE..."
sleep 3
clear
inst_base
phpmadm
pconf
inst_db
cron_set
fun_swap
tst_bkp
clear
sed -i "s;49875103u;$_key;g" /var/www/html/pages/system/config.php > /dev/null 2>&1
sed -i "s;localhost;$IP;g" /var/www/html/pages/system/config.php > /dev/null 2>&1
clear
echo -e "PAINELWEB PLAY CONECT" | figlet
echo -e "                              \033[1;31mBy @play_conect\033[1;36m"
echo ""
echo -e "\033[1;32mPAINEL INSTALADO COM SUCESSO!"
echo ""
echo -e "\033[1;36m SEU PAINEL:\033[1;37m http://$IP\033[0m"
echo -e "\033[1;36m USUÁRIO:\033[1;37m admin\033[0m"
echo -e "\033[1;36m SENHA:\033[1;37m admin\033[0m"
echo ""
echo -e "\033[1;36m PHPMYADMIN:\033[1;37m http://$IP/phpmyadmin\033[0m"
echo -e "\033[1;36m USUÁRIO:\033[1;37m root\033[0m"
echo -e "\033[1;36m SENHA:\033[1;37m $pwdroot\033[0m"
echo ""
echo -e "\033[1;31m \033[1;33mCOMANDO PRINCIPAL: \033[1;32mpweb\033[0m"
echo -e "\033[1;33m MAIS INFORMAÇÕES \033[1;31m(\033[1;36mTELEGRAM\033[1;31m): \033[1;37m@play_conect\033[0m"
echo ""
echo -ne "\n\033[1;31mENTER \033[1;33mpara retornar...\033[1;32m! \033[0m"; read
echo ""
sed -i "s;upload_max_filesize = 2M;upload_max_filesize = 64M;g" /etc/php5/apache2/php.ini > /dev/null 2>&1
sed -i "s;post_max_size = 8M;post_max_size = 64M;g" /etc/php5/apache2/php.ini > /dev/null 2>&1
echo -e "\033[1;36m REINICIANDO\033[1;37m EM 20 SEGUNDOS\033[0m"
sleep 20
shutdown -r now
cat /dev/null > ~/.bash_history && history -c
clear
exit

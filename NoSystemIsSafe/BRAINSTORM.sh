#!/bin/bash
# Author: @NoSystemBeSafe

function banner(){
    echo -e "${green}"
    echo -e "╭━╮1╭╮01╭━━━╮101011╭╮100101╭━━╮11╭━━━╮001╭━╮"
    echo -e "┃┃╰╮┃┃11┃╭━╮┃01100╭╯╰╮01101╰┫┣╯00┃╭━╮┃101┃╭╯"
    echo -e "┃╭╮╰╯┣━━┫╰━━┳╮1╭┳━┻╮╭╋━━┳╮╭╮┃┃╭━━┫╰━━┳━━┳╯╰┳━━╮"
    echo -e "┃┃╰╮┃┃╭╮┣━━╮┃┃0┃┃━━┫┃┃┃━┫╰╯┃┃┃┃━━╋━━╮┃╭╮┣╮╭┫┃━┫"
    echo -e "┃┃1┃┃┃╰╯┃╰━╯┃╰━╯┣━━┃╰┫┃━┫┃┃┣┫┣╋━━┃╰━╯┃╭╮┃┃┃┃┃━┫"
    echo -e "╰╯1╰━┻━━┻━━━┻━╮╭┻━━┻━┻━━┻┻┻┻━━┻━━┻━━━┻╯╰╯╰╯╰━━╯"
    echo -e "100100110100╭━╯┃         010                   "
    echo -e "001110101001╰━━╯         001                   "
    echo -e "                         111                   "
    echo -e "    ${red} @NoSystemBeSafe > V.2.6.8${end}\n"
}


PWD=$(pwd)
source ${PWD}/.tools/doc/var.sh


trap ctrl_c int
function ctrl_c(){
    clear
    banner
    echo -e "\n${green}[${white}${flicker}*${end}${green}] You are exiting to script. ${end}"
    sleep 3; clear
    exit 1
}



function server(){
    sleep 1
    echo -e "${green} Server: ${white} > 1${end} \n"
    echo -e "${green} Server: ${white} > 2${end} \n"
    echo -e "${green} Server: ${white} > 3${end} \n"
    read -p $'\033[1;32m Server \033[0;31m> \033[0m' server

    case $server in

        1) server=$server1
        fakemail
        ;;

        2) server=$server2
        fakemail
        ;;
        
        3) server=$server3
        fakemail
        ;;
        *)  clear; banner
            echo -e "\n${green}[${white}${flicker}*${end}${green}] You are exiting to script. ${end}"
            sleep 3; clear
        ;;

    esac
}


function fakemail(){

    clear; banner; sleep 1

    read -p $'\033[1;32mEMAIL SPOOFER \033[0;31m> \033[0m' faker
    clear; banner

    read -p $'\033[1;32mTARGET EMAIL \033[0;31m> \033[0m' fakiado
    clear; banner

    read -p $'\033[1;32mHEAD (title) \033[0;31m> \033[0m' title
    clear; banner

    read -p $'\033[1;32mBODY MESSAGE \033[0;31m> \033[0m' message
    sleep 1; clear; banner

    echo -e "${white} The mail will send be like: \n ${end}" 
    echo -e "${white} > Spoofer:${green} $faker ${end} \n"
    echo -e "${white} > Target:${green}  $fakiado ${end} \n"
    echo -e "${white} > Title:${green}  $title ${end} \n"
    echo -e "${white} > Message:${green}  $message ${end} \n"
    
    sleep 1

    read -p $'\033[1;32m Are you sure to send this mail? \033[0;31m[Y/N] > \033[0m' sure
    case $sure in

		y)
		curl --data "destinatario=$fakiado && asunto=$title && mensaje=$message && remitente=$faker" $server 
        clear
        banner
        sleep 1
        echo -e "\n${green}[${green}+${wgite}]${end} Sended. "
		;;	

		n)
			clear
            banner
            exit 1
        ;;

        *)  clear; banner
            echo -e "\n${green}[${white}${flicker}*${end}${green}] You are exiting to script. ${end}"
            sleep 3
        ;;

    esac

}

function main(){
    clear
    banner
    sleep 1
    server
}

main
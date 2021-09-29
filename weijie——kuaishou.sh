#!/bin/sh
clear
BLACK="\033[0;30m"  
DARK_GRAY="\033[1;30m"  
BLUE="\033[0;34m"  
LIGHT_BLUE="\033[1;34m"  
GREEN="\033[0;32m"  
LIGHT_GREEN="\033[1;32m"  
CYAN="\033[0;36m"  
LIGHT_CYAN="\033[1;36m"  
RED="\033[0;31m"  
LIGHT_RED="\033[1;31m"  
PURPLE="\033[0;35m"  
LIGHT_PURPLE="\033[1;35m"  
BROWN="\033[0;33m"  
YELLOW="\033[0;33m"  
LIGHT_GRAY="\033[0;37m"  
WHITE="\033[1;37m" 
NC="\033[0m"

echo ""
echo ""
echo -e "${LIGHT_CYAN}深圳IT
${NC} - IT支持、网络维护、Token领取、IT需求响应"
echo ""
     
echo -e "${LIGHT_BLUE} ____  _                ______                ___ _____ "
echo -e "${LIGHT_BLUE}/ ___|| |__   ___ _ __ |__  / |__   ___ _ __ |_ _|_   _|"
echo -e "${LIGHT_BLUE}\___ \| '_ \ / _ \ '_ \  / /| '_ \ / _ \ '_ \ | |  | |  "
echo -e "${LIGHT_BLUE} ___) | | | |  __/ | | |/ /_| | | |  __/ | | || |  | |  "
echo -e "${LIGHT_BLUE}|____/|_| |_|\___|_| |_/____|_| |_|\___|_| |_|___| |_|  "
                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                    
echo ""
echo -e "${BLACK}1、『${appBashName} 安装Kim"
echo -e "2、清除chrome缓存（会重启浏览器，且页面不会恢复）"
echo -e "3、重置DNS缓存"
echo -e "4、修复Kim白屏问题（修复完成后需要短信重新登录）"
echo -e "5、关闭VPN开机自启"
echo -e "6、卸载VPN附属插件（重新安装主程序）"
echo ""


##############VPN卸载重装################
Macos_vpn_reload(){
	vpn_address=https://static.yximgs.com/udata/pkg/IT/anyconnect-macos-4.9.00086-predeploy-k9.dmg
	vpn_file=/tmp/anyconnect-macos-4.9.00086-predeploy-k9.dmg
#检查VPN残留包并卸载
if [ -s "/Applications/Cisco/Uninstall AnyConnect.app" ];then
	echo -e "${RED}请点击Uninstall进行卸载，卸载完成后点击Quit退出即可"
	echo -e "请输入开机密码，输入完成后按下回车键（输入过程中密码是看不见的）${NC}"
	open /Applications/Cisco/Uninstall\ AnyConnect.app
else
	echo -e "请输入开机密码，输入完成后按下回车键（输入过程中密码是看不见的）${NC}"
 	sudo pkgutil --forget com.cisco.pkg.anyconnect.vpn >>/dev/null 2>&1
 	sudo pkgutil --forget com.cisco.pkg.anyconnect.fireamp >>/dev/null 2>&1
	sudo pkgutil --forget com.cisco.pkg.anyconnect.websecurity_v2 >>/dev/null 2>&1
	sudo pkgutil --forget com.cisco.pkg.anyconnect.nvm_v2 >>/dev/null 2>&1
	sudo pkgutil --forget com.cisco.pkg.anyconnect.umbrella >>/dev/null 2>&1
	sudo pkgutil --forget com.cisco.pkg.anyconnect.iseposture >>/dev/null 2>&1
	sudo pkgutil --forget com.cisco.pkg.anyconnect.posture >>/dev/null 2>&1
	echo "未找到卸载程序，正在强行卸载"
fi

if [ -s "/Applications/Cisco/Uninstall AnyConnect DART.app" ];then
	echo "请点击Uninstall进行卸载，卸载完成后点击Quit退出即可"
	open /Applications/Cisco/Uninstall\ AnyConnect\ DART.app
else
	sudo pkgutil --forget com.cisco.pkg.anyconnect.dart >>/dev/null 2>&1
	echo "未找到附属插件的卸载程序，正在强行卸载"
fi

#VPN安装
while [[ ture ]]; do
	count=`ps -ef | grep AnyConnect | wc -l`
	if [[ 1 -eq $count ]]; then
		if [ -f "/tmp/anyconnect-macos-4.9.00086-predeploy-k9.dmg" ];then
			echo ""
			open /tmp/anyconnect-macos-4.9.00086-predeploy-k9.dmg
			sleep 6
			echo -e "${RED}请点击继续，只选择“VPN”主程序，其他附属插件取消勾选！${BLACK}"
			open /Volumes/AnyConnect\ 4.9.00086/AnyConnect.pkg
			while [[ ture ]]; do
				ins_count=`ps -ef | grep Installer | wc -l`
				if [[ 1 -eq $ins_count ]]; then
					umount /Volumes/AnyConnect\ 4.9.00086
					break;
				fi
			done
		else
			echo ""
			echo -e "${LIGHT_GREEN}正在下载中，请稍等！！!\033[0m"
			curl -o $vpn_file $vpn_address
			open /tmp/anyconnect-macos-4.9.00086-predeploy-k9.dmg
			sleep 5
			echo -e "${RED}请点击继续，只选择“VPN”主程序，其他附属插件取消勾选！${BLACK}"
			open /Volumes/AnyConnect\ 4.9.00086/AnyConnect.pkg
			while [[ ture ]]; do
				ins_count=`ps -ef | grep Installer | wc -l`
				if [[ 1 -eq $ins_count ]]; then
					umount /Volumes/AnyConnect\ 4.9.00086
					break;
				fi
			done
		fi
	break;
	fi
done
}

##############VPN卸载重装################
chrome_clear(){
	killall Google' 'Chrome
	rm -rf ~/Library/Caches/Google/ >>/dev/null 2>&1
	sleep 2
	open /Applications/Google\ Chrome.app

}
##############选项################
echo -e "${RED}请选择您要修复的问题(操作不可逆，请谨慎选择):${BLACK}"
read option
case $option in
	1 )
		echo -e "${YELLOW}请输入开机密码，输入完成后按下回车键（输入过程中密码是看不见的）${NC}"
  		sudo spctl --master-disable;;
	2 )
		chrome_clear;;
	3 )
		echo -e "${YELLOW}请输入开机密码，输入完成后按下回车键（输入过程中密码是看不见的）${NC}"
		sudo killall -HUP mDNSResponder;;
	4 )	
		rm -rf ~/Library/Application\ Support/Kim\ \(Kim\);;
	5 )	
		echo -e "${YELLOW}请输入开机密码，输入完成后按下回车键（输入过程中密码是看不见的）${NC}"
		sudo rm -rf /Library/LaunchAgents/com.cisco* && sudo rm -rf /Library/LaunchDaemons/com.cisco* && sudo rm -rf ~/Library/LaunchAgents/com.cisco*;;
	6 )	
		Macos_vpn_reload
		echo "";;

	* )
		echo -e "输入有误，请直接输入数字哦！"
		echo -e "${RED}请关闭此窗口，重新打开"
		exit 0;;
esac
echo ""
echo ""
umount /Volumes/IT_Tools >>/dev/null 2>&1
rm -rf /tmp/anyconnect-macos-4.9.00086-predeploy-k9.dmg
echo -e "执行结果：${GREEN}修复成功！如有其他IT问题可在Kim上联系深圳IT小能手！${NC}"
echo -e "本窗口可以关闭啦！按command+w可快速关闭"



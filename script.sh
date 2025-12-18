#!/bin/bash

menu(){

  clear
  echo "***"
  echo "Automated System Update Script"
  echo "***"
  echo "1. Update Package Info (apt-get update)"
  echo "2. Package Upgrade (apt-get upgrade)"
  echo "3. System Upgrade (apt-get dist-upgrade)"
  echo "4. Remove Old Dependencies (apt-get autoremove)"
  echo "5. Clean Cache (apt-get clean)"
  echo "***"
  echo "A. Full System Update"
  echo "L. Update Journal"
  echo "Q. Quit"
  echo "***"
  read -rp "Enter Your Choice: " CHOISE

}


process(){
  case "$CHOICE" in
	1) apt_update ;;
	2) apt_upgrade ;;
	3) apt_dist_upgrade ;;
	4) apt_autoremove  ;;
	5) apt_clean ;;
	A|a) apt_full ;;
	L|l) apt_log ;;
	Q|q) exit 0 ;;
	*) echo "Wrong Choice. Please, Try Again."
	   sleep 2
           ;;
  esac
}

LOG_FILE="/var/log/automated.log"

log_file(){
  echo "$(date) - $1" | tee -a "$LOG_FILE"
}

apt_update(){
  log_file "Step 1: Update Package Database Started"
  apt-get update
  log_file "Step 1: Update Package Database Finished"
}

apt_upgrade(){
  log_file "Step 2: Package Upgrade Started"
  apt-get upgrade -y
  log_file "Step 2: Package Upgrade Finished"
}

apt_dist_upgrade(){
  log_file "Step 3: System Upgrade (dist-upgrade) Started"
  apt-get dist-upgrade -y
  log_file "Step 3: System Upgrade (dist-upgrade) Finished"
}

apt_autoremove(){
  log_file "Step 4: Remove Old Dependencies Started"
  apt-get autoremove -y
  log_file "Step 4: Remove Old Dependencies Finished"
}

apt_clean(){
  log_file "Step 5: Clean Cache Started"
  apt-get clean
  log_file "Step 5: Clean Cache Finished"
}

apt_full(){
  log_file "Full System Update Started"
  apt-get update
  apt-get upgrade -y
  apt-get dist-upgrade -y
  apt-get autoremove -y
  apt-get clean
  log_file "Full System Update Finished"
}

apt_log(){
  echo "--- Update Journal ---"
  cat "$LOG_FILE"
  echo "----------------------"
}

while true; do 
  menu
  process
done

# Monitoring-using-bash
Monitor CPU percentage of an ec2 instance every minute and send top 5 process names to a email if CPU usage exceeds 80%

#Setting up the ubuntu environment.
•	sudo apt-get update
•	sudo apt-get install sysstat
•	sudo apt-get install ssmtp

vi /etc/ssmtp/ssmtp.conf
#Paste these below followings.
root=your_email@gmail.com
mailhub=smtp.gmail.com:465
FromLineOverride=YES
AuthUser=your_email@gmail.com
AuthPass=your_password
UseTLS=YES

#Test it with below simple echo cmd
echo “your text” | ssmtp your_receiver@gmail.com

Then , login with root and Create folder and file
sudo su
mkdir SCRIPTS
touch CpuAlert
chmod +x CpuAlert.sh
vi CpuAlert.sh

Copy paste the CpuAlert.sh files from this repo and replace your desired destination mail ID and Percentage threshold.

#To execute

sh -x CpuAlert.sh

Now , whenever the file is executed, it will check the CPU usage and if it exceeds more than 80, it will send the top 5 process to the destination mail through SMTP.

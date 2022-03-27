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


Now, we have to enable CRONTAB for sheduling to run the command for every 1 minute.

crontab -e

*/1 * * * * /bin/bash /home/ubuntu/SCRIPTS/CpuAlert.sh

#Now , we have to do the stress testing for find out it actually works. 

It can be done by using this cmd.

dd if=/dev/zero of=/dev/null

/dev/zero provides an endless stream of zero bytes when read. This function is provided by the kernel and does not require allocating memory. All writes to /dev/null are dropped silently.
As a result, when you perform the dd, the system generates 500 megabytes in zero bytes that simply get discarded. Except for a temporary buffer, no data are stored before, during, or after this operation.
The speed of the transfer from /dev/zero to /dev/null is determined primarily by the speed of your processor and relevant system calls. (In your case, the buffer is 500 MB large, and hence the operation tests the speed of your memory as well.)


So the CPU will be near 99.99 %.

The mail will be sent from the machine to the destination machine.



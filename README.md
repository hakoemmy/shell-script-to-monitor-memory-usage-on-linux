# shell-script-to-monitor-memory-usage-on-linux
> Monitor CPU utilization, Memory utilization, swap utilization and disk space utilization when they reach the threshold, send an email to the devOps engineer
# HOW TO SET IT UP?

- Run ```sudo nano check-vps-memory-usage.sh``` in terminal and paste in the shell script code
- Run ```chmod 755 check-vps-memory-usage.sh ``` to give a full permissions to the shell script
- To execute it, run ``` ./check-vps-memory-usage.sh``` in terminal. When the threshold that you set in code has reached, you should get an email. For my side I did set 45% of the usage, you can tweak it to your needs.
- Instead of doing this manually, we can automate this via crontab: Run ``` crontab -e``` and then put in this line to run cronjob every five minutes: ``` */5 * * * * /bin/bash check-vps-memory-usage.sh```

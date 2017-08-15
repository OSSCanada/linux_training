## Commands

- ```top```
- ```lsof``` list open files or ports
- ```kill```
- ```pkill -u -G -P``
- ```pgrep -l -u```
- ```netstat```
- ```ps aux```

## Service Run Levels

- ```update-rc.d```
- ```/etc/init.d```
- ```/etc/rc[0-6].d```

## Crontab (cron jobs)
- crontab -l
- crontab -e
- crontab -r
- sudo cronttab -u username -l

### Crontab format
```
minute hour dayOfMonth month dayOfWeek
15 6 2 1 * /home/raykao/backup.sh
```
dayOfMonth can be any single number 1-31, list of number 1,2,3,10,31 or range 1-10
Month can be a number 1-12 (list or range) OR name Jan,Feb (list of names)
dayOfWeek number 0-7 (Sunday is 0 or 7), or name Mon,Tue etc. or in a list

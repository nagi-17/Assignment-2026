# Bandit Wargame

## Level 0
connect to server using ssh <br>
read readme file

## Level 1
tweak the cat syntax to check the content of dashed file <br>
Cmd used : cat ./-

## Level 2
In general, filename does not contain spaces. So to open/create/read files which include spaces in their filename we can use escape space cha and tweak the cat command as the filename also starts with dash <br> We can also use ' ' or " ". <br>
Cmd used : cat ./"--spaces in this filename--"
 
## Level 3
Use find command to find the hidden file. 

## Level 4
Use file command to identify which file has the pwd, then use cat cmd to read the pwd. <br>
Cmd used : file ./-file\*

## Level 5
use find -size n command to find the path of file with size 1033 bytes <br>
Cmd used : find -size 1033c

## Level 6
Go to root dir and use find cmd with -user, -group and -size <br>
Cmd used : find -user bandit7 -group bandit6 -size 33c

## Level 7
Use grep cmd to find millionth in data.txt <br>
Cmd used : grep "millionth" ./data.txt

## Level 8
First sort the file and then use uniq -u cmd to get the password.

## Level 9
Use strings cmd and use it as input to provide it to grep cmd. <br>
Cmd used : strings ./data.txt | grep "=="

## Level 10
Use base64 -d cmd to decode the pwd which was encoded in the part of the file which was stored in base64 format.

## Level 11
Read the file and directly decode thr rot13 text.

## Level 12
Create temp dir, copy file in this temp dir, change the format in which this file is stored.
Run xxd cmd to change the hexdump file into compressed file - store the output in an output file, unzip this file, check the format of this file using file cmd.
If the output file is still compressed, then do the unzip step again till an ASCII text format output file is generated. 

## Level 13
Using ssh -i cmd, login into next level store the ssh key on your local machine <br>
Cmd used : ssh -i ./bandit13\_key.private bandit14@bandit.labs.overthewire.org -p 2220

## Level 14
See password of prev level from the file (path mentioned in prev level info page), now use nc command to connect to localhost port 30000 <br>
Cmd used : nc localhost 30000

## Level 15
Use cmd : openssl s\_client -connect localhost:30001

## Level 16
Use nmap to scan ports - cmd used : nmap -p31000-32000 localhost, check the manually the ports which are outputed using openssl cmd : openssl s\_client -ign\_eof localhost:port


## Level 17
Direclty use the cmd : diff --normal passwords.new passwords.old

## Level 18
Directly use the cmd : scp -P 2220 bandit18@bandit.labs.overthewire.org:/home/bandit18/readme to downlad the file ( this allows us to download the file without us entering the server )

## Level 19
Use cmd : ./bandit20-do cat /etc/bandit\_pass/bandit20 to get the pwd.

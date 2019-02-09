#!usr/bin/python
import paramiko

serwerip="127.0.0.1"
user="tester"
haslo="tester"

serwer=paramiko.SSHClient()
serwer.set_missing_host_key_policy(paramiko.AutoAddPolicy())
serwer.connect(serwerip, username=user, password=haslo)
a,b,c=serwer.exec_command("cat /etc/passwd")
wynik=b.read()
print wynik
if "myownuser" in wynik:
    print "jest myownuser"
else:
    print "nie ma my ownuser"
if "tester" in wynik:
    print "jest tester"
else:
    print"nie ma tester"

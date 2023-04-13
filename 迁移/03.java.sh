
a=('xc-analyze','xc-auth','xc-file','xc-gen','xc-job','xc-logs')
for i in $a ; do
    scp -r -P 50221 /home/ns-coastal/coastal_be/$i root@44.39.19.14:/home/ns-coastal/coastal_be/$i
done

ftpput -u root -p xxx -P 50221 44.39.19.14


find /home/ns-coastal/coastal_be -name *.yml

grep -rl server-addr /home/ns-coastal/coastal_be
grep -r server-addr /home/ns-coastal/coastal_be
grep -r server-addr `find /home/ns-coastal/coastal_be -name *.yml`

grep -r server-addr  *
grep -r server-addr  *yml

grep -Pnr "\d{3}" `find | grep -P ".(xml)"`
grep -E "aa|bb" filename
awk "/aa|bb" filename


#sed a c i d s p
sed -n '/ser/p' run.sh
sed -i 's/ser/p/' run.sh

sed -n '/server-addr: 44.39.247.248:8848/p' `find /home/ns-coastal/coastal_be -name *.yml`

sed -i 's/server-addr: 44.39.247.248:8848/server-addr: 44.39.19.14:8878/' `find /home/ns-coastal/coastal_be -name *.yml`

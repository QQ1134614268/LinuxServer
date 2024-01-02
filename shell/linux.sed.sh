
#sed a c i d s p
sed -n '/ser/p' run.sh
sed -i 's/ser/p/' run.sh

sed -n '/server-addr: 44.39.247.248:8848/p' `find /home/ns-coastal/coastal_be -name '*.yml'`

sed -i 's/server-addr: 44.39.247.248:8848/server-addr: 44.39.19.14:8878/' `find /home/ns-coastal/coastal_be -name '*.yml'`

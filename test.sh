#Don't Crush my Castle Testing script v0.3
#by demiurgosoft
#This script will compile,test and clean Don't Crush My Castle
echo 'Compiling and testing (may take a while)';
#COMPILE TEST
make test >/dev/null;
#TEST 1
./bin/test_utils;
RES1=$?
#TEST 2
./bin/test_anim;
RES2=$?
./bin/test_map;
RES3=$?
./bin/test_enemy;
RES4=$?
echo 'Cleaning binaries and .o files'
#CLEAN DIRECTORIES
make clean >/dev/null;
RES=$(($RES1 || $RES2 || $RES3 || $RES4))
if test $RES -eq 0
	then echo 'FINAL RESULT - OK'
else
	echo 'FINAL RESULT - FAIL'
fi
exit $RES
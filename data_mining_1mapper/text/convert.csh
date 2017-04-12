#!/bin/csh
if ($#argv < 1) then
    echo "Usage: convert.csh <filename.txt>"
    exit
endif
setenv NAME `echo $1 | awk -F\. '{print $1}'`
#cp $NAME.txt $NAME.txt.temp
sed 's/[^A-Za-z0-9]/ /g' $NAME.txt > $NAME.txt.temp
xxd -p -c 1000000 $NAME.txt.temp > $NAME.hex
rm $NAME.txt.temp

echo "converted $NAME.txt to $NAME.hex"
echo "filtering out newlines and spaces"
sed -i 's/0a//g' $NAME.hex # remove newlines
# filtering done, split on spaces and remove empty lines
sed -i 's/20/\n/g' $NAME.hex # remove spaces, split on spaces
sed -i '/^$/d' $NAME.hex # remove the empty lines

./tails.pl # generate tail data, format lines in hex file to 64 bit padded with spaces

awk '{printf "%-16s\n", $0}' $NAME.hex > $NAME.hex.temp # pad with spaces
mv $NAME.hex.temp $NAME.hex
sed -i 's/  /20/g' $NAME.hex # change those spaces into hex '20'

exit


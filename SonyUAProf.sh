#!/bin/bash
# Returns user-agent profile by Sony mobile phone model name
# Find source code here: https://github.com/kodopik/SonyUAProf

HELP_LINES="-h|--help"
if [[ ${1} =~ ${HELP_LINES} ]] ;
then
	echo "Returns user-agent profile by Sony mobile phone model name"
	echo "Usage: ./SonyUAProf.sh [MODELNAME]"
	echo "e.g. ./SonyUAProf.sh LT22i"
	exit 0
fi

if [[ -z ${1} ]] ;
then
	echo -n "Model (e.g. LT22i): "
	read l
fi

echo "finding..."

i=1
while [[ i -lt 10 ]] ;
do
  j=1

  while [[ j -lt 10 ]] ;
  do
    url="http://wap.sonymobile.com/UAprof/${l}R${j}0${i}.xml"

    if wget -q "$url" -O /dev/null ;
    then
      echo "$url"
      exit 0
    fi

    let j++
  done

  let i++
done

echo "User-agen profile has not been found"

exit 0

#!/bin/bash
# По заданному имени модели выдаёт профиль юзер-агента

echo -n "Model (e.g. LT22i): "
read l

i=1
while [[ i -lt 10 ]]
do
  j=1

  while [[ j -lt 10 ]]
  do
    url="http://wap.sonymobile.com/UAprof/${l}R${j}0${i}.xml"

    if wget -q "$url" -O /dev/null
    then
      echo "$url"
      exit 0
    fi

    let j++
  done

  let i++
done

exit 0


#!/bin/bash
###### script that validate input is float or not
##parameters
#	1st parameter:number to validate
##Exit codes:
##      0 : Normal terminated                                                   
##      1 : not enough parameters 
##	2 : not a floating number
##	3 : division by zero
[ ${#} -ne 2 ] && echo "not enough parameters" && exit 1
[ $( echo ${1} | grep -c "^[+-]\?[0-9]*\.[0-9]\+$" ) -ne 1 ] && echo "${1} not a floating number" && exit 2
[ $( echo ${2} | grep -c "^[+-]\?[0-9]*\.[0-9]\+$" ) -ne 1 ] && echo "${2} not a floating number" && exit 2
#[ ${2} == 0 || ${2} == "0.0" ] && echo "division by zero" && exit 3
[ $(echo "${2} == 0" | bc) -eq 1 ] && echo "division by zero" && exit 3


NUM1=${1}
NUM2=${2}


echo "${NUM1} + ${NUM2} = $(echo "${NUM1} + ${NUM2}" | bc)"
echo "${NUM1} * ${NUM2} = $(echo "${NUM1} * ${NUM2}" | bc)"
echo "${NUM1} - ${NUM2} = $(echo "${NUM1} - ${NUM2}" | bc)"
echo "${NUM1} / ${NUM2} = $(echo "${NUM1} / ${NUM2}" | bc)"




exit 0



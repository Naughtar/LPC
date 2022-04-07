#!/bin/bash
#
function sumando(){
	s=0
	let s=$1+$2
	echo "La suma es $s"
	if ((s>5))
	then echo "Wow que numero tan grande"
	fi
}
echo "inserte un numero"
read n1
echo "inserte otro numero"
read n2
sumando $n1 $n2

https://prod.liveshare.vsengsaas.visualstudio.com/join?294AF27515C4756A31BFEA652BE85832A781#! /bin/bash


SCRIPT AC BENCHMARKS PREDICTORS DE SALT

AUTHORS:
    -Joel Teodoro Gómez
    -Carlos Martínez García-Villarrubia
INFO:
Tindrem en compte els següents paràmetres per a evaluar el rendiment:
	-IPC
	-bpred_nottaken.bpred_dir_rate
com
root="/home/milax/Documents/GitHub/ACPrac2/Resultats/"
ammp="/lib/specs2000/ammp/data/ref"
eon="/lib/specs2000/eon/data/ref"
equake="/lib/specs2000/equake/data/ref"
gap="/lib/specs2000/gap/data/ref"
mesa="/lib/specs2000/mesa/data/ref"
memWidth="mem:width 32"
memLat="mem:lat 300 2"
function createFolders
{
	cd $1
	test="taken"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi

	test="taken"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi
	test="notTaken"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi

	test="perfect"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi

	test="bimodal"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi

	test="gshare"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi

	test="gag"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi

	tesT="pag"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi
}
function createDirectories
{
	dir="/home/milax/Documents/GitHub/ACPrac2/Resultats"
	createFolders $dir/"ammp"
	createFolders $dir/"eon"
	createFolders $dir/"equake"
	createFolders $dir/"gap"
	createFolders $dir/"mesa"
}
function notTaken
{
	#NOTTAKEN
	dir=$ammp"/notTaken"
	tasca="notTakenAMMP.txt"
	echo "processing "$tasca
	sim-outorder -fastfwd 50000000 \
	-max:inst 50000000 \
	-bpred nottaken \
	-$memWidth \
	-$memLat \
	-redir:sim $dir/$tasca /lib/specs2000/ammp/exe/ammp.exe < ammp.in > $dir/ammp.out 		2> $dir/ammp.err
}
function taken
{
	dir=$ammp"/taken"
	tasca="takenAMMP.txt"
	echo "processing "$tasca
	sim-outorder -fastfwd 50000000 \
	-max:inst 50000000 \
	-bpred taken \
	-$memWidth \
	-$memLat \
	-redir:sim $dir/$tasca /lib/specs2000/ammp/exe/ammp.exe < ammp.in > $dir/ammp.out 		2> $dir/ammp.err
	
}
function perfect
{
	dir=$ammp/"perfect"
	tasca="perfectAMMP.txt"
	echo "processing "$tasca
	sim-outorder -fastfwd 50000000 \
	-max:inst 50000000 \
	-bpred perfect \
	-$memWidth \
	-$memLat \
	-redir:sim $dir/$tasca /lib/specs2000/ammp/exe/ammp.exe < ammp.in > $dir/ammp.out 		2> $dir/ammp.err

}
function bimodal
{
	cd $ammp
	dir=$root"ammp/bimodal"
	for i in 8 32 128 512 2048
	do
		tasca="bimodalAMMP$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred bimod \
		-bpred:bimod $i \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/ammp/exe/ammp.exe < ammp.in > $dir/ammp.out 		2> $dir/ammp.err
	done

	cd $eon
	dir=$root"eon/bimodal"
	for i in 8 32 128 512 2048
	do
		tasca="bimodalEON$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred bimod \
		-bpred:bimod $i \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/eon/exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook > $dir/cook_log.out 2> $dir/cook_log.err	done
	done

	cd $equake
	dir=$root"equake/bimodal"
	for i in 8 32 128 512 2048
	do
		tasca="bimodalEQUAKE$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred bimod \
		-bpred:bimod $i \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/equake/exe/equake.exe < inp.in > $dir/inp.out 2> $dir/inp.err	
	done

	cd $gap
	dir=$root"gap/bimodal"
	for i in 8 32 128 512 2048
	do
		tasca="bimodalGAP$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred bimod \
		-bpred:bimod $i \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/gap/exe/gap.exe -l /usr/lib/specs2000/gap/data/all -q -m 192M < ref.in > $dir/ref.out 2> $dir/ref.err	
	done

	cd $mesa
	dir=$root"mesa/bimodal"
	for i in 8 32 128 512 2048
	do
		tasca="bimodalMESA$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred bimod \
		-bpred:bimod $i \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/mesa/exe/mesa.exe -frames 1000 -meshfile mesa.in -ppmfile mesa.ppm	
	done
}
function pickRedir
{
	case $1 in
		ammp)
			
			;;
		eon)
			;;
		equake)
			;;
		gap)
			;;
		mesa)
			;;
	esac
}
createDirectories

bimodal "ammp"
prueba="ammp"



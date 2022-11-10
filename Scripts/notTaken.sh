#! /bin/bash
root="$HOME/Documents/GitHub/ACPrac2/Resultats/"

ammp="/lib/specs2000/ammp/data/ref"
eon="/lib/specs2000/eon/data/ref"
equake="/lib/specs2000/equake/data/ref"
gap="/lib/specs2000/gap/data/ref"
mesa="/lib/specs2000/mesa/data/ref"

memWidth="mem:width 32"
memLat="mem:lat 300 2"

pred="nottaken"

#NOTTAKEN

	#ammp
    cd $ammp
	dir=$root"ammp/notTaken"
	out=$dir"/NOTTAKEN_AMMP.txt"
	tasca="notTakenAMMP.txt"
	echo "processing "$tasca
	sim-outorder -fastfwd 100000000 \
	-max:inst 100000000 \
	-bpred nottaken \
	-$memWidth \
	-$memLat \
	-redir:sim $dir/$tasca /lib/specs2000/ammp/exe/ammp.exe < ammp.in > $dir/ammp.out 		2> $dir/ammp.err
    echo "notTaken:" > $out
	echo -e "\n\t" >> $out
	grep "sim_IPC" $dir/$tasca >> $out
    grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out


	#eon
    cd $eon
    dir=$root"eon/notTaken"
	out=$dir"/NOTTAKEN_EON.txt"
	tasca="notTakenEON.txt"
	echo "processing "$tasca
	sim-outorder -fastfwd 100000000 \
	-max:inst 100000000 \
	-bpred nottaken \
	-$memWidth \
	-$memLat \
	-redir:sim $dir/$tasca /lib/specs2000/eon/exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook > $dir/cook_log.out 2> $dir/cook_log.err
	echo "notTaken:" > $out
	echo -e "\n\t" >> $out
	grep "sim_IPC" $dir/$tasca >> $out
    grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out

	#equake
    cd $equake
    dir=$root"equake/notTaken"
	out=$dir"/NOTTAKEN_EQUAKE.txt"
	tasca="notTakenEQUAKE.txt"
	echo "processing "$tasca
	sim-outorder -fastfwd 100000000 \
	-max:inst 100000000 \
	-bpred nottaken \
	-$memWidth \
	-$memLat \
	-redir:sim $dir/$tasca /lib/specs2000/equake/exe/equake.exe < inp.in > $dir/inp.out 2> $dir/inp.err	
	echo "notTaken:" > $out
	echo -e "\n\t" >> $out
	grep "sim_IPC" $dir/$tasca >> $out
    grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out


	#gap
    cd $gap
    dir=$root"gap/notTaken"
	out=$dir"/NOTTAKEN_GAP.txt"
	tasca="notTakenGAP.txt"
	echo "processing "$tasca
	sim-outorder -fastfwd 100000000 \
	-max:inst 100000000 \
	-bpred nottaken \
	-$memWidth \
	-$memLat \
	-redir:sim $dir/$tasca /lib/specs2000/gap/exe/gap.exe -l /usr/lib/specs2000/gap/data/all -q -m 192M < ref.in > $dir/ref.out 2> $dir/ref.err	
	echo "notTaken:" > $out
	echo -e "\n\t" >> $out
	grep "sim_IPC" $dir/$tasca >> $out
    grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out

	#mesa
    cd $mesa
    dir=$root"mesa/notTaken"
	out=$dir"/NOTTAKEN_MESA.txt"
	tasca="notTakenMESA.txt"
	echo "processing "$tasca
	sim-outorder -fastfwd 100000000 \
	-max:inst 100000000 \
	-bpred nottaken \
	-$memWidth \
	-$memLat \
	-redir:sim $dir/$tasca /lib/specs2000/mesa/exe/mesa.exe -frames 1000 -meshfile mesa.in -ppmfile mesa.ppm	
	echo "notTaken:" > $out
	echo -e "\n\t" >> $out
	grep "sim_IPC" $dir/$tasca >> $out
    grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
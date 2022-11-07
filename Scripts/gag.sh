#! /bin/bash

root="/home/milax/Documents/GitHub/ACPrac2/Resultats/"
ammp="/lib/specs2000/ammp/data/ref"
eon="/lib/specs2000/eon/data/ref"
equake="/lib/specs2000/equake/data/ref"
gap="/lib/specs2000/gap/data/ref"
mesa="/lib/specs2000/mesa/data/ref"
memWidth="mem:width 32"
memLat="mem:lat 300 2"

pred="gag"

array=(3 5 7 9 11)

cd $ammp
	dir=$root"ammp/gag"
    out=$dir"/GAG_AMMP.txt"
    echo "GAG:" > $out
    j=0
	for i in 8 32 128 512 2048
	do
        let x=${array[$j]}
	    ((j++))
		tasca="gagAMMP$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev 1 $i $x 0 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/ammp/exe/ammp.exe < ammp.in > $dir/ammp.out 		2> $dir/ammp.err
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
    done
    


	cd $eon
	dir=$root"eon/gag"
    out=$dir"/GAG_EON.txt"
    echo "GAG:" > $out
    j=0
	for i in 8 32 128 512 2048
	do
        let x=${array[$j]}
	    ((j++))
		tasca="gagEON$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev 1 $i $x 0 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/eon/exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook > $eon/cook_log.out 2> $eon/cook_log.err
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
    done

	cd $equake
    dir=$root"equake/gag"
    out=$dir"/GAG_EQUAKE.txt"
    echo "GAG:" > $out
    j=0
	for i in 8 32 128 512 2048
	do
        let x=${array[$j]}
	    ((j++))
		tasca="gagEQUAKE$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev 1 $i $x 0 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/equake/exe/equake.exe < inp.in > $dir/inp.out 2> $dir/inp.err	
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out

    done

	cd $gap
	dir=$root"gap/gag"
    out=$dir"/GAG_GAP.txt"
    echo "GAG:" > $out
    j=0
	for i in 8 32 128 512 2048
	do
        let x=${array[$j]}
	    ((j++))
		tasca="gagGAP$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev 1 $i $x 0 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/gap/exe/gap.exe -l /usr/lib/specs2000/gap/data/all -q -m 192M < ref.in > $dir/ref.out 2> $dir/ref.err
        
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out	
	done

	cd $mesa
	dir=$root"mesa/gag"
    out=$dir"/GAG_MESA.txt"
    echo "GAG:" > $out
    j=0
	for i in 8 32 128 512 2048
	do  
        let x=${array[$j]}
	    ((j++))
		tasca="gagMESA$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev 1 $i $x 0 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/mesa/exe/mesa.exe -frames 1000 -meshfile mesa.in -ppmfile mesa.ppm	
        
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
	done
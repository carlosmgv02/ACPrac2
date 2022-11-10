#! /bin/bash

root="$HOME/Documents/GitHub/ACPrac2/Resultats/"

ammp="/lib/specs2000/ammp/data/ref"
eon="/lib/specs2000/eon/data/ref"
equake="/lib/specs2000/equake/data/ref"
gap="/lib/specs2000/gap/data/ref"
mesa="/lib/specs2000/mesa/data/ref"

memWidth="mem:width 32"
memLat="mem:lat 300 2"

pred="2lev"

array=(3 5 7 9 11)

cd $ammp
	dir=$root"ammp/gshare"
    out=$dir"/GSHARE_AMMP.txt"
    echo "GSHARE:" > $out
	echo -e "\n\t" >> $out
    j=0
	for i in 8 32 128 512 2048
	do
        let x=${array[$j]}
	    ((j++))
		tasca="gshareAMMP$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev 1 $i $x 1 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/ammp/exe/ammp.exe < ammp.in > $dir/ammp.out 2> $dir/ammp.err
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
    done
    


	cd $eon
	dir=$root"eon/gshare"
    out=$dir"/GSHARE_EON.txt"
    echo "GSHARE:" > $out
	echo -e "\n\t" >> $out
    j=0
	for i in 8 32 128 512 2048
	do
        let x=${array[$j]}
	    ((j++))
		tasca="gshareEON$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev 1 $i $x 1 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/eon/exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook > $dir/cook_log.out 2> $dir/cook_log.err
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
    done

	cd $equake
    dir=$root"equake/gshare"
    out=$dir"/GSHARE_EQUAKE.txt"
    echo "GSHARE:" > $out
	echo -e "\n\t" >> $out
    j=0
	for i in 8 32 128 512 2048
	do
        let x=${array[$j]}
	    ((j++))
		tasca="gshareEQUAKE$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev 1 $i $x 1 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/equake/exe/equake.exe < inp.in > $dir/inp.out 2> $dir/inp.err	
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out

    done

	cd $gap
	dir=$root"gap/gshare"
    out=$dir"/GSHARE_GAP.txt"
    echo "GSHARE:" > $out
	echo -e "\n\t" >> $out
    j=0
	for i in 8 32 128 512 2048
	do
        let x=${array[$j]}
	    ((j++))
		tasca="gshareGAP$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev 1 $i $x 1 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/gap/exe/gap.exe -l /usr/lib/specs2000/gap/data/all -q -m 192M < ref.in > $dir/ref.out 2> $dir/ref.err
        
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out	
	done

	cd $mesa
	dir=$root"mesa/gshare"
    out=$dir"/GSHARE_MESA.txt"
    echo "GSHARE:" > $out
	echo -e "\n\t" >> $out
    j=0
	for i in 8 32 128 512 2048
	do  
        let x=${array[$j]}
	    ((j++))
		tasca="gshareMESA$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev 1 $i $x 1 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/mesa/exe/mesa.exe -frames 1000 -meshfile mesa.in -ppmfile mesa.ppm	
        
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
	done

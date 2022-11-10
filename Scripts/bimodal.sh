#! /bin/bash

root="$HOME/Documents/GitHub/ACPrac2/Resultats/"

ammp="/lib/specs2000/ammp/data/ref"
eon="/lib/specs2000/eon/data/ref"
equake="/lib/specs2000/equake/data/ref"
gap="/lib/specs2000/gap/data/ref"
mesa="/lib/specs2000/mesa/data/ref"

memWidth="mem:width 32"
memLat="mem:lat 300 2"

pred="bimod"

cd $ammp
	dir=$root"ammp/bimodal"
    out=$dir"/BIMODAL_AMMP.txt"
    echo "BIMODAL:" > $out
	echo -e "\n\t" >> $out
	for i in 8 32 128 512 2048
	do
		tasca="bimodalAMMP$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 100000000 \
		-max:inst 100000000 \
		-bpred bimod \
		-bpred:bimod $i \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/ammp/exe/ammp.exe < ammp.in > $dir/ammp.out 2> $dir/ammp.err
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
    done
    


	cd $eon
	dir=$root"eon/bimodal"
    out=$dir"/BIMODAL_EON.txt"
    echo "BIMODAL:" > $out
	echo -e "\n\t" >> $out
	for i in 8 32 128 512 2048
	do
		tasca="bimodalEON$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 100000000 \
		-max:inst 100000000 \
		-bpred bimod \
		-bpred:bimod $i \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/eon/exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook > $dir/cook_log.out 2> $dir/cook_log.err
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
    done

	cd $equake
    dir=$root"equake/bimodal"
    out=$dir"/BIMODAL_EQUAKE.txt"
    echo "BIMODAL:" > $out
	echo -e "\n\t" >> $out
	for i in 8 32 128 512 2048
	do
		tasca="bimodalEQUAKE$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 100000000 \
		-max:inst 100000000 \
		-bpred bimod \
		-bpred:bimod $i \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/equake/exe/equake.exe < inp.in > $dir/inp.out 2> $dir/inp.err	
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out

    done

	cd $gap
	dir=$root"gap/bimodal"
    out=$dir"/BIMODAL_GAP.txt"
    echo "BIMODAL:" > $out
	echo -e "\n\t" >> $out
	for i in 8 32 128 512 2048
	do
		tasca="bimodalGAP$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 100000000 \
		-max:inst 100000000 \
		-bpred bimod \
		-bpred:bimod $i \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/gap/exe/gap.exe -l /usr/lib/specs2000/gap/data/all -q -m 192M < ref.in > $dir/ref.out 2> $dir/ref.err
        
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out	
	done

	cd $mesa
	dir=$root"mesa/bimodal"
    out=$dir"/BIMODAL_MESA.txt"
    echo "BIMODAL:" > $out
	echo -e "\n\t" >> $out
	for i in 8 32 128 512 2048
	do
		tasca="bimodalMESA$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 100000000 \
		-max:inst 100000000 \
		-bpred bimod \
		-bpred:bimod $i \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/mesa/exe/mesa.exe -frames 1000 -meshfile mesa.in -ppmfile mesa.ppm	
        
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
	done
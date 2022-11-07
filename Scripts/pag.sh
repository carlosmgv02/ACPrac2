#! /bin/bash

root="/home/milax/Documents/GitHub/ACPrac2/Resultats/"

ammp="/lib/specs2000/ammp/data/ref"
eon="/lib/specs2000/eon/data/ref"
equake="/lib/specs2000/equake/data/ref"
gap="/lib/specs2000/gap/data/ref"
mesa="/lib/specs2000/mesa/data/ref"

memWidth="mem:width 32"
memLat="mem:lat 300 2"

pred="pag"

array=(2 4 6 8 10 11)
arrayX=(4 16 64  256 1024 2048)
#(4-4), (8-16),(16-64), (32-256), (64-1024), (32-2048) son (Y-X)


cd $ammp
	dir=$root"ammp/pag"
    out=$dir"/PAG_AMMP.txt"
    echo "PAG:" > $out
    j=0

	for i in 4 8 16 32 64 32
	do
        let log=${array[$j]}
        let x=${arrayX[$j]}
	    ((j++))
 
		tasca="pagAMMP$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev $i $x $log 0 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/ammp/exe/ammp.exe < ammp.in > $dir/ammp.out 2> $dir/ammp.err
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
    done
    


	cd $eon
	dir=$root"eon/pag"
    out=$dir"/PAG_EON.txt"
    echo "PAG:" > $out
    j=0
 
	for i in 4 8 16 32 64 32
	do
        let log=${array[$j]}
        let x=${arrayX[$j]}
	    ((j++))

		tasca="pagEON$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev $i $x $log 0 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/eon/exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook > $dir/cook_log.out 2> $dir/cook_log.err
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
    done

	cd $equake
    dir=$root"equake/pag"
    out=$dir"/PAG_EQUAKE.txt"
    echo "PAG:" > $out
    j=0

	for i in 4 8 16 32 64 32
	do
        let log=${array[$j]}
        let x=${arrayX[$j]}
	    ((j++))
  
		tasca="pagEQUAKE$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev $i $x $log 0 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/equake/exe/equake.exe < inp.in > $dir/inp.out 2> $dir/inp.err	
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out

    done

	cd $gap
	dir=$root"gap/pag"
    out=$dir"/PAG_GAP.txt"
    echo "PAG:" > $out
    j=0

	for i in 4 8 16 32 64 32
	do
        let log=${array[$j]}
        let x=${arrayX[$j]}
	    ((j++))

		tasca="pagGAP$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev $i $x $log 0 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/gap/exe/gap.exe -l /usr/lib/specs2000/gap/data/all -q -m 192M < ref.in > $dir/ref.out 2> $dir/ref.err
        
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out	
	done

	cd $mesa
	dir=$root"mesa/pag"
    out=$dir"/PAG_MESA.txt"
    echo "PAG:" > $out
    j=0

	for i in 4 8 16 32 64 32
	do
        let log=${array[$j]}
        let x=${arrayX[$j]}
	    ((j++))

		tasca="pagMESA$i.txt"
		echo "processing "$tasca
		sim-outorder -fastfwd 50000000 \
		-max:inst 50000000 \
		-bpred 2lev \
		-bpred:2lev $i $x $log 0 \
		-$memWidth \
		-$memLat \
		-redir:sim $dir/$tasca /lib/specs2000/mesa/exe/mesa.exe -frames 1000 -meshfile mesa.in -ppmfile mesa.ppm	
        
        grep "sim_IPC" $dir/$tasca >> $out
        grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
	done
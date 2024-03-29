#! /bin/bash

#! /bin/bash
root="$HOME/Documents/GitHub/ACPrac2/Resultats/"

ammp="/lib/specs2000/ammp/data/ref"
eon="/lib/specs2000/eon/data/ref"
equake="/lib/specs2000/equake/data/ref"
gap="/lib/specs2000/gap/data/ref"
mesa="/lib/specs2000/mesa/data/ref"

memWidth="mem:width 32"
memLat="mem:lat 300 2"

pred="perfect"


#AMMP
cd $ammp
dir=$root"ammp/perfect"
out=$dir"/PERFECT_AMMP.txt"
tasca="perfectAMMP.txt"
echo "processing "$tasca
sim-outorder -fastfwd 100000000 \
-max:inst 100000000 \
-bpred perfect \
-$memWidth \
-$memLat \
-redir:sim $dir/$tasca /lib/specs2000/ammp/exe/ammp.exe < ammp.in > $dir/ammp.out 2> $dir/ammp.err
echo "perfect:" > $out
echo -e "\n\t" >> $out	
grep "sim_IPC" $dir/$tasca >> $out
grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out


#EON
cd $eon
dir=$root"eon/perfect"
out=$dir"/PERFECT_EON.txt"
tasca="perfectEON.txt"
echo "processing "$tasca
sim-outorder -fastfwd 100000000 \
-max:inst 100000000 \
-bpred perfect \
-$memWidth \
-$memLat \
-redir:sim $dir/$tasca /lib/specs2000/eon/exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook > $dir/cook_log.out 2> $dir/cook_log.err

echo "perfect:" > $out
echo -e "\n\t" >> $out
grep "sim_IPC" $dir/$tasca >> $out
grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out

#EQUAKE
cd $equake
dir=$root"equake/perfect"
out=$dir"/PERFECT_EQUAKE.txt"
tasca="perfectEQUAKE.txt"
echo "processing "$tasca
sim-outorder -fastfwd 100000000 \
-max:inst 100000000 \
-bpred perfect \
-$memWidth \
-$memLat \
-redir:sim $dir/$tasca /lib/specs2000/equake/exe/equake.exe < inp.in > $dir/inp.out 2> $dir/inp.err	
echo "perfect:" > $out
echo -e "\n\t" >> $out
grep "sim_IPC" $dir/$tasca >> $out
grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out

#GAP
cd $gap
dir=$root"gap/perfect"
out=$dir"/PERFECT_GAP.txt"
tasca="perfectGAP.txt"
echo "processing "$tasca
sim-outorder -fastfwd 100000000 \
-max:inst 100000000 \
-bpred perfect \
-$memWidth \
-$memLat \
-redir:sim $dir/$tasca /lib/specs2000/gap/exe/gap.exe -l /usr/lib/specs2000/gap/data/all -q -m 192M < ref.in > $dir/ref.out 2> $dir/ref.err	
echo "perfect:" > $out
echo -e "\n\t" >> $out
grep "sim_IPC" $dir/$tasca >> $out
grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out

#MESA
cd $mesa
dir=$root"mesa/perfect"
out=$dir"/PERFECT_MESA.txt"
tasca="perfectMESA.txt"
echo "processing "$tasca
sim-outorder -fastfwd 100000000 \
-max:inst 100000000 \
-bpred perfect \
-$memWidth \
-$memLat \
-redir:sim $dir/$tasca /lib/specs2000/mesa/exe/mesa.exe -frames 1000 -meshfile mesa.in -ppmfile mesa.ppm
echo "perfect:" > $out
echo -e "\n\t" >> $out
grep "sim_IPC" $dir/$tasca >> $out
grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out



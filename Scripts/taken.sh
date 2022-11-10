#! /bin/bash
root="$HOME/Documents/GitHub/ACPrac2/Resultats/"

ammp="/lib/specs2000/ammp/data/ref"
eon="/lib/specs2000/eon/data/ref"
equake="/lib/specs2000/equake/data/ref"
gap="/lib/specs2000/gap/data/ref"
mesa="/lib/specs2000/mesa/data/ref"

memWidth="mem:width 32"
memLat="mem:lat 300 2"

pred="taken"


#AMMP
cd $ammp
dir=$root"ammp/taken"
out=$dir"/TAKEN_AMMP.txt"
tasca="takenAMMP.txt"
echo "processing "$tasca
sim-outorder -fastfwd 100000000 \
-max:inst 100000000 \
-bpred taken \
-$memWidth \
-$memLat \
-redir:sim $dir/$tasca /lib/specs2000/ammp/exe/ammp.exe < ammp.in > $dir/ammp.out 2> $dir/ammp.err
echo "Taken:" > $out
echo -e "\n\t" >> $out
grep "sim_IPC" $dir/$tasca >> $out
grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out


#EON
cd $eon
dir=$root"eon/taken"
out=$dir"/TAKEN_EON.txt"
tasca="takenEON.txt"
echo "processing "$tasca
sim-outorder -fastfwd 100000000 \
-max:inst 100000000 \
-bpred taken \
-$memWidth \
-$memLat \
-redir:sim $dir/$tasca /lib/specs2000/eon/exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook > $dir/cook_log.out 2> $dir/cook_log.err
echo "Taken:" > $out
echo -e "\n\t" >> $out
grep "sim_IPC" $dir/$tasca >> $out
grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out

#EQUAKE
cd $equake
dir=$root"equake/taken"
out=$dir"/TAKEN_EQUAKE.txt"
tasca="takenEQUAKE.txt"
echo "processing "$tasca
sim-outorder -fastfwd 100000000 \
-max:inst 100000000 \
-bpred taken \
-$memWidth \
-$memLat \
-redir:sim $dir/$tasca /lib/specs2000/equake/exe/equake.exe < inp.in > $dir/inp.out 2> $dir/inp.err	
echo "Taken:" > $out
echo -e "\n\t" >> $out
grep "sim_IPC" $dir/$tasca >> $out
grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out

#GAP
cd $gap
dir=$root"gap/taken"
out=$dir"/TAKEN_GAP.txt"
tasca="takenGAP.txt"
echo "processing "$tasca
sim-outorder -fastfwd 100000000 \
-max:inst 100000000 \
-bpred taken \
-$memWidth \
-$memLat \
-redir:sim $dir/$tasca /lib/specs2000/gap/exe/gap.exe -l /usr/lib/specs2000/gap/data/all -q -m 192M < ref.in > $dir/ref.out 2> $dir/ref.err	
echo "Taken:" > $out
echo -e "\n\t" >> $out
grep "sim_IPC" $dir/$tasca >> $out
grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out

#MESA
cd $mesa
dir=$root"mesa/taken"
out=$dir"/TAKEN_MESA.txt"
tasca="takenMESA.txt"
echo "processing "$tasca
sim-outorder -fastfwd 100000000 \
-max:inst 100000000 \
-bpred taken \
-$memWidth \
-$memLat \
-redir:sim $dir/$tasca /lib/specs2000/mesa/exe/mesa.exe -frames 1000 -meshfile mesa.in -ppmfile mesa.ppm
echo "Taken:" > $out
echo -e "\n\t" >> $out
grep "sim_IPC" $dir/$tasca >> $out
grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out

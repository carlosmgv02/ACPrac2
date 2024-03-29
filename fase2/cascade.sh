#! /bin/bash

root="$HOME/Documents/GitHub/ACPrac2/fase2/Cascade/"
sim="$HOME/Documents/GitHub/ACPrac2/fase2/simplesim-3.0_acx2"
ammp="/lib/specs2000/ammp/data/ref"
eon="/lib/specs2000/eon/data/ref"
equake="/lib/specs2000/equake/data/ref"
gap="/lib/specs2000/gap/data/ref"
mesa="/lib/specs2000/mesa/data/ref"
pred="cascade"
array=(4 8 16 32 64)
arrayX=(8 32 128 512 2048)

cd $ammp
dir=$root"ammp"
out=$dir"/CASCADE_AMMP.txt"
echo "CASCADE: " > $out
j=0
for i in 3 5 7 9 11
do
    let y=${array[$j]}
    let x=${arrayX[$j]}
    ((j++))
    tasca="cascadeAMMP$i.txt"
    echo "processing "$tasca
    $sim/sim-outorder -fastfwd 100000000 \
    -max:inst 100000000 \
    -bpred cascade \
    -bpred:bimod $y \
    -bpred:2lev 1 $x $i 1 \
    -redir:sim $dir/$tasca /lib/specs2000/ammp/exe/ammp.exe < ammp.in > $dir/ammp.out 2> $dir/ammp.err

    grep "sim_IPC" $dir/$tasca >> $out
    grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
done


cd $eon
dir=$root"eon"
out=$dir"/CASCADE_EON.txt"
echo "CASCADE: " > $out
j=0
for i in 3 5 7 9 11
do
    let y=${array[$j]}
    let x=${arrayX[$j]}
    ((j++))
    tasca="cascadeEON$i.txt"
    echo "processing "$tasca
    $sim/sim-outorder -fastfwd 100000000 \
    -max:inst 100000000 \
    -bpred cascade \
    -bpred:bimod $y \
    -bpred:2lev 1 $x $i 1 \
	-redir:sim $dir/$tasca /lib/specs2000/eon/exe/eon.exe chair.control.cook chair.camera chair.surfaces chair.cook.ppm ppm pixels_out.cook > $dir/cook_log.out 2> $dir/cook_log.err

    grep "sim_IPC" $dir/$tasca >> $out
    grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
done

cd $equake
dir=$root"equake"
out=$dir"/CASCADE_EQUAKE.txt"
echo "CASCADE: " > $out
j=0
for i in 3 5 7 9 11
do
    let y=${array[$j]}
    let x=${arrayX[$j]}
    ((j++))
    tasca="cascadeEQUAKE$i.txt"
    echo "processing "$tasca
    $sim/sim-outorder -fastfwd 100000000 \
    -max:inst 100000000 \
    -bpred cascade \
    -bpred:bimod $y \
    -bpred:2lev 1 $x $i 1 \
		-redir:sim $dir/$tasca /lib/specs2000/equake/exe/equake.exe < inp.in > $dir/inp.out 2> $dir/inp.err	

    grep "sim_IPC" $dir/$tasca >> $out
    grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
done

cd $gap
dir=$root"gap"
out=$dir"/CASCADE_GAP.txt"
echo "CASCADE: " > $out
j=0
for i in 3 5 7 9 11
do
    let y=${array[$j]}
    let x=${arrayX[$j]}
    ((j++))
    tasca="cascadeGAP$i.txt"
    echo "processing "$tasca
    $sim/sim-outorder -fastfwd 100000000 \
    -max:inst 100000000 \
    -bpred cascade \
    -bpred:bimod $y \
    -bpred:2lev 1 $x $i 1 \
    -redir:sim $dir/$tasca /lib/specs2000/gap/exe/gap.exe -l /usr/lib/specs2000/gap/data/all -q -m 192M < ref.in > $dir/ref.out 2> $dir/ref.err
    grep "sim_IPC" $dir/$tasca >> $out
    grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
done

cd $mesa
dir=$root"mesa"
out=$dir"/CASCADE_MESA.txt"
echo "CASCADE: " > $out
j=0
for i in 3 5 7 9 11
do
    let y=${array[$j]}
    let x=${arrayX[$j]}
    ((j++))
    tasca="cascadeMESA$i.txt"
    echo "processing "$tasca
    $sim/sim-outorder -fastfwd 100000000 \
    -max:inst 100000000 \
    -bpred cascade \
    -bpred:bimod $y \
    -bpred:2lev 1 $x $i 1 \
    -redir:sim $dir/$tasca /lib/specs2000/mesa/exe/mesa.exe -frames 1000 -meshfile mesa.in -ppmfile mesa.ppm
    grep "sim_IPC" $dir/$tasca >> $out
    grep "bpred_$pred.bpred_dir_rate" $dir/$tasca >> $out
done

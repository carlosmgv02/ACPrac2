#! /bin/bash
function taken
{
	test="taken"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi
}
function notTaken
{
	test="notTaken"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi
}
function perfect
{
	test="perfect"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi
}
function bimodal
{
	test="bimodal"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi
}
function gshare
{
	test="gshare"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi
}
function gag
{
	test="gag"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi
}
function pag
{
	tesT="pag"
	if [ -e $test ] ; then
		rm -r $test
		mkdir $test
	else
		mkdir $test
	fi
}
function createFolders
{
	#Cd del directori que fiquem per parametre
	cd $1
	taken
	notTaken
	perfect
	bimodal
	gshare
	gag
	pag	
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
createDirectories
cd "/home/milax/Documents/GitHub/ACPrac2/Scripts"
./taken.sh
./bimodal.sh
./perfect.sh


<<com
:'


./nottaken.sh
./perfect.sh
./bimodal.sh
./gshare.sh
./gag.sh
./pag.sh

.
'
com


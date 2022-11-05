# ACPrac2
## FASE 1
### TO-DO
* Adaptar scripts amb la comanda `grep` per a quedar-nos amb la info que ens interessa.
* [Modificar scripts `perfect` y `bimodal` ](#script)
* [Crear scripts Gshare, gag i pag](#g-share/gag/pag)

### SCRIPTS
Hemos organizado los scripts para que se puedan ejecutar por separado y así poder probar su funcionamiento.
En caso de querer ejecutarlos todos de golpe, se deberá seguir los siguientes comandos:
```bash
chmod 777 mainScript
./mainScript
```
Index:
* [mainScript](#mainscript)
* [notTaken](#nottaken)
* [script](#script)
* [taken](#taken)
* [Gshare,gag i pag](#g-sharegagpag)

#### mainScript
Contiene las creaciones de los directorios y las llamadas a los otros scripts.
Usaremos este script para dejar ejecutando todos los otros scripts.
```bash
./mainScript
```

#### notTaken
Contiene el código necesario para ejecutar los scripts de *ammp, eon, equake, gap, mesa* usando el predictor de salto `notTaken`.</br>

#### script
Falta modificarlo, es el script inicial y no funciona bien, hay que coger la parte de código de `perfect` y `bimodal` y ponerlo en un script por separado.</br>
El script de `bimodal` lo ejecutaremos con un bucle, ya que tenemos que usar diferentes valores para cada test. La estructura del script `bimodal` es la siguiente:
```bash
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
		-redir:sim $dir/$tasca /lib/specs2000/ammp/exe/ammp.exe < ammp.in > $dir/ammp.out 		2> $dir/ammp.err
	done
```
#### Taken
Script finalitzat, consisteix en executar els 5 tipus de tests diferents.
#### G-share/gag/pag
Faltan crear los scripts, la idea es hacer un fichero para cada uno y hacer un bucle para cada test *ammp, eon, equake, gap, mesa*.
El bucle será como el usado en [`bimodal`](#script).

## FASE 2
No començada encara.
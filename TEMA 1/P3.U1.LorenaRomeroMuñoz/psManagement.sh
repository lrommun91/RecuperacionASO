#!/bin/bash



# MENU: mostrar menu programa de gestion de procesos

menu() {
echo "*****************************************************
MENÚ PROGRAMA DE GESTIÓN DE PROCESOS
*****************************************************
Introduzca una de las siguientes opciones [1-10]:
1. Ejecutar un programa con una determinada prioridad.
2. Cambiar la prioridad de un proceso.
3. Matar un proceso por nombre.
4. Finalizar una lista de procesos introducida en un archivo.
5. Obtener procesos que están usando un determinado puerto TCP.
6. Obtener el árbol de procesos a partir de un determinado pid solicitado al usuario.
7. Suspender (no matar) un proceso mediante su PID.
8. Reanudar un proceso suspendido mediante su PID.
9. Generar informe de estado actual del sistema.
10. Salir
******************************************************** "
}


pregunta(){
echo "desea usted ejecutar esta accion? [s/n]"
read -n 1 resp
if test "$resp"= "y" -o "$resp"= "Y"; then "$@";
else 
echo "accion cancelada por el usuario"
fi
}

option=0
while [ $option -ne 10 ]; do

menu
sleep 2

read option 

case $option in
1)
 	#MENU:Ejecutar un programa con una determinada prioridad
	read -p "introduzca el programa que dese abrir" $programa
	read -p "introduzca la prioridad que desea" $prioridad
	nice -n  2 firefox
;;
	
2)
  	#MENU:Cambiar la prioridad de un proceso
	 read -p "introduzca el proceso que desea modificar" $proceso
	 renice -n 4 -p 2090
 ;;	
3)
  	#MENU:Matar un proceso por nombre
	read -p "introduzca el proceso que quiere matar" $programa
	killall gedit
 ;;
4)
  	#MENU:Finalizar una lista de procesos introducida en un archivo.
 ;;
5)
  	#MENU: Obtener procesos que están usando un determinado puerto TCP
	 read -p "introduzca el numero de puerto que desea" $puerto
 	 fuser -n tcp 3000
 ;;
6)	#MENU:Obtener el árbol de procesos a partir de un determinado pid solicitado al usuario
 
 ;;
7)	#MENU:Suspender (no matar) un proceso mediante su PID
	read -p "introduzca el PID que desea pausar" 
	kill -TSTP [2090]
 ;;
8)	#MENU:Reanudar un proceso suspendido mediante su PID
	read -p "introduzca el PID que desea reanudar" 
 	kill -CONT [2090]
 ;;	
9)	#MENU:Generar informe de estado actual del sistema.
	read -p "Generando informe" 
	df -h 

;;
 10)
  	#MENU: Salir
  	 exit 1
  	
 
 #error: se ha introducido un valor incorrector
 exit 1
 ;;
esac

sleep 2

done



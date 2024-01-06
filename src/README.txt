Para usar el generador:
	Ejecutar el Makefile para crear generador.exe, el programa debe recibir 7 parámetros.
	
		./generador.exe TYPE MIN_PER_RANK MAX_PER_RANK MIN_RANKS MAX_RANKS PERCENT FOREST_SIZE
	
	TYPE: Debe ser un entero entre 1 y 3, este indica para que extensión (1 2 o 3) generará el problema.
	
	MIN_PER_RANK: Debe ser un entero mayor a 0, establece la anchura mínima de las relaciones de 
					precedencia/paralelo que pueden tener los libros.
	
	MAX_PER_RANK: Deber ser un entero mayor o igual MIN_PER_RANK, representa la anchura máxima de las relaciones 
					de precedencia/paralelo que pueden tener los libros.

	MIN_RANKS: Debe ser un entero mayor a 0, establece la altura mínima de las relaciones de 
					precedencia/paralelo que pueden tener los libros.

	MAX_RANKS: Debe ser un entero mayor o igual a MIN_RANKS, establece la altura máxima de las relaciones de 
				precedencia/paralelo que pueden tener los libros.

	PERCENT: Debe ser un entero entre 0 y 100, es probabilidad de generar una precedencia/paralelo entre libros.

	FOREST_SIZE: Debe ser un entero mayor a 0, indica la cantidad de libros con relaciones.

	Para entender estos parámetros, nuestro generador se basa en un generador de grafos dirigidos acíclicos, donde
	los nodos representan los libros y la arista las relaciones de precedencia o paralelo, de esta manera nos
	aseguramos de que el problema sea siempre resoluble en cuenta a satisfacción de restricciones de dependencia, ya
	que evitamos grafos con ciclos.

	Ejemplo:

		./generador.exe 2 1 3 1 3 30 10 > ../Extension2/problema.pddl

		Se crea un problema para la extensión 2, con 10 relaciones de como máximo 3x3 libros y esto se envía a un archivo
		.pddl en la carpeta Extension2 para facilitar la cosas. (Si se desea la extensión 3, hay que cambiar el 
		primer parámetro a un 3 y el directorio a Extension3)

		IMPORTANTE: El generador aparte de la salida para consola o redireccionamiento (ejemplo anterior) crear un archivo .dot
		en su mismo directorio (Generador), este archivo es un código en formato .dot que es utilizado por el programa 
		Graphviz, básicamente genera la representación del problema de manera visual, donde las aristas ROJAS representan
		paralelos y las aristas AZULES representan predecesores.

		Puedes usar la siguiente web: https://dreampuf.github.io/GraphvizOnline/

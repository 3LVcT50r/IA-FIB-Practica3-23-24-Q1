#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdio.h>      /* printf, fgets */
#include <stdlib.h>     /* atoi */
#include <iostream>
#include <queue>
#include <vector>
#include <fstream>
using namespace std;

int MIN_PER_RANK = 0;
int MAX_PER_RANK = 0;
int MIN_RANKS = 0;
int MAX_RANKS = 0;
int PERCENT = 0;
int FOREST_SIZE = 0;
ofstream myfile;


int create_dag(int n, vector<queue<string>>& bosque) {
   int i, j, k,nodes = 0;
   queue<string> comandos;
   int ranks = MIN_RANKS
              + (rand () % (MAX_RANKS - MIN_RANKS + 1));

   for (i = 0; i < ranks; i++) {
      /* New nodes of 'higher' rank than all nodes generated till now.  */
      int new_nodes = MIN_PER_RANK
                     + (rand () % (MAX_PER_RANK - MIN_PER_RANK + 1));

      /* Edges from old nodes ('nodes') to new ones ('new_nodes').  */
      for (j = 0; j < nodes; j++)
      for (k = 0; k < new_nodes; k++)
         if ( (rand () % 100) < PERCENT) {
            char word[50], word2[50];
            if (rand () % 100 <= 70) { // Blue predesceseors
               sprintf (word, "(predecesor libro_%d libro_%d)\n", j+n, k + nodes+n);
               sprintf (word2, "  libro_%d -> libro_%d [color=\"blue\"];\n", j+n, k + nodes+n);
            }
            else { // Red Paralelos
               sprintf (word, "(paralelo libro_%d libro_%d)\n", j+n, k + nodes+n); 
               sprintf (word2, "  libro_%d -> libro_%d [color=\"red\"];\n", j+n, k + nodes+n);
            }
            myfile << word2;
            comandos.push(word);
         }
      nodes += new_nodes; /* Accumulate into old node set.  */
   }
   bosque.push_back(comandos);
   return nodes;
}



int main(int argc, char *argv[]) {

   if (argc != 7) {
      printf("Usage: MIN_PER_RANK MAX_PER_RANK MIN_RANKS MAX_RANKS PERCENT FOREST_SIZE\n");
      return 1;  // Código de error
   }

   // Convertir los parámetros a enteros usando atoi
   MIN_PER_RANK = atoi(argv[1]); /* Nodes/Rank: How 'fat' the DAG should be.  */
   MAX_PER_RANK = atoi(argv[2]);
   MIN_RANKS = atoi(argv[3]); /* Ranks: How 'tall' the DAG should be.  */
   MAX_RANKS = atoi(argv[4]);
   PERCENT = atoi(argv[5]); /* Chance of having an Edge.  */
   FOREST_SIZE = atoi(argv[6]); /* Size of the forest */

   // Verificar si la conversión fue exitosa
   if (MIN_PER_RANK == 0 && *argv[1] != '0' ||
      MAX_PER_RANK == 0 && *argv[2] != '0' ||
      MIN_RANKS == 0 && *argv[3] != '0' ||
      MAX_RANKS == 0 && *argv[4] != '0' ||
      PERCENT == 0 && *argv[5] != '0' ||
      FOREST_SIZE == 0 && *argv[6] != '0' ) {
      printf("Error: Todos los parámetros deben ser enteros.\n");
      return 1;  // Código de error
   }

   if (MIN_PER_RANK > MAX_PER_RANK || MIN_RANKS > MAX_RANKS) {
      printf("Minimos deben ser mayores a maximo\n");
      return 1;
   }

  srand (time (NULL));
  myfile.open ("graph.dot");

  myfile << "digraph {\n";
  vector<queue<string>> bosque(0);

   int nodes=0;
   
   for(int i=0; i < FOREST_SIZE; ++i) {
      nodes += create_dag(nodes, bosque);
   }
   
   myfile << "}\n";
   myfile.close();

   cout << "(:objects " << endl;
   cout << "        diciembre noviembre octubre septiembre agosto julio junio mayo abril marzo febrero enero - mes" << endl;
   cout << "        "; for (int i=0; i < nodes; ++i) cout << "libro_" << i << " ";
   cout << "- libro" << endl;
   cout << ")" << endl;

   cout << "(:init " << endl;
   cout << "        (mes-anterior-p enero febrero)" << endl;
   cout << "        (mes-anterior-p febrero marzo)" << endl;
   cout << "        (mes-anterior-p marzo abril)" << endl;
   cout << "        (mes-anterior-p abril mayo)" << endl;
   cout << "        (mes-anterior-p mayo junio)" << endl;
   cout << "        (mes-anterior-p junio julio)" << endl;
   cout << "        (mes-anterior-p julio agosto)" << endl;
   cout << "        (mes-anterior-p agosto septiembre)" << endl;
   cout << "        (mes-anterior-p septiembre octubre)" << endl;
   cout << "        (mes-anterior-p octubre noviembre)" << endl;
   cout << "        (mes-anterior-p noviembre diciembre)" << endl << endl;
        
   cout << "        (mes-anterior febrero enero)" << endl;
   cout << "        (mes-anterior marzo enero)(mes-anterior marzo febrero)" << endl;
   cout << "        (mes-anterior abril enero)(mes-anterior abril febrero)(mes-anterior abril marzo)" << endl;
   cout << "        (mes-anterior mayo enero)(mes-anterior mayo febrero)(mes-anterior mayo marzo)(mes-anterior mayo abril)" << endl;
   cout << "        (mes-anterior junio enero)(mes-anterior junio febrero)(mes-anterior junio marzo)(mes-anterior junio abril)(mes-anterior junio mayo)" << endl;
   cout << "        (mes-anterior julio enero)(mes-anterior julio febrero)(mes-anterior julio marzo)(mes-anterior julio abril)(mes-anterior julio mayo)(mes-anterior julio junio)" << endl;
   cout << "        (mes-anterior agosto enero)(mes-anterior agosto febrero)(mes-anterior agosto marzo)(mes-anterior agosto abril)(mes-anterior agosto mayo)(mes-anterior agosto junio)(mes-anterior agosto julio)" << endl;
   cout << "        (mes-anterior septiembre enero)(mes-anterior septiembre febrero)(mes-anterior septiembre marzo)(mes-anterior septiembre abril)(mes-anterior septiembre mayo)(mes-anterior septiembre junio)(mes-anterior septiembre julio)(mes-anterior septiembre agosto)" << endl;
   cout << "        (mes-anterior octubre enero)(mes-anterior octubre febrero)(mes-anterior octubre marzo)(mes-anterior octubre abril)(mes-anterior octubre mayo)(mes-anterior octubre junio)(mes-anterior octubre julio)(mes-anterior octubre agosto)(mes-anterior octubre septiembre)" << endl;
   cout << "        (mes-anterior noviembre enero)(mes-anterior noviembre febrero)(mes-anterior noviembre marzo)(mes-anterior noviembre abril)(mes-anterior noviembre mayo)(mes-anterior noviembre junio)(mes-anterior noviembre julio)(mes-anterior noviembre agosto)(mes-anterior noviembre septiembre)(mes-anterior noviembre octubre)" << endl;
   cout << "        (mes-anterior diciembre enero)(mes-anterior diciembre febrero)(mes-anterior diciembre marzo)(mes-anterior diciembre abril)(mes-anterior diciembre mayo)(mes-anterior diciembre junio)(mes-anterior diciembre julio)(mes-anterior diciembre agosto)(mes-anterior diciembre septiembre)(mes-anterior diciembre octubre)(mes-anterior diciembre noviembre)" << endl << endl;

   cout << "        (= (pag-por-mes enero) 0)" << endl;
   cout << "        (= (pag-por-mes febrero) 0)" << endl;
   cout << "        (= (pag-por-mes marzo) 0)" << endl;
   cout << "        (= (pag-por-mes abril) 0)" << endl;
   cout << "        (= (pag-por-mes mayo) 0)" << endl;
   cout << "        (= (pag-por-mes junio) 0)" << endl;
   cout << "        (= (pag-por-mes julio) 0)" << endl;
   cout << "        (= (pag-por-mes agosto) 0)" << endl;
   cout << "        (= (pag-por-mes septiembre) 0)" << endl;
   cout << "        (= (pag-por-mes octubre) 0)" << endl;
   cout << "        (= (pag-por-mes noviembre) 0)" << endl;
   cout << "        (= (pag-por-mes diciembre) 0)" << endl << endl;

   for (int i=0; i < nodes; ++i) {
      printf ("        (quiere libro_%d)\n", i); 
   }

   printf ("\n\n"); 

   for (int i=0; i < nodes; ++i) {
      int num = (rand()%(450-50)) + 50;
      printf ("        (= (pag-libro libro_%d) %d)\n", i, num); 
   }

   cout << endl << endl;

   for (int i=0; i < bosque.size(); ++i) {
      while (!bosque[i].empty()) {
         cout << "        " << bosque[i].front();
         bosque[i].pop();
      }
      cout << endl;
   }
   cout << ")" << endl;

  return 0;
}
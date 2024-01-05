#include <iostream>
using namespace std;

string escritura(int i) {
    if (i == 0) return "enero";
    else if (i == 1) return "febrero";
    else if (i == 2) return "marzo";
    else if (i == 3) return "abril";
    else if (i == 4) return "mayo";
    else if (i == 5) return "junio";
    else if (i == 6) return "julio";
    else if (i == 7) return "agosto";
    else if (i == 8) return "septiembre";
    else if (i == 9) return "octubre";
    else if (i == 10) return "noviembre";
    else if (i == 11) return "diciembre";
}

int main() {
    for (int i = 0; i < 12; ++i) {
        for (int j = 0; j < i; ++j) {
            cout << "(mes-anterior " << escritura(i) << ' ' << escritura(j) << ")";
        }
        cout << endl;
    }
}
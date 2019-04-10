#include <iostream>
#include <string>
#include <cmath>

using namespace std;

int main(int argc, char *argv[]){
  if(argc!=4){
    cerr << "Usage : ./GasReplace <Volume[L]> <Q[L/min]> <t[min]>" <<endl;
    exit(1);
  }

  string volume = argv[1];
  string flow_rate = argv[2];
  string time = argv[3];

  double V = atoi(volume.c_str());
  double Q = atoi(flow_rate.c_str());
  double t = atoi(time.c_str());
  double X_0 = 100;

  double X_t = X_0 * exp(-1 * Q/V * t);
  cout << " V[L] = "     << volume    <<endl;
  cout << " Q[L/min] = " << flow_rate <<endl;
  cout << " t[min] = "   << time      <<endl;
  cout << " X(" << t << ")[%] = " << X_t << " [%]" <<endl;

}

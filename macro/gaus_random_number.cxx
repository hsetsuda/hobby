// final goal: visualize gaus disturibution with monte calro method
// probability distribution function f(x)
// create random number x' = x0~x1
// create random number y' = 0~y_max
// return x' if y' < f(x')
// repeat above N times
#include <random>
#include <iostream>

#include <TRint.h>
#include <TFile.h>
#include <TTree.h>

using namespace std;

int main(int argc, char *argv[]){
  if(argc!=4){
    cerr << "Usage : gaus_random_number <RepeatNum> <mu> <sigma>" <<endl;
    exit(1);
  }
  int N =atoi(argv[1]);
  double mu =atof(argv[2]);
  double sigma =atof(argv[3]);

  random_device rnd;  //  undefinitive random creater
  double gaus;

  TString tname = "GausRandom.root";
  TFile OutTree(tname, "recreate");
  TTree *tree = new TTree("tree", "gaus distribution");
  tree->Branch("gaus", &gaus, "gaus/D");
  //tree->Branch("RndmNum", &RndmNum, "RndmNum/D");
  //tree->Branch("TransNum", &TransNum, "TransNum/D");
  
  for(int i=0; i<N; i++){
    //  create sum of uniformity random number[0, 1]
    //  cf. central limit theorem
    double rndm_sum = 0.0;
    int n = 12;
    for(int j=0; j<n; j++){
      rndm_sum += (double)rnd()/random_device::max();
    }
  
    gaus = sigma * (rndm_sum - 6) + mu;
  
    tree->Fill(); 
    //cout << val << " " << max << " " << result << "\n";
  } 
  tree->Write();
  OutTree.Close();

  cout << "type something for end this process" << "\n";
  getchar();  //  get char from type
  return 0;
}

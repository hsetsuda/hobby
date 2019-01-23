#include <random>
#include <iostream>
#include <math.h>

#include <TFile.h>
#include <TTree.h>
#include <TRandom.h>

using namespace std;

int main(int argc, char *argv[]){
  random_device rnd;

  if(argc!=4){
    cerr << "Usage : gaus_random_number <RepeatNum> <theta[deg]> <vd[mm/ns]>" <<endl;
    exit(1);
  }
  double N =atof(argv[1]);  // repeat number
  double theta =2*M_PI*atoi(argv[2])/360; // degree -> radian
  double L = 5.0/cos(theta);  //  charged particle through lengh L[mm]
  double a = 3.3;  //  electron cluster number [/mm]
  double Mean_n = a*L;
  int max = Mean_n*3; //  max size of array
  double vd =atof(argv[3]); // drift velocity [mm/ns]
  
  int n ; // cluster number of each event
  double z_true[max];  // position z of true track
  double y_true[max];  //  position y of true track
  double z_obs[max];  //  position z of observed track
  int y_obs[max];  //  position y of observed track

  TString tname = "True_vs_Obs.root";
  TFile OutTree(tname, "recreate");

  TTree *treeZY = new TTree("treeZY", "Position true and reconstruction");
  treeZY->Branch("n", &n, "n/I");
  treeZY->Branch("z_true", z_true, "z_true[n]/D");
  treeZY->Branch("y_true", y_true, "y_true[n]/D");
  treeZY->Branch("z_obs", z_obs, "z_obs[n]/D");
  treeZY->Branch("y_obs", y_obs, "y_obs[n]/I");

  //TTree *treeN = new TTree("treeN", "electron cloud number");
  //treeN->Branch("n", &n, "n/I");


  for(int i=0; i<N; i++){
    // create electron cluster
    n = gRandom->Poisson(Mean_n);
    //treeN->Fill();

    for(int j=0; j<n; j++){
      z_true[j] = 5.0 * (double)rnd()/random_device::max(); // z_true = [0mm,5mm]
      // define y_true = 0 -> z_true = 2.5 
      y_true[j] = (z_true[j] - 2.5) * tan(theta);

      double t = z_true[j]/vd;
      // standardize t about APV time_bin(25ns)
      int tau = (int)(t/25) * 25;

      z_obs[j] = tau * vd;
      y_obs[j] =0;
      // standardize t about u-PIC strip size(0.4mm)
      if(y_true[j]<-0.2){
        y_obs[j] = (int)((y_true[j]-0.2)/0.4);
      }
      if(y_true[j]>-0.2){
        y_obs[j] = (int)((y_true[j]+0.2)/0.4);
      }
    }
    treeZY->Fill();
  }
  treeZY->Write();
  //treeN->Write();

  OutTree.Close();

  cout << "Type Enter for end this process" << "\n";
  getchar();  //  get char from type
  return 0;
}

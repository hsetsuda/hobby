#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <string>
#include <cmath>
#include <sstream>
#include <time.h>

// ROOT
#include <TApplication.h>
#include <TRint.h>
#include <TCanvas.h>
#include <TMath.h>
#include <TH1.h>
#include <TH2.h>
#include <TFile.h>
#include <TTree.h>

// Garifeld++
#include <MediumMagboltz.hh>
#include <ComponentElmer.hh>
#include <GarfieldConstants.hh>
#include <Random.hh>
#include <Sensor.hh>
#include <AvalancheMicroscopic.hh>
#include <AvalancheMC.hh>
#include <ViewField.hh>
#include <ViewFEMesh.hh>
#include <Plotting.hh>

using namespace Garfield;

int main(int argc, char *argv[]){
  clock_t start, end;
  start = clock();  //for check
  if(argc!=6){
    std::cerr << "Usage : ViewTrack <dir> <filename> <Vd[V]> <zi[um]> <RepeatNUM>" <<std::endl;
    exit(1);
  }
  std::string model_dir = argv[1];
  std::string FILE_NAME = argv[2];
  std::string Vdrift = argv[3];
  double z_start = atoi(argv[4]);
  std::string z_str = argv[4];
  int Repeat_NUM = atoi(argv[5]);

  TApplication *app = new TApplication("app", &argc, argv);

  const double um = 0.0001;
  const double axis_x = 1000*um;
  const double axis_y = 1000*um;
  const double axis_z = 5000*um;

  MediumMagboltz *gas = new MediumMagboltz();
  gas->SetComposition("ar", 93.,
      "co2", 7.);
  gas->SetTemperature(293.15);        // [K]
  gas->SetPressure(760.);             // [Torr]
  gas->EnablePenningTransfer(0.31, 0, "ar");
  gas->SetMaxElectronEnergy(200.);    // [eV]
  gas->EnableDrift();
  gas->Initialise(true);
  gas->LoadIonMobility("/home/setsuda/Garfield/garfield/Data/IonMobility_Ar+_Ar.txt");

  std::string data_dir = model_dir + "/" + FILE_NAME;
  std::string header   = data_dir + "/mesh.header";
  std::string elements = data_dir + "/mesh.elements";
  std::string nodes    = data_dir + "/mesh.nodes";
  std::string dat      = data_dir + "/dielectrics.dat";
  //std::string result   = data_dir + "/" + FILE_NAME + ".result";
  std::string result   = data_dir + "/" + FILE_NAME + "_Vd" + Vdrift + ".result";
  ComponentElmer *elm 
    = new ComponentElmer(
        header.c_str(),
        elements.c_str(), 
        nodes.c_str(),
        dat.c_str(), 
        result.c_str(),
        "cm");
  elm->EnablePeriodicityX();
  elm->EnablePeriodicityY();
  elm->SetMedium(0, gas);

  Sensor *sensor = new Sensor();
  sensor->AddComponent(elm);
  sensor->SetArea(-axis_x,-axis_y, -10*um,axis_x,axis_y,axis_z);

  ViewDrift *viewDrift = new ViewDrift();
  viewDrift->SetArea(-axis_x, -axis_y, -10*um, axis_x, axis_y, axis_z);


  AvalancheMicroscopic *aval = new AvalancheMicroscopic();
  aval->SetSensor(sensor);
  aval->EnablePlotting(viewDrift);

  AvalancheMC *ion = new AvalancheMC();
  ion->SetSensor(sensor);
  ion->SetDistanceSteps(2.e-4);
  ion->EnablePlotting(viewDrift);

  Int_t ne; // number of avalanche
  // Int_t nI; // number of Ion drift length
  double xi, yi, zi;  // seed electron
  double x0, y0, z0, t0, e0;  // start each electron
  double xe, ye, ze, te, ee;  // end each electron


  TString tname = FILE_NAME + "_Electron_Vac290Vd" + Vdrift + "z" + z_str + "_.root";
  TFile OutTree(tname, "recreate");

  TTree *treeE = new TTree("treeE", "ElectronEndPoint");
  treeE->Branch("x0", &x0, "x0/D");
  treeE->Branch("y0", &y0, "y0/D");
  treeE->Branch("z0", &z0, "z0/D");
  treeE->Branch("t0", &t0, "t0/D");
  treeE->Branch("xe", &xe, "xe/D");
  treeE->Branch("ye", &ye, "ye/D");
  treeE->Branch("ze", &ze, "ze/D");
  treeE->Branch("te", &te, "te/D");
  treeE->Branch("xi", &xi, "xi/D");
  treeE->Branch("yi", &yi, "yi/D");
  treeE->Branch("zi", &zi, "zi/D");

  TTree *treeN = new TTree("treeN", "Avalanche");
  treeN->Branch("ne", &ne, "ne/I");

  std::ofstream Logfile( "EndEleIshitobi_" + z_str + ".log" );
  // repeat zoon------------------------------------------

  for(int k=0; k<Repeat_NUM; k++){
    // set electron start parameters
    zi = z_start*um;
    xi = 200*um -400*um * RndmUniform();
    yi = 200*um -400*um * RndmUniform();

    aval->AvalancheElectron(xi, yi, zi, 0, 0, 0);
    ne = aval->GetNumberOfElectronEndpoints();
    treeN->Fill();

    for(int i=0; i<ne; i++){
      Int_t Stat;
      aval->GetElectronEndpoint(i,
          x0, y0, z0, t0, e0,
          xe, ye, ze, te, ee,
          Stat);
       //Logfile << "aval->GetElectron"<< std::endl;
      treeE->Fill();
    }
    end = clock();
    Logfile << "Done: " << k+1 << "/" << Repeat_NUM << " events" 
      << " (s = " << (end-start)/CLOCKS_PER_SEC << " [sec])"<< std::endl;
  }
  treeE->Write();
  treeN->Write();
  OutTree.Close();



  std::cout<<"Finish!"<<std::endl;
  exit(1);
  app->Run(); 
}

#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <string>
#include <cmath>
#include <sstream>

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
  if(argc!=4){
    std::cerr << "Usage : ViewTrack <dir> <filename> <NUM>" <<std::endl;
    exit(1);
  }
  std::string model_dir = argv[1];
  std::string FILE_NAME = argv[2];
  int Repeat_NUM = atoi(argv[3]);

  TApplication *app = new TApplication("app", &argc, argv);

  const double um = 0.0001;
  const double axis_x = 600*um;
  const double axis_y = 600*um;
  const double axis_z = 1000*um;

  MediumMagboltz *gas = new MediumMagboltz();
  gas->SetComposition("ar", 90.,
		      "c2h4", 10.);
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
  std::string result   = data_dir + "/" + FILE_NAME + ".result";
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
  elm->SetMedium(4, gas);

  Sensor *sensor = new Sensor();
  sensor->AddComponent(elm);
  sensor->SetArea(-axis_x,-axis_y,-10*um,axis_x,axis_y,axis_z);

  ViewDrift *viewDrift = new ViewDrift();
  viewDrift->SetArea(-axis_x, -axis_y, -10*um, axis_x, axis_y, axis_z);


  AvalancheMicroscopic *aval = new AvalancheMicroscopic();
  aval->SetSensor(sensor);
  aval->EnablePlotting(viewDrift);

  AvalancheMC *ion = new AvalancheMC();
  ion->SetSensor(sensor);
  ion->SetDistanceSteps(2.e-4);
  ion->EnablePlotting(viewDrift);

  Int_t nd[Repeat_NUM];
  Int_t nd_Sum = 0;
  double xi, yi, zi;
  double x0, y0, z0, t0, e0;
  double x1, y1, z1, t1, e1;
  double r;
  double r_in = 0;
  TString tname = FILE_NAME + "_EndPoint_tree.root";
  TFile OutTree(tname, "recreate");

  TTree *tree1 = new TTree("tree1", "ElectronEndPoint");
  tree1->Branch("x0", &x0, "x0/D");
  tree1->Branch("y0", &y0, "y0/D");
  tree1->Branch("z0", &z0, "z0/D");
  tree1->Branch("t0", &t0, "t0/D");
  tree1->Branch("x1", &x1, "x1/D");
  tree1->Branch("y1", &y1, "y1/D");
  tree1->Branch("z1", &z1, "z1/D");
  tree1->Branch("t1", &t1, "t1/D");
  tree1->Branch("r", &r, "r/D");

  TTree *tree2 = new TTree("tree2", "primaryElectronPoint");
  tree2->Branch("xi", &xi, "xi/D");
  tree2->Branch("yi", &yi, "yi/D");

  std::ofstream Logfile( "EndPointTree.log" );
  // repeat zoon------------------------------------------

  for(int k=0; k<Repeat_NUM; k++){
    // set electron start parameters
    zi = 1000*um;
    xi = 200*um - 400*um * RndmUniform();
    yi = 200*um - 400*um * RndmUniform();

    aval->AvalancheElectron(xi, yi, zi, 0, 0, 0);
    nd[k] = aval->GetNumberOfElectronEndpoints();
    nd_Sum = nd_Sum + nd[k];
    tree2->Fill();

    for(int i=0; i<nd[k]; i++){
      Int_t Stat;
      aval->GetElectronEndpoint(i,
          x0, y0, z0, t0, e0,
          x1, y1, z1, t1, e1,
          Stat);
      r = TMath::Sqrt(x1*x1 + y1*y1);
      //ion->DriftIon(x0, y0, z0, t0);
      tree1->Fill();
      if(r<=0.0025){
        r_in = r_in+1;
      }
    }
    Logfile << "Done: " << " " << k+1 << "/" << Repeat_NUM << " events " << std::endl;
  }
  tree1->Write();
  tree2->Write();
  OutTree.Close();
 

  std::cout<<"Finish!"<<std::endl;
  exit(1);
  app->Run(); 
}

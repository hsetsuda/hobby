#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <string>
#include <cmath>

// ROOT
#include <TApplication.h>
#include <TCanvas.h>
#include <TMath.h>
#include <TH1.h>
#include <TH2.h>
#include <TFile.h>

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
  if(argc!=3){
    std::cerr << "Usage : ViewTrack <dir> <filename>" <<std::endl;
    exit(1);
  }
  std::string model_dir = argv[1];
  std::string FILE_NAME = argv[2];
  std::string gif_title = FILE_NAME + "_track.gif";

  TApplication *app = new TApplication("app", &argc, argv);

  const double uPIC_th = 0.0215;          // uPIC thickness in cm
  const double elec_th = 0.0015;      // electrode(anode,cathode) thickness
  const double uPIC_pitch = 0.04;       // uPIC pitch in cm
  const double axis_x = 0.04;
  const double axis_y = 0.04;
  const double axis_z = 0.02 + uPIC_th/2 + elec_th;

// set electron start parameters
  const double zi = uPIC_th/2 + elec_th + 0.01;
  const double ri = (uPIC_th/2)*RndmUniform();
  const double thetai = RndmUniform()*TwoPi;
  const double xi = ri*cos(thetai);
  const double yi = ri*sin(thetai);

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
  sensor->SetArea(-axis_x,-axis_y,-axis_z,axis_x,axis_y,axis_z);

  ViewDrift *viewDrift = new ViewDrift();
  viewDrift->SetArea(-axis_x, -axis_y, -axis_z, 
      axis_x, axis_y, axis_z);

  TCanvas *ViewWin = new TCanvas("ViewWin", "", 0, 0, 800, 800);
  ViewWin->SetFillColor(0);
  ViewWin->SetFrameFillColor(0);

  ViewFEMesh *vFE = new ViewFEMesh();
  vFE->SetCanvas(ViewWin);
  vFE->SetComponent(elm);
  vFE->SetPlane(0, -1, 0, 0, 0, 0);
  vFE->SetFillMesh(true);
  vFE->SetColor(1, kOrange+4);
  vFE->SetColor(2, kBlack);
  vFE->SetColor(3, kOrange);
  vFE->SetColor(4, kGreen);
  vFE->SetColor(5, kGreen);
  vFE->SetColor(6, kGreen);
  vFE->SetColor(7, kGreen);

  AvalancheMicroscopic *aval = new AvalancheMicroscopic();
  aval->SetSensor(sensor);
  aval->EnablePlotting(viewDrift);

  AvalancheMC *ion = new AvalancheMC();
  ion->SetSensor(sensor);
  ion->SetDistanceSteps(2.e-4);
  ion->EnablePlotting(viewDrift);
  
  aval->AvalancheElectron(xi, yi, zi, 0, 0, 0);
  
  Int_t nd = aval->GetNumberOfElectronEndpoints();
  std::cout << "xi, yi, zi, nd =" << xi << "," << yi << "," << zi << "," << nd << std::endl;
  for(int i=0; i<nd; i++){
    Int_t Stat;
    double x0, y0, z0, t0, e0;
    double x1, y1, z1, t1, e1;
    aval->GetElectronEndpoint(i,
       x0, y0, z0, t0, e0,
       x1, y1, z1, t1, e1,
       Stat);
    ion->DriftIon(x0, y0, z0, t0);
  }

  ViewWin->cd();
  vFE->SetArea(-axis_x, -axis_z, 0., axis_x, axis_z, 0.); 
  vFE->EnableAxes(); 
  vFE->SetViewDrift(viewDrift); 
  vFE->SetXaxisTitle("[cm]"); 
  vFE->SetYaxisTitle("[cm]"); 
  vFE->Plot();
  ViewWin->Update(); 
  ViewWin->Print( gif_title.c_str() );
  std::cout<<"Finish!"<<std::endl;
  
  app->Run(); 

}

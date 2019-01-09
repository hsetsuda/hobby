#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <string>
#include <cmath>

// ROOT
#include <TApplication.h>
#include <TRint.h>
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
#include <ViewField.hh>
#include <ViewFEMesh.hh>

using namespace Garfield;

int main(int argc, char *argv[]){
  if(argc!=3){
    std::cerr << "Usage : ViewFLD <dir> <filename> " <<std::endl;
    exit(1);
  }
  std::string model_dir = argv[1];
  std::string FILE_NAME = argv[2];
  
  TApplication *app = new TApplication("app", &argc, argv);

  const double axis_x = 0.04;
  const double axis_y = 0.04;
  const double axis_z = 0.04;


  MediumMagboltz *gas = new MediumMagboltz();
  gas->SetComposition("ar", 93.,
		      "co2", 7.);
  gas->SetTemperature(293.15);        // [K]
  gas->SetPressure(760.);             // [Torr]
  gas->EnablePenningTransfer(0.31, 0, "ar");
  gas->SetMaxElectronEnergy(200.);    // [eV]
  gas->EnableDrift();
  gas->Initialise(true);

  std::string data_dir = model_dir + "/" + FILE_NAME;
  std::string header   = data_dir + "/mesh.header";
  std::string elements = data_dir + "/mesh.elements";
  std::string nodes    = data_dir + "/mesh.nodes";
  std::string dat      = data_dir + "/dielectrics.dat";
  //std::string result   = data_dir + "/" + FILE_NAME + ".result";
  std::string result   = data_dir + "/" + FILE_NAME + "_Vd390.result";
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
  sensor->SetArea(-axis_x,-axis_y,-axis_z,axis_x,axis_y,axis_z);

  std::string Title = FILE_NAME +  "_E_field;[cm];[cm];[kV/cm]";
  TH2F *E_hist = new TH2F("E_hist", Title.c_str(), 
			  300, -axis_x, axis_x,
			  300, -axis_z, axis_z);
  TH2F *V_hist = new TH2F("V_hist", "", 
			  300, -axis_x, axis_x,
			  300, -axis_z, axis_z);
  
  Medium *med;
  for(int i=0; i<300; i++){
    double x = E_hist->GetXaxis()->GetBinCenter(i+1);
    for(int j=0; j<300; j++){
      double z = E_hist->GetYaxis()->GetBinCenter(j+1);
      
      double ex, ey, ez, v;
      int stat;
      elm->ElectricField(x, 0, z, ex, ey, ez, v, med, stat);
      
      double e_val = TMath::Sqrt(ex*ex + ey*ey + ez*ez);
      E_hist->Fill(x, z, e_val);
      V_hist->Fill(x, z, v);
    }
  }

  std::string filename = FILE_NAME + "_e_field.root";
  TFile OutFile( filename.c_str(), "recreate");
  E_hist->Scale(1e-3);
  //V_hist->Scale(1e-3);
  E_hist->Write();
  V_hist->Write();
  OutFile.Close();
  
  std::cout <<  model_dir << std::endl;
  std::cout <<  FILE_NAME << std::endl;
  std::cout <<  data_dir << std::endl;

}

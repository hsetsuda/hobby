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
#include <ViewField.hh>
#include <ViewFEMesh.hh>

using namespace Garfield;

int main(int argc, char *argv[]){
  TApplication *app = new TApplication("app", &argc, argv);
  double Eval= atoi(argv[1]);
  TString outfname= argv[2];
  TString output= outfname + ".txt";

  MediumMagboltz *gas = new MediumMagboltz();
  gas->SetComposition("ar", 70., "c2h6", 30.);
  gas->SetTemperature(293.15);        // [K]
  gas->SetPressure(760.);             // [Torr]
  gas->EnablePenningTransfer(0.31, 0, "ar");
  gas->SetMaxElectronEnergy(200.);    // [eV]
  gas->EnableDrift();
  gas->Initialise(true);

  double vx, vy, vz;  // drift velocity along E(=vz), Bt(=vy), and E*B(vy)
  double dl, dt;  // difusion coefficients
  double alpha, eta, tof; // Townsend and attachment coefficient calculated using the SST technique or, at low fields, the ionization/loss rate
  double vxe, vye, vze, dle, dte, ale, ete; // statistical error of the calculation in %
  double lor, lore; // lor = Lorentz angle, lore(lorerr) =  lor's statistical error <- these maybe be added in 2018
  //double Eval = 400;  // E field
  
  gas->RunMagboltz(Eval, 0, 0, 10, true,
		   vx, vy, vz, dl, dt, alpha, eta, lor,
		   vxe, vye, vze, dle, dte, ale, ete, lore,
		   tof);
  std::ofstream outfile(output);
  outfile << " E [V/cm] : " << Eval << std::endl;
  outfile << " Drift V [cm/ns] : " 
    << '\t' << vz << " " << vze << "%" << std::endl;
  outfile << " Diff. L [cm^0.5]: " 
    << '\t' << dl << " " << dle << "%" << std::endl;
  outfile << " Diff. T [cm^0.5]: " 
    << '\t' << dt << " " << dte << "%" << std::endl;
  outfile.close();
}

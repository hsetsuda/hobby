#include <random>
#include <iostream>
#include <fstream>

#include <TFile.h>
#include <TTree.h>

int main()
{
  std::random_device seed_gen;
  std::default_random_engine engine(seed_gen());

  //  distribute with mean=0.0 and sigma=1.0
  std::normal_distribution<> dist(0.0, 1.0);

  //std::ofstream file("normal_distribution.tsv");
  double result_x;
  double result_y;
  TString tname = "NorDist.root";
  TFile OutTree(tname, "recreate");
  TTree *tree = new TTree("tree", "normal distribution");
  tree->Branch("result_x", &result_x, "result_x/D");
  tree->Branch("result_y", &result_y, "result_y/D");

  for (std::size_t n = 0; n < 1000 * 1000; ++n) {
    //  create random number with normal distribution
    result_x = dist(engine);
    result_y = dist(engine);
    tree->Fill();
  }
  tree->Write();
  OutTree.Close();
  std::cout << "type Enter for end this process" << "\n";
  getchar();  //  get char from type
  return 0;
}

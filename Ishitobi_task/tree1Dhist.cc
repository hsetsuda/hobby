
void tree1Dhist(TString data = "deltaY_10_100.root", TString savename = "MC_deltaY_theta10Vd100.root"){
    TFile *intree = new TFile(data, "read");
    TTree *outtree = (TTree*)intree->Get("deltree");

    double deltaY;
    outtree->SetBranchAddress("deltaY", &deltaY);
    TH1F *h1 = new TH1F("h1", "delta y between truth and MC-reconstruction;y[mm]", 30, -1, 1);
    //TH1F *h1 = new TH1F("h1", "delta y between truth and MC-reconstruction;y[mm]");
    outtree->Draw("deltaY>>h1(30, -1, 1)");
    }

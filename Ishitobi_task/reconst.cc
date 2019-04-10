
void reconst(TString status = "10_100", double deg = 20., double b = 0.){
    TString datafile = "Selected_"+ status + ".root";
    TString savename = "deltaY_"+ status + ".root";
    TFile *intree = new TFile(datafile, "read");
    TTree *outtree = (TTree*)intree->Get("cuttree");

    double y_sig[10];
    double z_sig[10];
    outtree->SetBranchAddress("y_sig", y_sig);
    outtree->SetBranchAddress("z_sig", z_sig);

    double deltaY;
    double a_obs;
    double b_obs;
    double theta = 2*M_PI* (deg/360);
    double a_true = 1.0/tan(theta);
    double b_true = b;
    double MeanY;
    double MeanZ;
    TFile *savefile = new TFile(savename, "recreate");
    TTree *deltree = new TTree("deltree", "after strip-cut data");
    deltree->Branch("deltaY", &deltaY, "deltaY/D");
    deltree->Branch("a_obs", &a_obs, "a_obs/D");
    deltree->Branch("b_obs", &b_obs, "b_obs/D");
    deltree->Branch("theta", &theta, "theta/D");

    int N = outtree->GetEntries();

    for(int i=0; i<N; i++){
        outtree->GetEntry(i);
        double Y =0.;
        double Z =0.;
        int n =0;
        MeanY = 0.;
        MeanZ = 0.;
        double bunsi = 0.;
        double bunbo = 0.;

        for(int j=0; j<10; j++){
            if(y_sig[j]!=10000){
                Y +=y_sig[j];
                Z +=z_sig[j];
                n +=1;
            }
        }
        MeanY = Y/n;
        MeanZ = Z/n;

        for(int j=0; j<10; j++){
            if(y_sig[j]!=10000){
                bunsi += (y_sig[j]-MeanY)*(z_sig[j]-MeanZ);
                bunbo += (y_sig[j]-MeanY)*(y_sig[j]-MeanY);
            }
        }
        a_obs = bunsi/bunbo;
        b_obs = MeanZ - a_obs*MeanY;

        deltaY = (2.5-b_true)/a_true - (2.5-b_obs)/a_obs;
        //deltaY = (3.5-b_true)/a_true - (3.5-b_obs)/a_obs;
        deltree->Fill();
    }
    deltree->Write();
    savefile->Close();
}

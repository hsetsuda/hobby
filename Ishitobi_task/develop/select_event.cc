
using namespace std;
void select_event(TString truedata = "TF_10_100.root", TString savename = "10_100.root"){
    TString SaveName = "Selected_"+ savename;
    TFile *intree = new TFile(truedata, "read");
    TTree *outtree = (TTree*)intree->Get("treeZY");

    double y_true[100];
    double z_true[100];
    double t_true[100];
    double y_obs[100];
    double z_obs[100];
    int n;
    double b;
    outtree->SetBranchAddress("y_true", y_true);
    outtree->SetBranchAddress("z_true", z_true);
    outtree->SetBranchAddress("t_true", t_true);
    outtree->SetBranchAddress("y_obs", y_obs);
    outtree->SetBranchAddress("z_obs", z_obs);
    outtree->SetBranchAddress("n", &n);
    outtree->SetBranchAddress("b", &b);

    //double y_OBS[7];
    //double z_OBS[7];
    double y_sig[10];
    double z_sig[10];
    double t_sig[10];
    double thre[10];
    double b_t;
    TFile *savefile = new TFile(SaveName, "recreate");
    TTree *cuttree = new TTree("cuttree", "after strip-cut data");
    //cuttree->Branch("y_OBS", y_OBS, "y_OBS[7]/D");
    //cuttree->Branch("z_OBS", z_OBS, "z_OBS[7]/D");
    cuttree->Branch("y_sig", y_sig, "y_sig[10]/D");
    cuttree->Branch("z_sig", z_sig, "z_sig[10]/D");
    cuttree->Branch("thre", thre, "thre[10]/D");
    cuttree->Branch("b_t", &b_t, "b_t/D");
    int N = outtree->GetEntries();

    //ofstream outputfile("AfterSelection.csv");

    for(int i=0; i<N; i++){
        outtree->GetEntry(i);
        // initialize
        for(int k=0; k<10; k++){
            y_sig[k]={10000.};
            z_sig[k]={10000.};
            t_sig[k]={10000.};
        }

        for(int j=0; j<n; j++){

            for(int k=0; k<10; k++){
                //y_OBS[k] = y_obs[j];
                //z_OBS[k] = y_obs[j];
                 //selst by y_obs value | -1.2~1.2
                 thre[k] = 0.4*k;
                if(y_obs[j]==thre[k]){
                    if(t_true[j] < t_sig[k]){
                        y_sig[k] = y_obs[j];
                        z_sig[k] = z_obs[j];
                        b_t = b;
                    }
                }
            }
        }
        cuttree->Fill();
    }
    cuttree->Write();
    savefile->Close();
}

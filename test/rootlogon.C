// Plain Jane
{
  gROOT->SetStyle("Plain");
  gStyle->SetOptStat(1111110);
  gStyle->SetOptFit(1111);

  // Allow for browsing of raw root files from CMSSW
  gSystem->Load("libFWCoreFWLite.so");
  AutoLibraryLoader::enable();
}

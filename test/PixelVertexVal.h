#include "FWCore/Framework/interface/MakerMacros.h"
#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/EDAnalyzer.h"
#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/EventSetup.h"
#include "FWCore/Framework/interface/Handle.h"
#include "FWCore/Framework/interface/ESHandle.h"
#include "FWCore/ServiceRegistry/interface/Service.h"
#include "FWCore/ParameterSet/interface/ParameterSet.h"
#include "FWCore/MessageLogger/interface/MessageLogger.h"

#include "DataFormats/TrackReco/interface/TrackFwd.h"
#include "DataFormats/TrackReco/interface/Track.h"
#include "DataFormats/VertexReco/interface/VertexFwd.h"
#include "DataFormats/VertexReco/interface/Vertex.h"

#include "RecoPixelVertexing/PixelVertexFinding/interface/PVPositionBuilder.h"
#include "RecoPixelVertexing/PixelVertexFinding/interface/PVClusterComparer.h"

#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include <TH1.h>
#include "TTree.h"
#include "TFile.h"
#include "TDirectory.h"

class PixelVertexVal : public edm::EDAnalyzer {
 public:
  explicit PixelVertexVal(const edm::ParameterSet& conf);
  ~PixelVertexVal();
  virtual void beginJob(const edm::EventSetup& es);
  virtual void analyze(const edm::Event& ev, const edm::EventSetup& es);
  virtual void endJob();
 private:
  edm::ParameterSet conf_; 
  // How noisy should I be on text output?
  int verbose_;
  std::ofstream *out_;
};

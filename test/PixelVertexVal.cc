#include "Validation/RecoPixelVertexing/test/PixelVertexVal.h"
#include <fstream>

PixelVertexVal::PixelVertexVal(const edm::ParameterSet& conf)
  : conf_(conf), verbose_(1), out_(0)
{}

PixelVertexVal::~PixelVertexVal() { 
  delete out_;
}

void PixelVertexVal::beginJob(const edm::EventSetup& es) {
  verbose_ = conf_.getUntrackedParameter<unsigned int>("Verbosity",1);
  out_ = new std::ofstream(conf_.getUntrackedParameter<std::string>("OutputFile","pixelvertexval.out").c_str());
}

void PixelVertexVal::analyze(const edm::Event& ev, const edm::EventSetup& es) {
  edm::Handle<reco::VertexCollection> vertexCollection;
  ev.getByLabel("pixelVertices",vertexCollection);
  const reco::VertexCollection vertexes = *(vertexCollection.product());
  if (verbose_ > 0) {
    //    (*out_) << "[OVAL] " << *(vertexCollection.provenance()) << std::endl;
    (*out_) << "[OVAL] " << "Reconstructed "<< vertexes.size() << " vertexes" << std::endl;
  }
  for (reco::VertexCollection::const_iterator v=vertexes.begin(); 
       v!=vertexes.end(); ++v){
    (*out_) << "[OVAL] " << v->position().z() << " += " << v->zError() << std::endl;
    (*out_) << "[OVAL] " << "Has " << v->tracksSize() << " associated tracks with the following z's: ";
    for (reco::track_iterator t = v->tracks_begin(); t != v->tracks_end(); ++t) {
      (*out_) << (*t)->dz() << " +- " << (*t)->dzError() << " ";
    }
    (*out_) << std::endl;

  }
  (*out_) << std::endl;
}

void PixelVertexVal::endJob() {
  out_->close();
}

DEFINE_FWK_MODULE(PixelVertexVal)
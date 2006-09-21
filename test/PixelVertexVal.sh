#!/bin/bash

# remove old output files if they exist
/bin/rm -f pixel_vertexing.root val-reco.out val-io.out

eval $(scramv1 runtime -sh)

echo "===========> Validating Pixel Primary Vertex Reco with 10-muon samples......."
echo "===========> Validating reconstruction....."
cmsRun val-reco.cfg
cat val-reco.out

echo "===========> Validating I/O....."
cmsRun val-io.cfg
cat val-io.out

#!/bin/bash

# remove old output root file if it exists
/bin/rm -f pixel_vertexing.root

eval $(scramv1 runtime -sh)

echo "===========> Validating Pixel Primary Vertex Reco with 10-muon samples......."
echo "===========> Validating reconstruction....."
cmsRun val-reco.cfg
cat val-reco.out

echo "===========> Validating I/O....."
cmsRun val-io.cfg
cat val-io.out

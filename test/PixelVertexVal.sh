#!/bin/bash

eval $(scramv1 runtime -sh)

echo "===========> Validating Pixel Primary Vertex Reco with 10-muon samples......."
echo "===========> Validating reconstruction....."
cmsRun val-reco.cfg
setenv REFFILE "../data/val-reco.out"
setenv CURFILE "val-reco.out"
diff -iub ${CURFILE} ${REFFILE}

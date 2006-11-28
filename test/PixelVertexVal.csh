#!/bin/csh -f

eval `scramv1 runtime -csh`

echo "===========> Validating reconstruction....."
cmsRun vtx-reco.cfg
root -b -p -q DoCompare.C\(\"pixelVertexHistos_Val\",\"../data/pixelVertexHistos.root\"\)
#root -b -p -q DoCompare.C\(\"pixelVertexHistos_Tut\"\)

echo "===========> Validating I/O....."
cmsRun vtx-io.cfg
root -b -p -q DoCompare.C\(\"pixelVertexHistos_ioVal\",pixelVertexHistos_Val\"\)


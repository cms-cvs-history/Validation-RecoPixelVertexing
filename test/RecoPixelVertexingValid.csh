#! /bin/csh

eval `scramv1 runtime -csh`

#scramv1 b bin

echo "===========> Validating Pixel Primary Vertex Reco with 10-muon samples......."
echo "===========> Validating reconstruction....."
cmsRun test.cfg
#root -b -p -q DoCompare.C\(\"pixelTrackHistos_Val\"\)

root -b -p -q DoCompare.C\(\"pixelTrackHistos_Val\",\"../data/pixelTrackHistos\"\)
root -b -p -q DoCompare.C\(\"pixelVertexHistos_Val\",\"../data/pixelVertexHistos.root\"\)

echo "===========> Validating storage....."
cmsRun test-io.cfg
root -b -p -q DoCompare.C\(\"pixelTrackHistos_ioVal\",\"pixelTrackHistos\"\)
root -b -p -q DoCompare.C\(\"pixelVertexHistos_ioVal\",pixelVertexHistos_Val\"\)


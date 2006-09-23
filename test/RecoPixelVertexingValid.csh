#! /bin/csh

eval `scramv1 runtime -csh`

#scramv1 b bin

echo "===========> Validating Pixel Primary Vertex Reco with 10-muon samples......."
echo "===========> Validating reconstruction....."
cmsRun test.cfg
setenv REFFILE "../data/pixelTrackHistos.root"
setenv CURFILE         "pixelTrackHistos_Val.root"
root -b -p -q DoCompare.C\(\"pixelTrackHistos_Val\"\)
setenv REFFILE "../data/pixelVertexHistos.root"
setenv CURFILE "pixelVertexHistos_Val.root"
root -b -p -q DoCompare.C\(\"pixelVertexHistos_Val\"\)


echo "===========> Validating storage....."
cmsRun test-io.cfg
setenv REFFILE "pixelTrackHistos_Val.root"
setenv CURFILE "pixelTrackHistos_ioVal.root"
root -b -p -q DoCompare.C\(\"pixelTrackHistos_ioVal\"\)
setenv REFFILE "pixelVertexHistos_Val.root"
setenv CURFILE "pixelVertexHistos_ioVal.root"
root -b -p -q DoCompare.C\(\"pixelVertexHistos_ioVal\"\)


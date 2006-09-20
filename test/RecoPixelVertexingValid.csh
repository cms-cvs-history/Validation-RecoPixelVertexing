#! /bin/csh

eval `scramv1 runtime -csh`

#scramv1 b bin

echo "===========> Validating Pixel Primary Vertex Reco with 10-muon samples......."
echo "===========> Validating reconstruction....."
cmsRun test.cfg
setenv REFFILE "../data/pixel_vertices_10muons.root"
setenv CURFILE "pixel_vertices.root"
root -b -p -q DoCompare.C\(\"_10muons\"\)


echo "===========> Validating storage....."
cmsRun test-io.cfg
setenv REFFILE "pixel_vertices.root"
setenv CURFILE "pixel_vertices_iotest.root"
root -b -p -q DoCompare.C\(\"_iotest\"\)

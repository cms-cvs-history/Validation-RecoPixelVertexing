#! /bin/csh

eval `scramv1 runtime -csh`

#scramv1 b bin

echo "===========> Validating Pixel Track reconstruction....."
cmsRun trk-reco.cfg
root -b -p -q DoCompare.C\(\"pixelTrackHistos_Val\",\"../data/pixelTrackHistos\"\)
#root -b -p -q DoCompare.C\(\"pixelTrackHistos_Tut\"\)

echo "===========> Validating Pixel Track storage....."
cmsRun trk-io.cfg
root -b -p -q DoCompare.C\(\"pixelTrackHistos_ioVal\",\"pixelTrackHistos\"\)


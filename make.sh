echo ${PWD}/svg/
find ${PWD}/svg/ -type f -name \*.svg | while read LINE
do
  INPUTDIR=$( dirname ${LINE})
  OUTPUTDIR=${INPUTDIR/#${PWD}\/svg/${PWD}\/out}
  INPUT=$( basename ${LINE})
  OUTPUT=${INPUT/.svg/.png}
  echo docker run --rm -v ${INPUTDIR}:/input -v ${OUTPUTDIR}:/output docker.io/illallangi/toolbx:local rsvg-convert /input/${INPUT} -o /output/${OUTPUT} -d 600 -p 600
  docker run --rm -v ${INPUTDIR}:/input -v ${OUTPUTDIR}:/output docker.io/illallangi/toolbx:local rsvg-convert /input/${INPUT} -o /output/${OUTPUT} -d 600 -p 600
  echo
done

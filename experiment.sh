yarn install > /dev/null

if ! pushd ./SpeCS/src > /dev/null; then
  echo "Make sure the submodule is installed"
  exit 1
fi

# Check if make succeeds
if ! make > /dev/null; then
  echo "Check the dependencies of SpeCS"
  exit 1  
fi

clear

popd > /dev/null

yarn node index.mjs

echo
echo
echo "press any button ..."

read

# This is to use SpeCS, also it seems like there is a bug where the super and the sub query are inverted
echo "superquery:" > queries
cat ./subQuery.rq >> queries
echo >> queries
echo >> queries
echo >> queries
echo "subquery:" >> queries
cat ./superQuery.rq >> queries

echo "SpeCS assume set semantic and says ..."
./SpeCS/src/specs -file ./queries -qc | grep -q "^sat" && echo "> the sub query is contained in the super query" || echo "> the sub query is not contained in the super query"

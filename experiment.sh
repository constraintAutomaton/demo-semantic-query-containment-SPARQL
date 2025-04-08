# demo-semantic-query-containment-SPARQL: A program that launch a demo to
# understand the semantic of SPARQL in the context of query containment
# Copyright (C) 2025  Bryan-Elliott Tam
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

bun install > /dev/null

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

bun run index.mjs

echo
echo
echo "press any button ..."

read

# This is to use SpeCS, also it seems like there is a bug where the super and the sub query are inverted
echo "superquery:" > queries
cat ./superQuery.rq >> queries
echo >> queries
echo >> queries
echo >> queries
echo "subquery:" >> queries
cat ./subQuery.rq >> queries


echo "SpeCS assume set semantic and says ..."
./SpeCS/src/specs -file ./queries -qc | grep -q "^unsat" && echo "> the sub query is contained in the super query" || echo "> the sub query is not contained in the super query"

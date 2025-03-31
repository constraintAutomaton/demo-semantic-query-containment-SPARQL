// demo-semantic-query-containment-SPARQL: A program that launch a demo to
// understand the semantic of SPARQL in the context of query containment
// Copyright (C) 2025  Bryan-Elliott Tam
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import { QueryEngine } from '@comunica/query-sparql-file';
import {readFile} from 'node:fs/promises';

const engine = new QueryEngine();

const sources = ['./source.ttl'];
const querySub = (await readFile("./subQuery.rq")).toString();
const querySuper = (await readFile("./superQuery.rq")).toString();

const bindingStreamSubQuery = await engine.queryBindings(querySub, {
    sources
});

bindingStreamSubQuery.on('error', (error) => {
    console.error(error);
});

const resultSubQuery = [];

for await (const binding of bindingStreamSubQuery) {
    resultSubQuery.push(JSON.stringify(JSON.parse(binding.toString()), null, 2));
}


const bindingStreamSuperQuery = await engine.queryBindings(querySuper, {
  sources
});

bindingStreamSuperQuery.on('error', (error) => {
  console.error(error);
});

bindingStreamSuperQuery.on('error', (error) => {
    console.error(error);
});

const resultsSuperQuery = [];

for await (const binding of bindingStreamSuperQuery) {
    resultsSuperQuery.push(JSON.stringify(JSON.parse(binding.toString()), null, 2));
}

  console.log(`result subquery: ${resultSubQuery}\n---\nresult superquery: ${resultsSuperQuery}`);

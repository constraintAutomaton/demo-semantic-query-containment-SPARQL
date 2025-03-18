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

  console.log(`result sub query: ${resultSubQuery}\n---\nresult super query: ${resultsSuperQuery}`);

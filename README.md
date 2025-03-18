# demo-wrong-semantic-query-containment-specs

This repository demonstrates how the semantics of SPARQL queries—specifically the distinction between bag and set semantics—affects query containment. It utilizes [speCS](https://github.com/mirkospasic/SpeCS) as a solver.

## Output of the demo
Given the sub query
```nq
PREFIX ex: <http://example.org/>

SELECT ?s ?age WHERE  {
  ?s ex:job ?job ;
     ex:age ?age .
     
  FILTER(?age > 18)
}
```
and the super query
```nq
PREFIX ex: <http://example.org/>

SELECT ?s ?age WHERE {
  ?s ex:age ?age .
}
```
and the data source

```ttl
@prefix ex: <http://example.org/> .

ex:jan a ex:student ;
    ex:age 16 ;
    ex:job "Cashier" .

ex:josette a ex:student ;
    ex:age 25 ;
    ex:job "Cook" ;
    ex:job "Painter" .

ex:jos a ex:worker ;
    ex:age 30;
    ex:job "Engineer".
```

```sh
result sub query: {
  "s": "http://example.org/josette",
  "age": "\"25\"^^http://www.w3.org/2001/XMLSchema#integer"
},{
  "s": "http://example.org/josette",
  "age": "\"25\"^^http://www.w3.org/2001/XMLSchema#integer"
},{
  "s": "http://example.org/jos",
  "age": "\"30\"^^http://www.w3.org/2001/XMLSchema#integer"
}
---
result super query: {
  "s": "http://example.org/jan",
  "age": "\"16\"^^http://www.w3.org/2001/XMLSchema#integer"
},{
  "s": "http://example.org/josette",
  "age": "\"25\"^^http://www.w3.org/2001/XMLSchema#integer"
},{
  "s": "http://example.org/jos",
  "age": "\"30\"^^http://www.w3.org/2001/XMLSchema#integer"
}


press any button ...

SpeCS assume set semantic and say ...
> the sub query is contained in the super query
```
We expect the subquery to be contained within the superquery because it is more restrictive, 
it requires the person to have a job and be older than 16 years, whereas the superquery only considers the person's age.
However, when executing the queries, Josette appears twice in the subquery because she had two jobs, whereas she appears only once in the superquery.
As a result, the output of the superquery is not a subset of the subquery’s output, meaning the subquery is not contained within the superquery.
This demonstrates how SPARQL’s bag semantics, despite triple stores being set semantic, have a significant impact on query containment and must be carefully considered in real-world applications.

## Dependencies

Ensure the following dependencies are installed before running the demo:

### General Dependencies
- [Yarn v1.22.22](https://classic.yarnpkg.com/lang/en/)
- [Node.js v20](https://nodejs.org/en)

### SpeCS Dependencies
- [Make](https://www.gnu.org/software/make/)
- [G++](https://gcc.gnu.org/)
- [Flex](https://github.com/westes/flex)
- [Bison](https://www.gnu.org/software/bison/)
- [Z3 Theorem Prover](https://github.com/Z3Prover/z3)

## Running the Demo

Once all dependencies are installed, execute the following command:

```sh
./experiment.sh
```

This script will automatically run the demo.

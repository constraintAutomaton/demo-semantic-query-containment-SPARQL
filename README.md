# demo-wrong-semantic-query-containment-specs

This repository demonstrates how the semantics of SPARQL queries—specifically the distinction between bag and set semantics—affects query containment. It utilizes [speCS](https://github.com/mirkospasic/SpeCS) as a solver.

## Output of the demo

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

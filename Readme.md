# demo-wrong-semantic-query-containment-specs

This repository demonstrates how the semantics of SPARQL queries—specifically the distinction between bag and set semantics—affects query containment. It utilizes [speCS](https://github.com/mirkospasic/SpeCS) as a solver.

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

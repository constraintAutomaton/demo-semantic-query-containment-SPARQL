# federated_queries_semantic

- (exp_1) In a federated settings we get a bag for duplicate values in the datasets because we suppose a union of bag and not a union of set.

```json
{
  federatedResults: [
    '{\n' +
      '  "p": "http://example.com/duplicateP1",\n' +
      '  "o": "http://example.com/duplicateO1"\n' +
      '}',
    '{\n' +
      '  "p": "http://example.com/duplicateP1",\n' +
      '  "o": "http://example.com/duplicateO1"\n' +
      '}'
  ],
  singleResults: [
    '{\n' +
      '  "p": "http://example.com/duplicateP1",\n' +
      '  "o": "http://example.com/duplicateO1"\n' +
      '}'
  ]
}
```

- (exp_2) There can be a query that is contained in single endpoint (set semantic database) and not in federated endpoint (bag semantic)

```json
{
  federatedResults: [
    '{\n  "p": "http://example.com/duplicateP3"\n}',
    '{\n  "p": "http://example.com/duplicateP3"\n}'
  ],
  singleResults: [ '{\n  "p": "http://example.com/duplicateP3"\n}' ]
}
```
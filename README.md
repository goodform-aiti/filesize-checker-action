# filesize-checker-action

This check the file-size of modified files.


## Example usage

```yml
name: Lint

on: [push]

jobs:
  csv-linters:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@master
    - name: csv lint
      uses: ateli-development/csvlint-action@master
      env:
        MODIFIED_FILES: ${{ steps.file_changes.outputs.files}}
        FILE_SIZE: 5000 # bytes
```

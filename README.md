# CRDC-H Model in LinkML

This repository stores the [LinkML](https://linkml.github.io/) representation of the [CRDC Harmonized Data Model (CRDC-H)](https://cancerdhc.github.io/) produced by the [Center for Cancer Data Harmonization (CCDH)](https://harmonization.datacommons.cancer.gov/).

This repository includes [the LinkML model itself](./model/schema/crdch_model.yaml) (in [YAML](https://en.wikipedia.org/wiki/YAML) format) as well as a number of artifacts produced automatically by LinkML, including a JSON Schema, JSON-LD context, a GraphQL description, a CSV description and ShEx validation shapes.

Model documentation in Markdown can also be generated for this repository, and is currently hosted on GitHub Pages at https://cancerdhc.github.io/ccdhmodel/. A set of Python Data Classes can also be generated and are [available for use](./crdch_model/crdch_model.py). Examples of their use are available in the [Example Data](https://github.com/cancerDHC/example-data/) repository.

## Setup

### Automated generation of YAML

The model YAML files are programmatically generated from [the Google Sheet](https://docs.google.com/spreadsheets/d/1oWS7cao-fgz2MKWtyr8h2dEL9unX__0bJrWKv6mQmM4/). The code that generates the YAMLs are in the [`./generators/google-sheets`](./generators/google-sheets) directory. The `regen-google-sheet` target in the Makefile can update the schema from Google Sheets automatically.

### Generation of LinkML artifacts

All artifacts can be generated by running `make` in this repository. `make clean` will delete generated existing artifacts, allowing them to be regenerated. This Makefile uses [Pipenv](https://pipenv.pypa.io/) to manage dependencies.

We use [mike](https://github.com/jimporter/mike) to publish documentation to GitHub Pages. Use `mike deploy [version] -p` to push a new version of the documentation to Google Pages (via the `gh-pages` branch). `mike deploy [version] latest -p -u` can be used to indicate that the uploaded version should be used as the `latest` version, which will be displayed by default.

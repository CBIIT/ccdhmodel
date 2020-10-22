PARMS="--no-mergeimports"
for filename in model/*.yaml; do
    basename=$(basename -- "$filename")
    BASE="${basename%.*}"
    echo Generating $filename
    gen-python $PARMS model/$BASE.yaml > ccdhmodel/$BASE.py --log_level INFO
    rm -rf docs/$BASE
    gen-markdown $PARMS model/$BASE.yaml -d docs/$BASE -i
    gen-jsonld $PARMS model/$BASE.yaml > jsonld/$BASE.jsonld
    gen-jsonld-context $PARMS model/$BASE.yaml > jsonld/$BASE.context.jsonld
    gen-json-schema $PARMS model/$BASE.yaml > json-schema/$BASE.json
done
gen-jsonld-context $PARMS model/prefixes.yaml > includes/prefixes.context.jsonld

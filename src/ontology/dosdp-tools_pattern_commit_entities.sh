## CSV-direct entity addition method
# 5. Compile the robot template
robot template \
    --template modules/entity_attribute_location.csv \
    -i envo-edit.owl \
    --prefix "ENVO:http://purl.obolibrary.org/obo/ENVO_"  \
    --ontology-iri "http://purl.obolibrary.org/envo/modules/entity_attribute_location.owl" convert \
    --format ofn \
    -o modules/entity_attribute_location.owl

# 6. Run robot merge
robot merge \
    --input envo-edit.owl \
    --input modules/temporary_robot_template.owl \
    --collapse-import-closure false convert \
    --format ofn \
    --output envo-edit.owl

## Dosdp-tools pattern entity addition method
### Working merge ###
# dosdp-tools creates temp owl file for robot 'annotate' feed 
dosdp-tools generate \
    --table-format=csv \
    --obo-prefixes=true \
    --template=./patterns/entity_attribute_location.yaml \
    --infile=modules/entity_attribute_location.csv \
    --outfile=modules/entity_attribute_location.tmp.owl
# robot annotate to 
robot annotate \
    --input modules/entity_attribute_location.tmp.owl \
    -O http://purl.obolibrary.org/obo/envo/modules/entity_attribute_location.owl \
    --output modules/entity_attribute_location.owl \
    && \
rm modules/entity_attribute_location.tmp.owl
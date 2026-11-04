## Customize Makefile settings for agro
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

# ----------------------------------------
# agro-terms.csv: flat table of AgrO terms for non-ontologists (#73)
# ----------------------------------------
# Built from the full release so parents include inferred superclasses.
# Only AGRO_ classes are listed, which leaves out imported upper-level classes.

agro-terms.csv: agro.owl $(SPARQLDIR)/agro-terms-table.sparql
	$(ROBOT) query --input $< --format csv --query $(SPARQLDIR)/agro-terms-table.sparql $@

ASSETS += agro-terms.csv
RELEASE_ASSETS += agro-terms.csv

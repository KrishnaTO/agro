# Changelog

Infrastructure and tooling changes to the AgrO repository. Ontology content releases are tagged `vYYYY-MM-DD` on GitHub.

## feat-73-terms-csv: Release a CSV of AgrO terms

### Added
- `agro-terms.csv` release file: one row per non-obsolete AgrO class with ID, label, definition, parent labels and exact synonyms. It's for agronomists and developers who don't use OWL tools ([#73](https://github.com/AgriculturalSemantics/agro/issues/73)). It's built from the reasoned full release, so parents include inferred superclasses, and it lists only `AGRO_` classes, which leaves out imported upper-level classes. Multiple parents or synonyms are separated by `|`.
- `src/sparql/agro-terms-table.sparql`: the query behind the CSV.
- `agro.Makefile`: an `agro-terms.csv` rule, added to `ASSETS` and `RELEASE_ASSETS` so `make prepare_release` builds it and copies it to the repository root.

## fix-183-agronomic-fertilizer: Fix agronomic fertilizer definition typo

### Fixed
- `agro-edit.owl`: the definition of "agronomic fertilizer" (`AGRO:00002062`) said "enviromental" instead of "environmental" ([#183](https://github.com/AgriculturalSemantics/agro/issues/183)). The duplicated placement under "environmental material" reported in that issue came from the 2022 ENVO import and was already fixed by the ENVO import refresh.
## fix-192-description-typo: Fix ontology description typo

### Fixed
- `agro-edit.owl`: the ontology header's `dcterms:description` said "ontlogy" instead of "ontology" ([#192](https://github.com/AgriculturalSemantics/agro/issues/192)).
## fix-202-mulch-removal-date: Fix "mulch removal date" typo

### Fixed
- `eq.tsv` and `definitions.owl`: "much removal date" (`AGRO:00010141`) is now "mulch removal date", and its definition now says "mulch removal process" ([#202](https://github.com/AgriculturalSemantics/agro/issues/202)).
## fix-187-obi-import: Refresh OBI import

### Changed
- `imports/obi_import.owl`: regenerated with ODK v1.6.1 from OBI 2026-07-27 (`make refresh-obi`). The 2022 module declared 52 UO units, including picomole, nanomole and micromole, as individuals of "substance unit" as well as classes, so they appeared twice ([#187](https://github.com/AgriculturalSemantics/agro/issues/187)). ODK's import configuration excludes individuals, so the units are now classes only. All 29 OBI terms that AgrO uses are still in the module.
## ntr-196-inbred-line: Add inbred line

### Added
- `agro-edit.owl`: "inbred line" (`AGRO:00010174`), under "crop" (`AGRO:00000325`) ([#196](https://github.com/AgriculturalSemantics/agro/issues/196)).
## ntr-195-plant-work-helper: Add plant work helper

### Added
- `agro-edit.owl`: "plant work helper" (`AGRO:00010173`), under "person role within the experiment" (`AGRO:00000378`) ([#195](https://github.com/AgriculturalSemantics/agro/issues/195)).
## ntr-152-production-hedges: Add production hedges

### Added
- `agro-edit.owl`: "production hedges" (`AGRO:00010175`), under "intercropping" (`AGRO:00000516`) ([#152](https://github.com/AgriculturalSemantics/agro/issues/152)).
## ntr-194-growth-chamber: Add growth chamber

### Added
- `agro-edit.owl`: "growth chamber" (`AGRO:00010172`), under "experimental site" (`AGRO:00000360`) ([#194](https://github.com/AgriculturalSemantics/agro/issues/194)).
## ntr-193-break-crop-role: Add break crop role

### Added
- `agro-edit.owl`: "break crop role" (`AGRO:00010171`), under "crop role" (`AGRO:00002001`) ([#193](https://github.com/AgriculturalSemantics/agro/issues/193)).
## ntr-185-live-haul-trailer: Add live haul trailer

### Added
- `agro-edit.owl`: "live haul trailer" (`AGRO:00010170`), under "animal transportation equipment" (`AGRO:00000671`) ([#185](https://github.com/AgriculturalSemantics/agro/issues/185)).
## ntr-184-dead-haul-trailer: Add dead haul trailer

### Added
- `agro-edit.owl`: "dead haul trailer" (`AGRO:00010169`), under "animal transportation equipment" (`AGRO:00000671`) ([#184](https://github.com/AgriculturalSemantics/agro/issues/184)).
## ntr-203-plant-life-cycle-dates: Add plant life cycle dates

### Added
- `agro-edit.owl`: "germination date" (`AGRO:00010176`), under "plant phenological trait" (`TO:0000933`) ([#203](https://github.com/AgriculturalSemantics/agro/issues/203)).
- `agro-edit.owl`: "emergence date" (`AGRO:00010177`), under "plant phenological trait" (`TO:0000933`) ([#203](https://github.com/AgriculturalSemantics/agro/issues/203)).
- `agro-edit.owl`: "50% emergence date" (`AGRO:00010178`), under "plant phenological trait" (`TO:0000933`) ([#203](https://github.com/AgriculturalSemantics/agro/issues/203)).
- `agro-edit.owl`: "flowering date" (`AGRO:00010179`), under "plant phenological trait" (`TO:0000933`) ([#203](https://github.com/AgriculturalSemantics/agro/issues/203)).
- `agro-edit.owl`: "50% flowering date" (`AGRO:00010180`), under "plant phenological trait" (`TO:0000933`) ([#203](https://github.com/AgriculturalSemantics/agro/issues/203)).
- `imports/to_terms.txt`: added "plant phenological trait" (`TO:0000933`), the parent of the new dates, and refreshed `to_import.owl`.

## claude/relaxed-franklin-27phmy: Migrate to ODK v1.6.1

### Added
- `src/ontology/agro-odk.yaml`: ODK project configuration. It sets up 15 imports, ELK reasoning, `full` (primary) and `base` releases, and OWL and OBO exports.
- Files generated by ODK v1.6.1: `src/ontology/Makefile`, `src/ontology/agro.Makefile` (local overrides), `run.sh`, `run.bat`, `catalog-v001.xml`, `src/sparql/` QC queries, and `src/scripts/`.
- `.github/workflows/qc.yml`: ODK QC workflow on `obolibrary/odkfull:v1.6.1` with `actions/checkout@v4`. It runs on pushes and pull requests to `master`.
- An ODK DOSDP pattern pipeline in `src/patterns/`: `eq.yaml` is in `dosdp-patterns/` and `eq.tsv` is in `data/default/`.
- A "build" section in `README.md`.

### Changed
- `agro-edit.owl`: the ontology IRI is now `http://purl.obolibrary.org/obo/agro.owl` (the ODK convention), and the edit file imports `agro/patterns/definitions.owl` instead of `agro/patterns/eq.owl`. `definitions.owl` starts out with the same content as the previous `eq.owl`.
- `.gitignore` is replaced by the ODK-managed version.
- `src/ontology/README-editors.md` is replaced by the ODK v1.6.1 editor guide.
- The CI badge now points to GitHub Actions instead of Travis.
- `imports/iao_terms.txt`: added the six IAO annotation properties used by `agro-edit.owl` that only the full IAO import used to provide (example of usage, editor note, definition source, obsolescence reason, curator note, term replaced by). Together with the existing `IAO_0000700`, they're added to `iao_import.owl` on the next `make refresh-imports`.
- Fixed the inferred equivalences that ODK's `reason_test` rejects:
  - `eq.tsv` and `definitions.owl`: "pruning date" (`AGRO:00010129`) pointed at `AGRO:00000027` (thinning process) instead of `AGRO:00000566` (pruning process).
  - `agro-edit.owl`: forage harvester, reaper and digger (`AGRO:00000540`–`542`) had the same equivalence axiom as plant harvest implement (`AGRO:00000234`). "number of crops previously cultivated" (`AGRO:00000327`) and "number of square meter harvested" (`AGRO:00000558`) had the same one as "number of crops" (`AGRO:00000326`). These five axioms are now `SubClassOf` statements, so each class sits under the general class instead of being equivalent to it.
- `agro-edit.owl`: switched from the deprecated DC Elements 1.1 namespace to DC Terms (`creator`, `contributor`, `date`, `description`, `source`, `title`), as ODK's `dc-properties` check requires.
- `agro-edit.owl`: the `tillage_technique` subset is now a declared subset property (`obo:agro#tillage_technique`, a sub-property of `oboInOwl:SubsetProperty`) instead of a text value, as ODK's `iri-range` check requires.
- `agro-edit.owl`: fixed the OWL 2 DL profile violations:
  - Removed a stray `DatatypeDefinition(xsd:base64Binary xsd:Name)`, which redefined a built-in datatype.
  - "relay cropping experiment" (`AGRO:00002000`): changed `min 1` to `some`, which means the same thing.
  - Cardinality restrictions on the non-simple `has participant` (RO:0000057) aren't allowed in OWL 2 DL. They're now `SubClassOf … has participant some crop` on inter-cropping experiment (`AGRO:00020000`, was an equivalence with `min 2`), mono-cropping experiment (`AGRO:00000480`, was an equivalence with `exactly 1`) and intercropping (`AGRO:00000516`, was `min 2`). ELK ignores cardinality, so no inferences change, and the counts are still in the text definitions. Inter-cropping experiment's restriction also read "has role some crop", but crop is an organism, not a role, so ELK found the class unsatisfiable once it could read the axiom. It now says "has participant some crop".
- `imports/`: regenerated `uo_import.owl`, `envo_import.owl`, `iao_import.owl` and `bfo_import.owl` with ODK v1.6.1 (`make refresh-<id>`). The November 2022 UO and ENVO modules contained classes the reasoner found equivalent, which failed the `agro-full.owl` build. The ChEBI and NCBITaxon modules are unchanged, because the ChEBI download timed out.
- `src/metadata/agro.yml`: fixed the PURL product URL, which was missing the `agro` repository segment.

### Removed
- Travis CI (`.travis.yml`) and the old `main.yaml` workflow, which was pinned to ODK v1.2.26.
- The hand-written Makefile rules. The ODK Makefile now handles imports, patterns and releases.
- The direct import of the full IAO `2020-12-09` release. IAO terms now come only from `imports/iao_import.owl`.
- The unused PCO import (`pco_import.owl`, `pco_terms.txt`). The edit file never imported it.
- Build outputs that were committed under `src/ontology` (`agro.owl`, `agro.obo`).
- Pattern inputs already merged into `agro-edit.owl` (`chemical_area_density*`) and the obsolete `patterns/old/` scripts. They are still in git history.
- The unapplied draft patterns (`entity_attribute_location`, `chemical_entities`) moved to `src/patterns/drafts/`.

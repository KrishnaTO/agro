# Download file from https://bioportal.bioontology.org/ontologies/AGRO/
library(dplyr)
agro <-read.csv("AGRO.csv")[,c("Preferred.Label","Class.ID")]
agro[duplicated(agro[1]),]
dup <- rbind(agro[duplicated(agro[1]),], agro[match(agro[duplicated(agro[1]),][,1], agro[,1]),])
write.csv(dup %>% arrange(Preferred.Label), file = "dup_terms.csv")

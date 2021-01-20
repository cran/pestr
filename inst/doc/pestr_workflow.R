## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library('dplyr')

## ----eval = FALSE-------------------------------------------------------------
#  eppo_token <- create_eppo_token('<<your_EPPO_token>>')

## ----eval = FALSE-------------------------------------------------------------
#  eppo_database_download()

## ----eval = F-----------------------------------------------------------------
#  eppo_SQLite <- eppo_database_connect()

## ----eval = FALSE-------------------------------------------------------------
#  # Create vector of names that you are looking for
#  pests_query <- c('Cydia', "Triticum aestivum", "abcdef", "cadang")

## ----eval = FALSE-------------------------------------------------------------
#  pest_names <- eppo_names_tables(pests_query, eppo_SQLite)
#  names(pest_names)
#  #names that exist in database
#  head(pest_example[[1]], 5)
#  #names that were not found
#  head(pest_example[[2]], 5)
#  #preferred names for eppocodes from first table
#  head(pest_example[[3]], 5)
#  #all names that are associated to eppocodes from first data frame
#  head(pest_example[[4]], 5)

## ----eval = TRUE, echo = FALSE------------------------------------------------
names_example <- readRDS("vignette_mock_names.RDS")
names(names_example)
names_example[[1]] %>% 
  head(5) %>%
  knitr::kable(caption = "Names that exist in database", format = "html",
               table.attr = "style='width:80%;'")
names_example[[3]] %>%
  head(5) %>%
  knitr::kable(caption = 'Preferred names for eppocodes from first table',format = "html",
               table.attr = "style='width:80%;'")
names_example[[4]] %>%
  head(5) %>%
  knitr::kable(caption = 'All names that are associated to eppocodes from first data frame',format = "html",
               table.attr = "style='width:80%;'")

## ----eval = FALSE-------------------------------------------------------------
#  pests_cat <- eppo_tabletools_cat(pest_names, eppo_token)
#  #long format table
#  head(pests_cat[[1]], 5)
#  #comapct table with information for each eppocode condensed into one cell
#  head(pests_cat[[2]],5)

## ----eval = TRUE, echo = FALSE------------------------------------------------
cat_example <- readRDS("vignette_mock_cat.RDS")

cat_example[[1]] %>%
  head(5) %>%
  knitr::kable(caption = "Long format table with pests categorization")

cat_example[[2]] %>%
  head(5) %>%
  knitr::kable(caption = "Compact table with condensed information on categorization")


## ----eval = FALSE-------------------------------------------------------------
#  pests_cat <- eppo_tabletools_cat(token = eppo_token,
#                                   raw_eppocodes = c("LASPPA", "TRZAX", "CCCVD0"),
#                                   use_raw_codes = TRUE)
#  pest_cat[[2]]

## ----eval = TRUE, echo = FALSE------------------------------------------------
cat_raw_example <- readRDS("vignette_raw_cat.RDS")
cat_raw_example[[2]] %>%
  knitr::kable(caption = "Limited results of using eppocodes LASPPA, TRZAX, CCCVD0")

## ----eval = FALSE-------------------------------------------------------------
#  pests_hosts <- eppo_tabletools_hosts(pest_names, eppo_token)
#  
#  head(pests_hosts[[1]], 5)
#  head(pests_hosts[[2]], 5)

## ----eval = TRUE, echo = FALSE------------------------------------------------
hosts_example <- readRDS("vignette_mock_hosts.RDS")
hosts_example[[1]] %>%
  head(5) %>%
  knitr::kable(caption = "Long format table with pests hosts")
hosts_example[[2]] %>%
  head(5) %>%
  knitr::kable(caption = "Compact table with condensed information on hosts")

## ----eval = FALSE-------------------------------------------------------------
#  virs_eppocodes <- pest_names$all_associated_names %>%
#    dplyr::filter(grepl("viroid", fullname) | grepl("virus", fullname)) %>%
#    .[,5] %>% #eppocodes are in 5th column
#    unique()

## ----eval = FALSE-------------------------------------------------------------
#  virs_taxonomy <- eppo_tabletools_taxo(token = eppo_token,
#                                        raw_eppocodes = virs_eppocodes,
#                                        use_raw_codes = TRUE)
#  virs_taxonomy$long_table #you can also access list elements by their names
#  virs_taxonomy$compact_table

## ----eval = TRUE, echo = FALSE------------------------------------------------
example_taxo <- readRDS("vignette_viroid_taxo.RDS")
example_taxo$long_table %>%
  knitr::kable(caption = "Long table of viruses and viroids taxonomy")
example_taxo$compact_table %>%
  knitr::kable(caption = "Compact table of viruses and viroids taxonomy")

## ----eval = FALSE-------------------------------------------------------------
#  abies_pests <- eppo_tabletools_pests(token = eppo_token,
#                                       raw_eppocodes = "ABIAL",
#                                       use_raw_codes = TRUE)
#  head(abies_pests[[1]], 5)
#  head(abies_pests[[2]], 5)

## ----eval = TRUE, echo = FALSE------------------------------------------------
example_pests <- readRDS("vignette_mock_pests.RDS")
example_pests$long_table %>%
  head(5) %>%
  knitr::kable(caption = "Long table of Abies alba pests")
example_pests$compact_table %>%
  head(5) %>%
  knitr::kable(caption = "Compact table of Abies alba pests")

## ----eval = FALSE-------------------------------------------------------------
#  pest_distri <- eppo_tabletools_distri(pest_names)
#  head(pestr_distri[[1]], 5)
#  head(pestr_distri[[2]], 5)

## ----evel = TRUE, echo = FALSE------------------------------------------------
example_distri <- readRDS("vignette_mock_distri.RDS")
example_distri$long_table %>%
  head(5) %>%
  knitr::kable(caption = "Long table with distribution of pests")
example_distri$compact_table %>%
  head(5) %>%
  knitr::kable(caption = "Compact table with distribution of pests")

## ----eval = FALSE-------------------------------------------------------------
#  eppo_fulltable <- eppo_table_full(c("Meloidogyne ethiopica", "Crataegus mexicana"),
#                                    eppo_SQLite,
#                                    eppo_token)
#  
#  eppo_fulltable

## ----eval = TRUE, echo = FALSE------------------------------------------------
example_full_table <- readRDS("vignette_mock_full_table.RDS")
example_full_table %>%
  knitr::kable()


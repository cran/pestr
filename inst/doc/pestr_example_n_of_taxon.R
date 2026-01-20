## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE,
  message = FALSE,
  fig.show = "hold",
  fig.width = 7,
  fig.height = 5
)

## ----setup--------------------------------------------------------------------
# Load packages
library("pestr")
library("dplyr")

## ----eval = FALSE, echo = TRUE------------------------------------------------
#  abies_alba <- eppo_names_tables("Abies alba")

## ----eval = FALSE, echo = TRUE------------------------------------------------
#  ### Firsr create eppo_token variable
#  eppo_token <- eppo_create_token("<place your eppo token here>")
#  
#  ### For token argument, please use eppo_token
#  abies_alba_pests <- eppo_tabletools_pests(token = eppo_token,
#                                            raw_eppocodes = "ABIAL",
#                                            use_raw_codes = TRUE)

## ----eval = TRUE, echo = FALSE------------------------------------------------
abies_alba_pests <- readRDS("vignette_mock_pests.RDS")

## ----eval = TRUE, echo = TRUE-------------------------------------------------
str(abies_alba_pests)

## ----eval = TRUE, echo = TRUE-------------------------------------------------
### First select colums labelclass from long_table element,
### and use table to check frequencies
abies_alba_pests$long_table %>%
  dplyr::select(labelclass) %>%
  table()

### Than we can create very simple barplot to visualize number of
### species in particular type of pest - experimental, host and major host
abies_alba_pests$long_table %>%
  dplyr::select(labelclass) %>%
  table() %>%
  barplot(xlab = "Type of pest", ylab = "Number of species",
           col = "#AF0011", ylim = c(0, 30))

## ----eval = TRUE, echo = TRUE-------------------------------------------------
### Extract eppocodes of pests
pests_eppocodes <- abies_alba_pests$long_table %>%
  dplyr::select(pests_eppocode) %>%
  unlist()

## ----eval = FALSE, echo = TRUE------------------------------------------------
#  pests_taxonomy <- eppo_tabletools_taxo(token = eppo_token,
#                                         raw_eppocodes = pests_eppocodes,
#                                         use_raw_codes = TRUE)

## ----eval = TRUE, echo = FALSE------------------------------------------------
pests_taxonomy <- readRDS("vignette_mock_pests_taxo.RDS")

## ----eval = TRUE, echo = TRUE-------------------------------------------------
pests_taxonomy$compact_table %>%
  dplyr::select(taxonomy) %>%
  table()

### barplot of number of pest species in each major taxonomic group -
### in the case of our query: Arthropoda, Chromista, Fungi, Nematoda, Plantae
pests_taxonomy$compact_table %>%
  dplyr::select(taxonomy) %>%
  table() %>%
   barplot(xlab = "Classification of pest", ylab = "Number of species",
           col = "#AF0011", ylim = c(0, 30))


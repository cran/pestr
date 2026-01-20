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
### Load packages
library("pestr")
library("dplyr")

## ----eval = FALSE, echo = TRUE------------------------------------------------
#  ### assign token to variable
#  eppo_token <- create_eppo_token("<<your eppo token>>")
#  ### assign name to variable
#  ac_name <- "Anoplophora chinensis"
#  ### assign eppocode to variable
#  ac_eppocode <- "ANOLCN"
#  ### assign database connection to variable
#  eppoDB <- eppo_database_connect()

## ----eval = FALSE, echo = TRUE------------------------------------------------
#  ac_names_table <- eppo_names_tables(ac_name, eppo_DB)
#  
#  ac_other_names <- eppo_tabletools_names(ac_names_table) %>%
#    .[2] %>%
#    dplyr::select(Other_names) %>%
#    unlist()
#  
#  ac_taxonomy <- eppo_tabletools_taxo(
#    token = eppo_token,
#    raw_eppocodes = ac_eppocode,
#    use_raw_codes = TRUE
#    )

## ----eval = FALSE, echo = TRUE------------------------------------------------
#  ac_hosts <- eppo_tabletools_hosts(
#    token = eppo_token,
#    raw_eppocodes = ac_eppocode,
#    use_raw_codes = TRUE
#    )

## ----eval = FALSE, echo = TRUE------------------------------------------------
#  ac_categorization <- eppo_tabletools_cat(
#    token = eppo_token,
#    raw_eppocodes = ac_eppocode,
#    use_raw_codes = TRUE
#    )

## ----eval = FALSE, echo = TRUE------------------------------------------------
#  ac_distribution <- eppo_tabletools_distri(
#    token = eppo_token,
#    raw_eppocodes = ac_eppocode,
#    use_raw_codes = TRUE
#    )



# Load Packages -----------------------------------------------------------
# Load the necessary packages into the global environment
library(validator)
# library(pointblank)
library(knitr)
# BWAM package available on GitHub: https://github.com/BWAM/zipper
library(zipper)
# BWAM package available on GitHub: https://github.com/BWAM/ALS
library(ALS)

# Extract Project Root ----------------------------------------------------
# This directory will provide relative paths between machines.
root.dir <- here::here()

# Rmd Options -------------------------------------------------------------
# Hide all code chunks by default
knitr::opts_chunk$set(echo = FALSE)

# pointblank rmd settings
pointblank::validate_rmd(summary = FALSE,
                         log_to_file = NULL)


# Extract Project Root ----------------------------------------------------
# This directory will provide relative paths between machines.
root.dir <- here::here()

# Import the authoritative list of SMAS sites -----------------------------
# Establish file path
sites_path <- file.path(root.dir,
                        "data-raw",
                        "site_tables",
                        "20191224_Site_Field_cleaned_final.csv")

# 1) Import the CSV
# 2) Extract SH_SITE_ID as a vector
# 3) Return only unique instances of SH_SITE_ID
smas_sites <- unique(read.csv(file = sites_path,
                       stringsAsFactors = FALSE)[["SH_SITE_ID"]])

# Make the list of sites available in the Validator package ---------------
usethis::use_data(smas_sites, overwrite = TRUE)

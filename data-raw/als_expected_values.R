# Extract Project Root ----------------------------------------------------
# This directory will provide relative paths between machines.
root.dir <- here::here()


# Import the table of expected ALS values ---------------------------------
# Establish file path
file_path <- file.path(root.dir,
                        "data-raw",
                        "als",
                        "als_expected_values.csv")

# 1) Import the CSV
# 2) Extract SH_SITE_ID as a vector
# 3) Return only unique instances of SH_SITE_ID
als_expected_df <- read.csv(file = file_path,
                              stringsAsFactors = FALSE)

# Make the list of sites available in the Validator package ---------------
usethis::use_data(als_expected_df, overwrite = TRUE)

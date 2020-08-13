
# Path to Zip File --------------------------------------------------------
# zip_path <- file.path(root.dir,
#                      "data-raw",
#                      "als",
#                      params$zip_file)
# zip_path <- params$zip_path

# Extract Zip Content -----------------------------------------------------
zip_content <- get_zip_content(.zip_path = params$zip_path)
# Extract -----------------------------------------------------------------
# Extract files from zip and store them in an S3 class "als"
als <- as_als(.zip_path = params$zip_path)


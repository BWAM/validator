#' ALS Validation Report
#'
#' @inheritParams get_zip_content
#' @param .output_dir a file path were the rendered report will be stored.
#'
#' @return an html report.
#' @export
#'
#' @examples
#' \dontrun{report_als(.zip_path = "C:/Users/zmsmith.000/OneDrive - New York State Office of Information Technology Services/projects/validator/data-raw/als/R2004471.zip",
#'  .output_dir = "C:/Users/zmsmith.000/Downloads")}

report_als <- function(.zip_path, .output_dir) {
  zip_file <- gsub(".*/", "", .zip_path)
  zip_name <- gsub(".zip", "", zip_file)
  rmarkdown::render(input = system.file("rmd",
                                        "als",
                                        "als.Rmd",
                                        package = "validator"),
                    # output_file = paste0(Sys.Date(),
                    #                      "_val-report_",
                    #                      zip_name
                    # ),
                    output_file = .output_dir,
                    # output_dir = .output_dir,
                    params = list(
                      zip_path = .zip_path
                    ))
}





#' Convert the List Contents to Class als
#'
#' @inheritParams get_zip_content
#'
#' @return an object of class "als".
#' @export

as_als <- function(.zip_path) {
  # Import files from zip
  zip_list <- read_zip(.zip_path = .zip_path)
  # Create a structured list and fill it with the appropriate files imported
  # from the zip
  # This will not throw an error if an element is missing.
  als_structure <- list(
    result = get_element(zip_list, "[Rr]esult"),
    batch = get_element(zip_list, "(?=.*Batch)(?=.*txt)"),
    sample = get_element(zip_list, "[Ss]ample"),
    htm = get_element(zip_list, "\\.htm")
  )
  # Create a new class named "als"
  attr(als_structure, "class") <- "als"

  # Return the list as class "als"
  return(als_structure)
}

#' Get the Count of Errors from the ALS HTM File
#'
#' @param .als an als object.
#'
#' @return a string.
#' @export

get_als_error_message <- function(.als) {

  if (is.null(.als$htm)) {
    "No HTM file provided"
  } else {
    als_error_message <- regmatches(
      x = .als$htm,
      m = regexpr(
        pattern = "There are (.*) records in the Error Table",
        text = .als$htm)
    )

    if (length(als_error_message) == 0) {
      # Print message in red.
      not_found <- paste('<span style="color:firebrick">',
                         "Error message not found in HTM file",
                         '</span>')
      # Return early because error message not found in file.
      return(not_found)
    } # end length if

    # If zero, then print a green message; otherwise a red message.
    if (grepl(pattern = "There are 0 records in the Error Table",
          x = als_error_message)) {
      # Print Green
      paste('<span style="color:forestgreen">',
            als_error_message,
            '</span>')
    } else {
      # Print Red
      paste('<span style="color:firebrick">',
            als_error_message,
            '</span>')
    }


  } # end null if
}



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





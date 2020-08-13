#' A message indicating the number of failures to a test
#'
#' @param .agent an agent object.
#'
#' @return A colored print statement.
#' @export

print_n_fail <- function(.agent) {
  # Extract the number of failures from the agent
  n_fail <- sum(.agent$validation_set$n_failed)
  # Proper grammar
  if (n_fail == 1) {
    # Failure if a single failure is present
    fail_message <- paste(n_fail, "Failure")
  } else {
    # Failures if 0 or more than one failure present
    fail_message <- paste(n_fail, "Failures")
  }

  # Add color to the message
  if (n_fail == 0) {
    # No failures are green
    paste('<span style="color:forestgreen">', fail_message, '</span>')
  } else {
    # Any failures are red
    paste('<span style="color:firebrick">', fail_message, '</span>')
  }

}



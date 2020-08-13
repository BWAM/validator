# Check for duplicate rows
agent_drows <- als$result %>%
    pointblank::create_agent() %>%
    pointblank::rows_distinct(columns = names(als$result)) %>%
    pointblank::interrogate()


# NOT WORKING
fail_drows <- pointblank::get_sundered_data(agent = agent_drows,
                                            type = "fail",
                                            id_cols = NULL)

if (nrow(fail_drows) > 0) {
  cat("The following rows are not distinct:")
  gt::gt(fail_drows)
}

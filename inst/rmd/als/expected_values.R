
# Load pre-defined expected values ----------------------------------------
data("als_expected_df")


# Create a new agent ------------------------------------------------------
value_agent <- als$result %>%
  pointblank::create_agent()


# Loop expected values check ----------------------------------------------
# each iteration of the for loop adds a new check to the agent
for (i in unique(als_expected_df$name)) {
  # Extract a vector of expected values for column i
  set_vec <- als_expected_df[als_expected_df$name %in% i, "value"]
  # add the check to the agent
  value_agent <- pointblank::col_vals_in_set(x = value_agent,
                                             columns = tidyselect::all_of(i),
                                             set = set_vec)
} # End for loop

# Interrogate --------------------------------------------------------------
agent_expected_values <- pointblank::interrogate(value_agent)



# Load pre-defined schema
data(als_schema)

# Create an agent for the raw data and see if it matches the overall schema.
# The col_schema_match does not provided a detailed output; subsequent code
# is provided to evaluate each column.
schema_agent_list <- als$result %>%
  pointblank::create_agent() %>%
  pointblank::col_schema_match(schema = als_schema,
                               # Check all columns are present
                               complete = TRUE,
                               # Check all columns in expected order
                               in_order = TRUE)

# This code provides a detailed output indicating if the expected column
# type was provided.
agent_schema <- schema_agent_list %>%
    # Check that all columns are present
    pointblank::col_exists(columns = names(als_schema)) %>%
    pointblank::col_is_character(names(als_schema[grepl("character", als_schema)])) %>%
    pointblank::col_is_integer(names(als_schema[grepl("integer", als_schema)])) %>%
    pointblank::col_is_numeric(names(als_schema[grepl("numeric", als_schema)])) %>%
    pointblank::interrogate()

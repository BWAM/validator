# Load the vector of expected SMAS site codes
data("smas_sites")

# split the data by sample_source
samples_split <- split(x = als$sample,
                       als$sample$sample_source)



# Field Data --------------------------------------------------------------

agent_expected_field_sites <-  samples_split$Field %>%
  pointblank::create_agent() %>%
  pointblank::col_vals_in_set(
    columns = "sys_loc_code",
    set = smas_sites
  ) %>%
  pointblank::interrogate()

# Lab Data ----------------------------------------------------------------

agent_expected_lab_sites <-  samples_split$Lab %>%
  pointblank::create_agent() %>%
  pointblank::col_vals_in_set(
    columns = "sys_loc_code",
    set = c(smas_sites,
            "Method Blank",
            "Lab Control Sample",
            "LAB CONTROL SAMPLE",
            "BLANK")
  ) %>%
  pointblank::interrogate()



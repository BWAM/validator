# ALS Schema
# Define the ALS schema and add schema as data that is
# accessible through the validator package.


# Define the Schema -------------------------------------------------------
als_schema <- pointblank::col_schema(
  X.sys_sample_code = "character",
  lab_anl_method_name = "character",
  analysis_date = "character",
  fraction = "character",
  column_number = "numeric", # ?
  test_type = "character",
  lab_matrix_code = "character",
  analysis_location = "character",
  basis = "character", #?
  container_id = "character",
  dilution_factor = "integer", # always integer?
  prep_method = "character",
  prep_date = "character",
  leachate_method = "character",
  leachate_date = "character",
  lab_name_code = "character",
  qc_level = "character",
  lab_sample_id = "character",
  percent_moisture = "numeric",
  subsample_amount = "integer", # always integer?
  subsample_amount_unit = "character",
  analyst_name = "character",
  instrument_id = "character", #?
  comment = "character",
  preservative = "character",
  final_volume = "integer", # always integer?
  final_volume_unit = "character",
  cas_rn = "character",
  chemical_name = "character",
  Result_value = "numeric",
  Result_error_delta = "numeric", # ?
  result_type_code = "character",
  reportable_result = "character",
  detect_flag = "character",
  Lab_qualifiers = "character",
  validator_qualifiers = "character",
  interpreted_qualifiers = "character",
  validated_yn = "character", #?
  method_detection_limit = "numeric",
  reporting_detection_limit = "numeric",
  quantitation_limit = "numeric",
  Result_unit = "character",
  detection_limit_unit = "character",
  tic_retention_time = "character",
  minimum_detectable_conc = "numeric",
  counting_error = "numeric", # ?
  uncertainty = "numeric", # ?
  critical_value = "numeric", # ?
  validation_level = "numeric", # ?
  result_comment = "character",
  qc_original_conc = "numeric",
  qc_spike_added = "numeric",
  qc_spike_measured = "numeric",
  qc_spike_recovery = "integer", # always integer?
  qc_dup_original_conc = "numeric",
  qc_dup_spike_added = "numeric",
  qc_dup_spike_measured = "numeric",
  qc_dup_spike_recovery = "integer", # always integer?
  qc_rpd = "character",
  qc_spike_lcl = "integer", # always integer?
  qc_spike_ucl = "integer", # always integer?
  qc_rpd_cl = "integer", # always integer?
  qc_spike_status = "character",
  qc_dup_spike_status = "character",
  qc_rpd_status = "character", #?
  lab_sdg = "character"
)

# Add Data to Package -----------------------------------------------------
usethis::use_data(als_schema, overwrite = TRUE)


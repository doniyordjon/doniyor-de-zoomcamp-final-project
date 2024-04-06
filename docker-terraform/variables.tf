locals {
  data_lake_bucket = "linkedin_posts_data_lake"
}

variable "project" {
  description = "Project-ID"
  default = "de-zoom-final-project"
}

variable "region" {
  description = "Region for GCP resources."
  default = "US"
  type = string
}

variable "storage_class" {
  description = "Storage class type for your bucket. Check official docs for more info."
  default = "STANDARD"
}

variable "BQ_DATASET" {
  description = "BigQuery Dataset that raw data (from GCS) will be written to"
  type = string
  default = "linkedin_posts_data"
}
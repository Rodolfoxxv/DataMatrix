#Tables-----------------------------------------------------------------------------------------

resource "google_bigquery_table" "tb_super_invoice" {
  dataset_id = google_bigquery_dataset.manual.dataset_id
  table_id   = "tb_super_invoice"

  # Use the schema variable here
  schema = var.schema_invoice
}

resource "google_bigquery_table" "tb_super_orderleads" {
  dataset_id = google_bigquery_dataset.manual.dataset_id
  table_id   = "tb_super_orderleads"

  # Use the schema variable here
  schema = var.schema_orderleads
}

resource "google_bigquery_table" "tb_super_salesteam" {
  dataset_id = google_bigquery_dataset.manual.dataset_id
  table_id   = "tb_super_salesteam"

  # Use the schema variable here
  schema = var.schema_salesteam
}

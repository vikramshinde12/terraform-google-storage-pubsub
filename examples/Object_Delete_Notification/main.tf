provider "google" {
  version = "~> 3.30"
  project     = var.project_id
  region      = var.region
}

resource "google_project_service" "pubsub_api" {
  project = var.project_id
  service = "pubsub.googleapis.com"
}

module "gcs-pubsub" {
  source      = "https://github.com/vikramshinde12/terraform-google-storage-pubsub.git?ref=master"
  topic_name  = "sample_topic"
  bucket_name = "sample_bucket"
  event_type  = "OBJECT_DELETE"
  depends_on  = [google_project_service.pubsub_api]
}


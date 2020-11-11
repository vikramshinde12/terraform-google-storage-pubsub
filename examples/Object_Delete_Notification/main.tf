provider "google" {
  version = "~> 3.30"
  project     = var.project_id
  region      = var.region
}

module "gcs-pubsub" {
  source      = "../../"
  version     = 1.0.1
  topic_name  = "sample_topic"
  bucket_name = "sample_bucket"
  project_id  = "sample_project_id"
  event_type  = "OBJECT_DELETE"
  depends_on  = [google_project_service.pubsub_api]
}


resource "google_project_service" "pubsub_api" {
  project = var.project_id
  service = "pubsub.googleapis.com"
}


variable "project_id" {}

provider "google" {
  version = "~> 3.30"
  project = var.project_id
  region  = "europe-west2"
}

resource "google_project_service" "pubsub_api" {
  project = var.project_id
  service = "pubsub.googleapis.com"
}

module "gcs-pubsub_notification_create" {
  source      = "../"
  topic_name  = "sample_topic"
  bucket_name = "sample_bucket"
  event_type  = "OBJECT_FINALIZE"
  project_id  = var.project_id
  depends_on  = [google_project_service.pubsub_api]
}

module "gcs-pubsub_notification_delete" {
  source      = "../"
  topic_name  = "sample_topic"
  bucket_name = "sample_bucket"
  event_type  = "OBJECT_DELETE"
  project_id  = var.project_id
  depends_on  = [google_project_service.pubsub_api]
}
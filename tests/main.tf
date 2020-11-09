provider "google" {
  version = "~> 3.30"
  project = "sample_project"
  region  = "europe-west2"
}

resource "google_project_service" "pubsub_api" {
  project = "sample_project"
  service = "pubsub.googleapis.com"
}

module "gcs-pubsub_notification_create" {
  source      = "../"
  topic_name  = "sample_topic"
  bucket_name = "sample_bucket"
  event_type  = "OBJECT_FINALIZE"
  depends_on  = [google_project_service.pubsub_api]
}

module "gcs-pubsub_notification_delete" {
  source      = "../"
  topic_name  = "sample_topic"
  bucket_name = "sample_bucket"
  event_type  = "OBJECT_DELETE"
  depends_on  = [google_project_service.pubsub_api]
}
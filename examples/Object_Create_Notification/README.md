# terraform-google-storage-pubsub
Terraform module to create Pub/Sub notifications for Cloud Storage

# Example
This example illustrates how to create a simple Pub/Sub notification on cloud storage bucket.

This module creates following resources
1. Bucket : A Source bucket
2. Topic : The topic in Pub/Sub that receives notifications.
3. Event : The events that trigger a notification to be sent.
e.g. 
OBJECT_FINALIZE (default) - New object is successfully created in the bucket.
OBJECT_DELETE - an object has been successfully deleted.
4. Subscriber: Sample pull subscriber named "echo".

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket_name | Source bucket name on which pubsub notification is configured | `String` | n/a | yes|
| topic_name | The topic in Pub/Sub that receives notifications. |  `String` | n/a | yes|
| event_type | Event type e.g. OBJECT_FINALIZE, OBJECT_DELETE, OBJECT_ARCHIVE | `String` | OBJECT_FINALIZE | yes
| project_id | The project ID to manage the Pub/Sub resources | `string` | n/a | yes

## Output
| Name | Description |
|------|-------------|
| bucket_url | The Bucket Link URL |
| topic_name | The URI of the Pub/Sub topic. |

## example
```hcl
module "gcs-pubsub" {
  source      = "vikramshinde12/storage-pubsub/google"
  version     = 1.0.1
  topic_name  = "sample_topic"
  bucket_name = "sample_bucket"
  project_id  = "sample_project_id"
  depends_on  = [google_project_service.pubsub_api]
}


resource "google_project_service" "pubsub_api" {
  project = "sample_project_id"
  service = "pubsub.googleapis.com"
}
```
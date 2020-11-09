# terraform-google-storage-pubsub
Terraform module to create Pub/Sub notifications for Cloud Storage

# Overview
Pub/Sub notifications sends information about changes to objects in your buckets to Pub/Sub, where the information is added to a Pub/Sub topic of your choice in the form of messages. For example, you can track objects that are created and deleted in your bucket. Each notification contains information describing both the event that triggered it and the object that changed.

This module creates following resources
1. Bucket : A Source bucket
2. Topic : The topic in Pub/Sub that receives notifications.
3. Event : The events that trigger a notification to be sent.
e.g. 
OBJECT_FINALIZE (default) - New object is successfully created in the bucket.
OBJECT_DELETE - an object has been successfully deleted.
4. Subscriber: Sample pull subscriber named "echo".

## Sample example
```hcl
module "gcs-pubsub" {
  source      = "https://github.com/vikramshinde12/terraform-google-storage-pubsub.git?ref=master"
  topic_name  = "sample_topic"
  bucket_name = "sample_bucket"
  depends_on  = [google_project_service.pubsub_api]
}

resource "google_project_service" "pubsub_api" {
  project = var.project_id
  service = "pubsub.googleapis.com"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.13 |

## Providers

| Name | Version |
|------|---------|
| google | ~> 3.44 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket_name | Source bucket name on which pubsub notification is configured | `String` | n/a | yes|
| topic_name | The topic in Pub/Sub that receives notifications. |  `String` | n/a | yes|
| event_type | Event type e.g. OBJECT_FINALIZE, OBJECT_DELETE, OBJECT_ARCHIVE | `String` | OBJECT_FINALIZE | yes

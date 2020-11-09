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

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket_name | Source bucket name on which pubsub notification is configured | `String` | n/a | yes|
| topic_name | The topic in Pub/Sub that receives notifications. |  `String` | n/a | yes|
| event_type | Event type e.g. OBJECT_FINALIZE, OBJECT_DELETE, OBJECT_ARCHIVE | `String` | OBJECT_FINALIZE | yes

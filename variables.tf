variable "project_id" {
  description = "Project Id"
  type = string
}

variable "bucket_name" {
  description = "Source bucket name on which pubsub notification is configured"
  type        = string
}

variable "topic_name" {
  description = "The topic in Pub/Sub that receives notifications."
  type        = string
}

variable "event_type" {
  description = "The events that trigger a notification to be sent."
  type    = string
  default = "OBJECT_FINALIZE"
}
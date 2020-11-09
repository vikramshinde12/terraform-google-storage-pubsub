variable "bucket_name" {
  description = "Source bucket name on which pubsub notification is configured"
  type        = string
}

variable "topic_name" {
  description = ""
  type        = string
}

variable "event_type" {
  type    = string
  default = "OBJECT_FINALIZE"
}
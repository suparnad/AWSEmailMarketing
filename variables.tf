variable "bucket_name" {
  type        = string
  description = "The name of the Bucket in S3"
}
variable "csv_key" {
  type        = string
  description = "Contact csv file name"
}
variable "template_key" {
  type        = string
  description = "Email template file name"
}
variable "source_email" {
  type        = string
  description = "Source email Id"
}
variable "email_subject" {
  type        = string
  description = "Subject of my marketing email"
}


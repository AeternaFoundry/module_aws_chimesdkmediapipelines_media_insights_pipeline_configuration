output "chimesdkmediapipelines_media_insights_pipeline_configurations_id" {
  description = "Map of id values across all chimesdkmediapipelines_media_insights_pipeline_configurations, keyed the same as var.chimesdkmediapipelines_media_insights_pipeline_configurations"
  value       = { for k, v in aws_chimesdkmediapipelines_media_insights_pipeline_configuration.chimesdkmediapipelines_media_insights_pipeline_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "chimesdkmediapipelines_media_insights_pipeline_configurations_arn" {
  description = "Map of arn values across all chimesdkmediapipelines_media_insights_pipeline_configurations, keyed the same as var.chimesdkmediapipelines_media_insights_pipeline_configurations"
  value       = { for k, v in aws_chimesdkmediapipelines_media_insights_pipeline_configuration.chimesdkmediapipelines_media_insights_pipeline_configurations : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "chimesdkmediapipelines_media_insights_pipeline_configurations_elements" {
  description = "Map of elements values across all chimesdkmediapipelines_media_insights_pipeline_configurations, keyed the same as var.chimesdkmediapipelines_media_insights_pipeline_configurations"
  value       = { for k, v in aws_chimesdkmediapipelines_media_insights_pipeline_configuration.chimesdkmediapipelines_media_insights_pipeline_configurations : k => v.elements if v.elements != null && length(v.elements) > 0 }
}
output "chimesdkmediapipelines_media_insights_pipeline_configurations_name" {
  description = "Map of name values across all chimesdkmediapipelines_media_insights_pipeline_configurations, keyed the same as var.chimesdkmediapipelines_media_insights_pipeline_configurations"
  value       = { for k, v in aws_chimesdkmediapipelines_media_insights_pipeline_configuration.chimesdkmediapipelines_media_insights_pipeline_configurations : k => v.name if v.name != null && length(v.name) > 0 }
}
output "chimesdkmediapipelines_media_insights_pipeline_configurations_real_time_alert_configuration" {
  description = "Map of real_time_alert_configuration values across all chimesdkmediapipelines_media_insights_pipeline_configurations, keyed the same as var.chimesdkmediapipelines_media_insights_pipeline_configurations"
  value       = { for k, v in aws_chimesdkmediapipelines_media_insights_pipeline_configuration.chimesdkmediapipelines_media_insights_pipeline_configurations : k => one(v.real_time_alert_configuration) if v.real_time_alert_configuration != null && length(v.real_time_alert_configuration) > 0 }
}
output "chimesdkmediapipelines_media_insights_pipeline_configurations_region" {
  description = "Map of region values across all chimesdkmediapipelines_media_insights_pipeline_configurations, keyed the same as var.chimesdkmediapipelines_media_insights_pipeline_configurations"
  value       = { for k, v in aws_chimesdkmediapipelines_media_insights_pipeline_configuration.chimesdkmediapipelines_media_insights_pipeline_configurations : k => v.region if v.region != null && length(v.region) > 0 }
}
output "chimesdkmediapipelines_media_insights_pipeline_configurations_resource_access_role_arn" {
  description = "Map of resource_access_role_arn values across all chimesdkmediapipelines_media_insights_pipeline_configurations, keyed the same as var.chimesdkmediapipelines_media_insights_pipeline_configurations"
  value       = { for k, v in aws_chimesdkmediapipelines_media_insights_pipeline_configuration.chimesdkmediapipelines_media_insights_pipeline_configurations : k => v.resource_access_role_arn if v.resource_access_role_arn != null && length(v.resource_access_role_arn) > 0 }
}
output "chimesdkmediapipelines_media_insights_pipeline_configurations_tags" {
  description = "Map of tags values across all chimesdkmediapipelines_media_insights_pipeline_configurations, keyed the same as var.chimesdkmediapipelines_media_insights_pipeline_configurations"
  value       = { for k, v in aws_chimesdkmediapipelines_media_insights_pipeline_configuration.chimesdkmediapipelines_media_insights_pipeline_configurations : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "chimesdkmediapipelines_media_insights_pipeline_configurations_tags_all" {
  description = "Map of tags_all values across all chimesdkmediapipelines_media_insights_pipeline_configurations, keyed the same as var.chimesdkmediapipelines_media_insights_pipeline_configurations"
  value       = { for k, v in aws_chimesdkmediapipelines_media_insights_pipeline_configuration.chimesdkmediapipelines_media_insights_pipeline_configurations : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}


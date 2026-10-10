variable "chimesdkmediapipelines_media_insights_pipeline_configurations" {
  description = <<EOT
Map of chimesdkmediapipelines_media_insights_pipeline_configurations, attributes below
Required:
    - name
    - resource_access_role_arn
    - elements (block):
        - amazon_transcribe_call_analytics_processor_configuration (optional, block):
            - call_analytics_stream_categories (optional)
            - content_identification_type (optional)
            - content_redaction_type (optional)
            - enable_partial_results_stabilization (optional)
            - filter_partial_results (optional)
            - language_code (required)
            - language_model_name (optional)
            - partial_results_stability (optional)
            - pii_entity_types (optional)
            - post_call_analytics_settings (optional, block):
                - content_redaction_output (optional)
                - data_access_role_arn (required)
                - output_encryption_kms_key_id (optional)
                - output_location (required)
            - vocabulary_filter_method (optional)
            - vocabulary_filter_name (optional)
            - vocabulary_name (optional)
        - amazon_transcribe_processor_configuration (optional, block):
            - content_identification_type (optional)
            - content_redaction_type (optional)
            - enable_partial_results_stabilization (optional)
            - filter_partial_results (optional)
            - language_code (required)
            - language_model_name (optional)
            - partial_results_stability (optional)
            - pii_entity_types (optional)
            - show_speaker_label (optional)
            - vocabulary_filter_method (optional)
            - vocabulary_filter_name (optional)
            - vocabulary_name (optional)
        - kinesis_data_stream_sink_configuration (optional, block):
            - insights_target (required)
        - lambda_function_sink_configuration (optional, block):
            - insights_target (required)
        - s3_recording_sink_configuration (optional, block):
            - destination (optional)
        - sns_topic_sink_configuration (optional, block):
            - insights_target (required)
        - sqs_queue_sink_configuration (optional, block):
            - insights_target (required)
        - type (required)
        - voice_analytics_processor_configuration (optional, block):
            - speaker_search_status (required)
            - voice_tone_analysis_status (required)
Optional:
    - region
    - tags
    - tags_all
    - real_time_alert_configuration (block):
        - disabled (optional)
        - rules (required, block):
            - issue_detection_configuration (optional, block):
                - rule_name (required)
            - keyword_match_configuration (optional, block):
                - keywords (required)
                - negate (optional)
                - rule_name (required)
            - sentiment_configuration (optional, block):
                - rule_name (required)
                - sentiment_type (required)
                - time_period (required)
            - type (required)
EOT

  type = map(object({
    name                     = string
    resource_access_role_arn = string
    region                   = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    elements = list(object({
      amazon_transcribe_call_analytics_processor_configuration = optional(object({
        call_analytics_stream_categories     = optional(list(string))
        content_identification_type          = optional(string)
        content_redaction_type               = optional(string)
        enable_partial_results_stabilization = optional(bool)
        filter_partial_results               = optional(bool)
        language_code                        = string
        language_model_name                  = optional(string)
        partial_results_stability            = optional(string)
        pii_entity_types                     = optional(string)
        post_call_analytics_settings = optional(object({
          content_redaction_output     = optional(string)
          data_access_role_arn         = string
          output_encryption_kms_key_id = optional(string)
          output_location              = string
        }))
        vocabulary_filter_method = optional(string)
        vocabulary_filter_name   = optional(string)
        vocabulary_name          = optional(string)
      }))
      amazon_transcribe_processor_configuration = optional(object({
        content_identification_type          = optional(string)
        content_redaction_type               = optional(string)
        enable_partial_results_stabilization = optional(bool)
        filter_partial_results               = optional(bool)
        language_code                        = string
        language_model_name                  = optional(string)
        partial_results_stability            = optional(string)
        pii_entity_types                     = optional(string)
        show_speaker_label                   = optional(bool)
        vocabulary_filter_method             = optional(string)
        vocabulary_filter_name               = optional(string)
        vocabulary_name                      = optional(string)
      }))
      kinesis_data_stream_sink_configuration = optional(object({
        insights_target = string
      }))
      lambda_function_sink_configuration = optional(object({
        insights_target = string
      }))
      s3_recording_sink_configuration = optional(object({
        destination = optional(string)
      }))
      sns_topic_sink_configuration = optional(object({
        insights_target = string
      }))
      sqs_queue_sink_configuration = optional(object({
        insights_target = string
      }))
      type = string
      voice_analytics_processor_configuration = optional(object({
        speaker_search_status      = string
        voice_tone_analysis_status = string
      }))
    }))
    real_time_alert_configuration = optional(object({
      disabled = optional(bool)
      rules = list(object({
        issue_detection_configuration = optional(object({
          rule_name = string
        }))
        keyword_match_configuration = optional(object({
          keywords  = list(string)
          negate    = optional(bool)
          rule_name = string
        }))
        sentiment_configuration = optional(object({
          rule_name      = string
          sentiment_type = string
          time_period    = number
        }))
        type = string
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        length(v.elements) >= 1
      )
    ])
    error_message = "Each elements list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        v.real_time_alert_configuration == null || (length(v.real_time_alert_configuration.rules) >= 1 && length(v.real_time_alert_configuration.rules) <= 3)
      )
    ])
    error_message = "Each rules list must contain between 1 and 3 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        alltrue([for item in v.elements : (item.amazon_transcribe_call_analytics_processor_configuration == null || (item.amazon_transcribe_call_analytics_processor_configuration.call_analytics_stream_categories == null || (alltrue([for x in item.amazon_transcribe_call_analytics_processor_configuration.call_analytics_stream_categories : (length(x) >= 1 && length(x) <= 200) && (can(regex("^[0-9A-Za-z_.-]+", x)))]))))])
      )
    ])
    error_message = "all of: must be between 1 and 200 characters; Must be a valid Category Name matching expression: ^[0-9A-Za-z_.-]+"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        alltrue([for item in v.elements : (item.amazon_transcribe_call_analytics_processor_configuration == null || (item.amazon_transcribe_call_analytics_processor_configuration.language_model_name == null || ((length(item.amazon_transcribe_call_analytics_processor_configuration.language_model_name) >= 0 && length(item.amazon_transcribe_call_analytics_processor_configuration.language_model_name) <= 200) && (can(regex("^[0-9A-Za-z_.-]+", item.amazon_transcribe_call_analytics_processor_configuration.language_model_name))))))])
      )
    ])
    error_message = "all of: must be between 0 and 200 characters; Must be a valid language model name matching expression: ^[0-9A-Za-z_.-]+"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        alltrue([for item in v.elements : (item.amazon_transcribe_call_analytics_processor_configuration == null || (item.amazon_transcribe_call_analytics_processor_configuration.pii_entity_types == null || ((length(item.amazon_transcribe_call_analytics_processor_configuration.pii_entity_types) >= 0 && length(item.amazon_transcribe_call_analytics_processor_configuration.pii_entity_types) <= 300) && (can(regex("^[A-Z_, ]+", item.amazon_transcribe_call_analytics_processor_configuration.pii_entity_types))))))])
      )
    ])
    error_message = "all of: must be between 0 and 300 characters; Must be a valid comma-separated list of entity types. For valid types see https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_AmazonTranscribeCallAnalyticsProcessorConfiguration.html#chimesdk-Type-media-pipelines-chime_AmazonTranscribeCallAnalyticsProcessorConfiguration-CallAnalyticsStreamCategories"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        alltrue([for item in v.elements : (item.amazon_transcribe_call_analytics_processor_configuration == null || (item.amazon_transcribe_call_analytics_processor_configuration.post_call_analytics_settings == null || (item.amazon_transcribe_call_analytics_processor_configuration.post_call_analytics_settings.output_encryption_kms_key_id == null || (length(item.amazon_transcribe_call_analytics_processor_configuration.post_call_analytics_settings.output_encryption_kms_key_id) >= 1 && length(item.amazon_transcribe_call_analytics_processor_configuration.post_call_analytics_settings.output_encryption_kms_key_id) <= 4096))))])
      )
    ])
    error_message = "must be between 1 and 4096 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        alltrue([for item in v.elements : (item.amazon_transcribe_call_analytics_processor_configuration == null || (item.amazon_transcribe_call_analytics_processor_configuration.post_call_analytics_settings == null || (can(regex("s3://+", item.amazon_transcribe_call_analytics_processor_configuration.post_call_analytics_settings.output_location)))))])
      )
    ])
    error_message = "Must begin with the prefix 's3://'"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        alltrue([for item in v.elements : (item.amazon_transcribe_call_analytics_processor_configuration == null || (item.amazon_transcribe_call_analytics_processor_configuration.vocabulary_filter_name == null || ((length(item.amazon_transcribe_call_analytics_processor_configuration.vocabulary_filter_name) >= 0 && length(item.amazon_transcribe_call_analytics_processor_configuration.vocabulary_filter_name) <= 200) && (can(regex("^[0-9A-Za-z_.-]+", item.amazon_transcribe_call_analytics_processor_configuration.vocabulary_filter_name))))))])
      )
    ])
    error_message = "all of: must be between 0 and 200 characters; Must be a valid vocabulary filter name matching expression: ^[0-9A-Za-z_.-]+"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        alltrue([for item in v.elements : (item.amazon_transcribe_call_analytics_processor_configuration == null || (item.amazon_transcribe_call_analytics_processor_configuration.vocabulary_name == null || ((length(item.amazon_transcribe_call_analytics_processor_configuration.vocabulary_name) >= 0 && length(item.amazon_transcribe_call_analytics_processor_configuration.vocabulary_name) <= 200) && (can(regex("^[0-9A-Za-z_.-]+", item.amazon_transcribe_call_analytics_processor_configuration.vocabulary_name))))))])
      )
    ])
    error_message = "all of: must be between 0 and 200 characters; Must be a valid vocabulary name matching expression: ^[0-9A-Za-z_.-]+"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        alltrue([for item in v.elements : (item.amazon_transcribe_processor_configuration == null || (item.amazon_transcribe_processor_configuration.language_model_name == null || ((length(item.amazon_transcribe_processor_configuration.language_model_name) >= 0 && length(item.amazon_transcribe_processor_configuration.language_model_name) <= 200) && (can(regex("^[0-9A-Za-z_.-]+", item.amazon_transcribe_processor_configuration.language_model_name))))))])
      )
    ])
    error_message = "all of: must be between 0 and 200 characters; Must be a valid language model name matching expression: ^[0-9A-Za-z_.-]+"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        alltrue([for item in v.elements : (item.amazon_transcribe_processor_configuration == null || (item.amazon_transcribe_processor_configuration.pii_entity_types == null || ((length(item.amazon_transcribe_processor_configuration.pii_entity_types) >= 0 && length(item.amazon_transcribe_processor_configuration.pii_entity_types) <= 300) && (can(regex("^[A-Z_, ]+", item.amazon_transcribe_processor_configuration.pii_entity_types))))))])
      )
    ])
    error_message = "all of: must be between 0 and 300 characters; Must be a valid comma-separated list of entity types. For valid types see https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_AmazonTranscribeCallAnalyticsProcessorConfiguration.html#chimesdk-Type-media-pipelines-chime_AmazonTranscribeCallAnalyticsProcessorConfiguration-CallAnalyticsStreamCategories"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        alltrue([for item in v.elements : (item.amazon_transcribe_processor_configuration == null || (item.amazon_transcribe_processor_configuration.vocabulary_filter_name == null || ((length(item.amazon_transcribe_processor_configuration.vocabulary_filter_name) >= 0 && length(item.amazon_transcribe_processor_configuration.vocabulary_filter_name) <= 200) && (can(regex("^[0-9A-Za-z_.-]+", item.amazon_transcribe_processor_configuration.vocabulary_filter_name))))))])
      )
    ])
    error_message = "all of: must be between 0 and 200 characters; Must be a valid vocabulary filter name matching expression: ^[0-9A-Za-z_.-]+"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        alltrue([for item in v.elements : (item.amazon_transcribe_processor_configuration == null || (item.amazon_transcribe_processor_configuration.vocabulary_name == null || ((length(item.amazon_transcribe_processor_configuration.vocabulary_name) >= 0 && length(item.amazon_transcribe_processor_configuration.vocabulary_name) <= 200) && (can(regex("^[0-9A-Za-z_.-]+", item.amazon_transcribe_processor_configuration.vocabulary_name))))))])
      )
    ])
    error_message = "all of: must be between 0 and 200 characters; Must be a valid vocabulary name matching expression: ^[0-9A-Za-z_.-]+"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        v.real_time_alert_configuration == null || (alltrue([for item in v.real_time_alert_configuration.rules : (item.issue_detection_configuration == null || (can(regex("^[0-9A-Za-z_.-]+", item.issue_detection_configuration.rule_name))))]))
      )
    ])
    error_message = "Must match the expression: ^[0-9A-Za-z_.-]+"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        v.real_time_alert_configuration == null || (alltrue([for item in v.real_time_alert_configuration.rules : (item.keyword_match_configuration == null || (alltrue([for x in item.keyword_match_configuration.keywords : can(regex("^[0-9A-Za-z\\s'-]+", x))])))]))
      )
    ])
    error_message = "Must match the expression: ^[0-9A-Za-z\\s'-]+"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        v.real_time_alert_configuration == null || (alltrue([for item in v.real_time_alert_configuration.rules : (item.keyword_match_configuration == null || (can(regex("^[0-9A-Za-z_.-]+", item.keyword_match_configuration.rule_name))))]))
      )
    ])
    error_message = "Must match the expression: ^[0-9A-Za-z_.-]+"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        v.real_time_alert_configuration == null || (alltrue([for item in v.real_time_alert_configuration.rules : (item.sentiment_configuration == null || (can(regex("^[0-9A-Za-z_.-]+", item.sentiment_configuration.rule_name))))]))
      )
    ])
    error_message = "Must match the expression: ^[0-9A-Za-z_.-]+"
  }
  validation {
    condition = alltrue([
      for k, v in var.chimesdkmediapipelines_media_insights_pipeline_configurations : (
        v.real_time_alert_configuration == null || (alltrue([for item in v.real_time_alert_configuration.rules : (item.sentiment_configuration == null || (item.sentiment_configuration.time_period >= 60 && item.sentiment_configuration.time_period <= 1800))]))
      )
    ])
    error_message = "must be between 60 and 1800"
  }
  # Note: 23 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}


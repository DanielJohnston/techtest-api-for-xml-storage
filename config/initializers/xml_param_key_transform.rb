# File: config/initializers/json_param_key_transform.rb
# Transform XML request param keys from XML-conventional camelCase to
# Rails-conventional snake_case:
ActionDispatch::Request.parameter_parsers[:xml] = -> (raw_post) {
  # Modified from action_dispatch/http/parameters.rb
  # data = ActiveSupport::XMLFormat.decode(raw_post)
  data = Hash.from_xml(raw_post)
  data = {:_xml => data} unless data.is_a?(Hash)

  # Transform camelCase param keys to snake_case:
  data.deep_transform_keys!(&:underscore)
}

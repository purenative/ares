# frozen_string_literal: true

module ARES
  module LocalizedStringKeysResourcesWriter
    TEMPLATE_LOCALIZED_STRING_KEYS_RESOURCES_PLACE = "__RESOURCES__"
    TEMPLATE_LOCALIZED_STRING_KEYS_PATH = "LocalizedStringKeys.swifttemplate"
    TEMPLATE_LOCALIZED_STRING_KEYS_STATIC_PROPERTY_PATH = "LocalizedStringKeysStaticProperty.swifttemplate"

    def write_localized_string_keys_resources(keys, resources_path)
      template_properties_content = keys.map { |k| string_key_property_content(k) }

      properties_template = template_properties_content.join("\n\n")

      template_content = File.read(File.join(SWIFT_TEMPLATES_PATH, TEMPLATE_LOCALIZED_STRING_KEYS_PATH))
      template_content[TEMPLATE_LOCALIZED_STRING_KEYS_RESOURCES_PLACE] = properties_template

      File.open(resources_path, mode='w') do |file|
        file.write(template_content)
      end
    end

    private

    def string_key_property_content(original_key)
      key = original_key.gsub("\"", "")
      name = key.gsub(" ", "")
      name[0] = name[0].downcase
      file_content = File.read(File.join(SWIFT_TEMPLATES_PATH, TEMPLATE_LOCALIZED_STRING_KEYS_STATIC_PROPERTY_PATH))
      file_content[TEMPLATE_LOCALIZED_STRING_KEYS_RESOURCES_PLACE] = name
      file_content[TEMPLATE_LOCALIZED_STRING_KEYS_RESOURCES_PLACE] = key
      file_content
    end
  end
end

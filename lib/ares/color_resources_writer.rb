# frozen_string_literal: true

module ARES
  module ColorResourcesWriter
    TEMPLATE_COLOR_RESOURCES_PLACE = "__RESOURCES__"
    TEMPLATE_COLOR_RESOURCES_PATH = "ColorResources.swifttemplate"

    def write_color_resources(colors, resources_path)
      template_file_path = File.join(SWIFT_TEMPLATES_PATH, TEMPLATE_COLOR_RESOURCES_PATH)

      File.open(template_file_path) do |file|
        process_template_content(colors, resources_path, file.read)
      end
    end

    private

    def process_template_content(colors, resources_path, template_content)
      resources_content = colors.map { |cn| "    case #{cn}" }.join("\n")
      template_content[TEMPLATE_COLOR_RESOURCES_PLACE] = resources_content

      File.open(resources_path, mode='w') do |file|
        file.write(template_content)
      end
    end
  end
end

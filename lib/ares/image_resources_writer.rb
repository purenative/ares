# frozen_string_literal: true

module ARES
  module ImageResourcesWriter
    TEMPLATE_IMAGE_RESOURCES_PLACE = "__RESOURCES__"
    TEMPLATE_IMAGE_PATH = "ImageResources.swifttemplate"

    def write_image_resources(images, resources_path)
      template_file_path = File.join(SWIFT_TEMPLATES_PATH, TEMPLATE_IMAGE_PATH)

      File.open(template_file_path) do |file|
        process_template_content(images, resources_path, file.read)
      end
    end

    private

    def process_template_content(images, resources_path, template_content)
      resources_content = images.map { |cn| "    case #{cn}" }.join("\n")
      template_content[TEMPLATE_IMAGE_RESOURCES_PLACE] = resources_content

      File.open(resources_path, mode='w') do |file|
        file.write(template_content)
      end
    end
  end
end

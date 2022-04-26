TEMPLATE_IMAGE_RESOURCES_PLACE = '__RESOURCES__'
TEMPLATE_IMAGE_PATH = 'ImageResources.swifttemplate'

def write_image_resources(images, resources_path)

    template_file_path = __dir__ + "/" + TEMPLATE_IMAGE_PATH
    template_file = File.open(template_file_path)
    template_content = template_file.read
    template_file.close

    resources_content = images.map { |cn| "    case #{cn}" }.join("\n")
    template_content[TEMPLATE_IMAGE_RESOURCES_PLACE] = resources_content

    color_resources_file = File.open(resources_path, mode='w')
    color_resources_file.write(template_content)
    color_resources_file.close

end
TEMPLATE_COLOR_RESOURCES_PLACE = '__RESOURCES__'
TEMPLATE_COLOR_RESOURCES_PATH = 'ColorResources.swifttemplate'

def write_color_resources(colors, resources_path)

    template_file_path = __dir__ + "/" + TEMPLATE_COLOR_RESOURCES_PATH
    template_file = File.open(template_file_path)
    template_content = template_file.read
    template_file.close

    resources_content = colors.map { |cn| "    case #{cn}" }.join("\n")
    template_content[TEMPLATE_COLOR_RESOURCES_PLACE] = resources_content

    color_resources_file = File.open(resources_path, mode='w')
    color_resources_file.write(template_content)
    color_resources_file.close

end
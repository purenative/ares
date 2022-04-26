def read_images_from_assets(images_folder, ignoring)

    color_files_rule = File.join(images_folder, "*.imageset")
    color_files = Dir[color_files_rule]
    color_names = color_files.map { |f| File.basename(f, ".*") }.select { |c| !ignoring.include?(c) }
    return color_names

end
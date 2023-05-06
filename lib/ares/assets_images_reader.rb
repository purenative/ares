# frozen_string_literal: true

module ARES
  module AssetsImagesReader
    def read_images_from_assets(images_folder, ignoring)
      color_files_rule = File.join(images_folder, "*.imageset")
      color_files = Dir[color_files_rule]
      color_files.map { |f| File.basename(f, ".*") }.select { |c| !ignoring.include?(c) }
    end
  end
end

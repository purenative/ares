# frozen_string_literal: true

module ARES
  module AssetsColorsReader
    def read_colors_from_assets(colors_folder, ignoring)
      color_files_rule = File.join(colors_folder, "*.colorset")
      color_files = Dir[color_files_rule]
      color_files.map { |f| File.basename(f, ".*") }.select { |c| !ignoring.include?(c) }
    end
  end
end

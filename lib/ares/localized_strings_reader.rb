# frozen_string_literal: true

require 'set'

module ARES
  module LocalizedStringsReader
    LOCALIZABLE_FILE_NAME = "Localizable.strings"

    def read_localized_strings(localized_resources_folder_path)
      localized_folders = Dir[File.join(localized_resources_folder_path, "*.lproj")]

      if localized_folders.empty?
        strings_file_path = File.join(localized_resources_folder_path, LOCALIZABLE_FILE_NAME)
        keys = read_localized_strings_from_file(strings_file_path)
        keys.to_a
      else
        keys = Set.new

        localized_folders.each do |f|
          strings_file_path = File.join(f, LOCALIZABLE_FILE_NAME)
          language_keys = read_localized_strings_from_file(strings_file_path)
          keys.merge(language_keys)
        end

        keys.to_a
      end
    end

    private

    def read_localized_strings_from_file(localized_strings_file_path)
      keys = Set.new

      strings_file_content = File.read(localized_strings_file_path)
      rows = strings_file_content.split("\n")

      rows.each do |r|
        key = r.split(' = ')[0]
        keys.add(key)
      end

      keys
    end
  end
end

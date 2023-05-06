# frozen_string_literal: true

require "yaml"

module ARES
  module ConfigReader
    def read_config_yaml(config_path)
      return nil unless File.exist?(config_path)

      file_content = File.read(config_path)
      YAML.load(file_content)
    end
  end
end

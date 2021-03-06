require_relative 'read_config_yaml'
require_relative 'read_colors_from_assets'
require_relative 'write_color_resources'
require_relative 'read_images_from_assets'
require_relative 'write_image_resources'
require_relative 'read_localized_strings'
require_relative 'write_localized_strings_resources'
require_relative 'write_localized_string_keys_resources.rb'

COLOR_RESOURCES_CONFIG_ARG_NAME = '-color'
IMAGE_RESOURCES_CONFIG_ARG_NAME = '-image'
LOCALIZED_STRINGS_CONFIG_ARG_NAME = '-localizedstrings'
LOCALIZED_KEYS_CONFIG_ARG_NAME = '-localizedkeys'

class ARES

    def run(args)
        
        Encoding.default_internal = Encoding::UTF_8
        Encoding.default_external = Encoding::UTF_8

        color_resources_config_file_path = nil
        image_resources_config_file_path = nil
        localized_strings_config_file_path = nil
        localized_keys_config_file_path = nil
        
        next_index = 0
        
        until next_index >= args.length - 1 do
            if args[next_index] == COLOR_RESOURCES_CONFIG_ARG_NAME
                color_resources_config_file_path = args[next_index + 1]
                next_index += 2
            elsif args[next_index] == IMAGE_RESOURCES_CONFIG_ARG_NAME
                image_resources_config_file_path = args[next_index + 1]
                next_index += 2
            elsif args[next_index] == LOCALIZED_STRINGS_CONFIG_ARG_NAME
                localized_strings_config_file_path = args[next_index + 1]
                next_index += 2
            elsif args[next_index] == LOCALIZED_KEYS_CONFIG_ARG_NAME
                localized_keys_config_file_path = args[next_index + 1]
                next_index += 2
            else
                next_index += 1
            end
        end
        
        unless color_resources_config_file_path.nil? || color_resources_config_file_path.empty? 
            color_configs = read_config_yaml(color_resources_config_file_path)
            colors = read_colors_from_assets(color_configs['input'].to_s, color_configs['ignore'].to_a)
            write_color_resources(colors, color_configs['output'].to_s)
        end

        unless image_resources_config_file_path.nil? || image_resources_config_file_path.empty?
            image_config = read_config_yaml(image_resources_config_file_path)
            images = read_images_from_assets(image_config['input'].to_s, image_config['ignore'].to_a)
            write_image_resources(images, image_config['output'].to_s)
        end

        unless localized_strings_config_file_path.nil? || localized_strings_config_file_path.empty?
            localized_strings_config = read_config_yaml(localized_strings_config_file_path)
            keys = read_localized_strings(localized_strings_config['input'].to_s)
            write_localized_strings_resources(keys, localized_strings_config['output'].to_s)
        end

        unless localized_keys_config_file_path.nil? || localized_keys_config_file_path.empty?
            localized_strings_keys_config = read_config_yaml(localized_keys_config_file_path)
            keys = read_localized_strings(localized_strings_keys_config['input'].to_s)
            write_localized_string_keys_resources(keys, localized_strings_keys_config['output'].to_s)
        end

    end

end
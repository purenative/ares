require 'yaml'

def read_config_yaml(config_path)

    unless File.exist?(config_path) then
        return nil
    end

    file_content = File.read(config_path)
    config = YAML.load(file_content)
    
    return config

end
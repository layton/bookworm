require 'bookworm'

config_filename = File.join(Rails.root, 'config', 'bookworm.yml')
BookWorm.config = YAML.load(File.read(config_filename)) if File.exist?(config_filename)
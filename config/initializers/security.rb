c = YAML::load(File.open("#{Rails.root}/config/config.yml"))
USERNAME = c["username"]
PASSWORD = c["password"]
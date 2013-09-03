# config/initializers/imgkit.rb
IMGKit.configure do |config|
  config.wkhtmltoimage = '/usr/local/bin/wkhtmltoimage'
  config.default_format = :png
  config.default_options = {
    :quality => 100,
    :encoding => 'UTF-8'
  }
end

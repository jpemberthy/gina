# config/initializers/imgkit.rb
IMGKit.configure do |config|
  if Rails.env.production?
    config.wkhtmltoimage = Rails.root.join('bin', 'wkhtmltoimage').to_s
  else
    config.wkhtmltoimage = '/usr/local/bin/wkhtmltoimage'
  end

  config.default_format = :png
  config.default_options = {
    :quality => 100,
    :encoding => 'UTF-8'
  }
end

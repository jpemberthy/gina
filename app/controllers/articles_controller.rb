class ArticlesController < ApplicationController
  layout false
  # TODO: make blacklist bigger
  BLACKLIST = /googleads|doubleclick/.freeze
  ADS_PATTERN = /((ad(s)?(_|-|\.)+)|((_|-|\.)ad.*))/.freeze

  # No save operations for now, so let's use show.
  def show
    doc = Pismo::Document.new(params[:url]).doc

    doc.xpath("//*[@*[contains(., 'ad')]]").each do |e|
      attributes = e.attributes.values.map(&:value).map(&:downcase)
      e.remove if attributes.detect { |v| v.match(BLACKLIST) || v.match(ADS_PATTERN) }
    end

    # TODO: solve encoding issue with accents.
    kit = IMGKit.new(doc.to_s.html_safe)

    # render inline: doc.to_s.html_safe

    # send_data(kit.to_png, :type => "image/png", :disposition => 'inline')
  end
end

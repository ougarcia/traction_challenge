require 'open-uri'

namespace :scrape do
  desc "Scrape alexa"
  task :alexa => :environment do
    url = 'http://www.alexa.com/topsites'
    data = Nokogiri::HTML(open(url))
    result = []

    data.css('.desc-container').each_with_index do |el, i|
      url = el.css('.desc-paragraph').text.strip
      name = url.gsub(/\..*/, '')
      description = el.css('.description').text.strip
      result << [name, url,  description, i + 1]
    end

    url = 'http://www.alexa.com/topsites/global;1'
    data = Nokogiri::HTML(open(url))

    data.css('.desc-container').each_with_index do |el, i|
      url = el.css('.desc-paragraph').text.strip
      name = url.gsub(/\..*/, '')
      description = el.css('.description').text.strip
      result << [name, url,  description, i + 26]
    end

    result.each { |r| p r }
  end
end

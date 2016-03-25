require 'open-uri'

namespace :scrape do
  desc "Scrape alexa"
  task :alexa => :environment do
    scrape_site('http://www.alexa.com/topsites', 1)
    scrape_site('http://www.alexa.com/topsites/global;1', 26)
    scrape_site('http://www.alexa.com/topsites/global;2', 51)
    scrape_site('http://www.alexa.com/topsites/global;3', 76)
  end


  def scrape_site(url_to_scrape, offset)
    data = Nokogiri::HTML(open(url_to_scrape))

    data.css('.desc-container').each_with_index do |el, i|
      url = el.css('.desc-paragraph').text.strip
      name = url.gsub(/\..*/, '')
      description = el.css('.description').text.strip
      Site.create!(name: name, url: url, ranking: (i + offset), description: description)
    end
  end
end

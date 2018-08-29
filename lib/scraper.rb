require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students= Nokogiri::HTML(open(index_url)).css(".student-card")
    
    students.collect do |student|
      { :name => "#{student.css(".student-name").text}",
        :location => "#{student.css(".student-location").text}",
        :profile_url => "#{student.css("a").attribute("href").value}" }
    end
  end

  def self.scrape_profile_page(profile_url)
    profile= Nokogiri::HTML(open(profile_url))
  end

end

          
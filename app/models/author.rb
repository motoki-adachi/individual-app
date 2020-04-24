class Author < ApplicationRecord
  require 'mechanize'
  has_many :books

  def self.scrape
    agent = Mechanize.new
    page = agent.get("https://ja.wikipedia.org/wiki/%E6%97%A5%E6%9C%AC%E3%81%AE%E5%B0%8F%E8%AA%AC%E5%AE%B6%E4%B8%80%E8%A6%A7")
    elements = page.search('li a')
    elements.each do |element|
      author = Author.new
      author.name = element.inner_text
      author.save
    end
  end
end

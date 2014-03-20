require 'httparty'
require 'json'

class Checker

  API_URL = "https://rubygems.org/api/v1/search.json"

  def initialize(gemname)
    @gemname = gemname
  end

  def checking
    @gemname
  end

  def available?
    url = "#{API_URL}?query={@gemname}"
    response = HTTParty.get(url)
    JSON.parse(response.body).empty?
  end

end

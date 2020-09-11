class SearchController < ApplicationController
  def index
    author = params[:author]

    conn = Faraday.new(url: 'https://poetrydb.org')

    response = conn.get("/author/#{author}")
    require "pry"; binding.pry
  end
end

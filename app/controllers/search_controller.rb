class SearchController < ApplicationController
  def index
    author = params[:author]

    conn = Faraday.new(url: 'https://poetrydb.org')

    response = conn.get("/author/#{author}")

    json = JSON.parse(response.body, symbolize_names: true)

    @poems = json[0..9]
  end
end

class SearchController < ApplicationController
  def index
    # General Poem information
    author = params[:author]

    conn = Faraday.new(url: 'https://poetrydb.org')

    response = conn.get("/author/#{author}")

    json = JSON.parse(response.body, symbolize_names: true)

    top_poems = json[0..9]
    require "pry"; binding.pry
    # Tone analyzer
    conn = Faraday.new(url) do |connection|
      connection.basic_auth("apikey", ENV['IBM_TONE_API_KEY'])
    end
    
    response = conn.get("https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances/ff970768-3ae3-4524-84a9-e0441061d4c1/v3/tone?version=2017-09-21&text=#{poem.lines}")
  end
end

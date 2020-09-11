class SearchController < ApplicationController
  def index
    # General Poem information
    author = params[:author]

    conn = Faraday.new(url: 'https://poetrydb.org')

    response = conn.get("/author/#{author}")

    json = JSON.parse(response.body, symbolize_names: true)

    top_poems = json[0..9]

    @poems = []

    top_poems.each do |poem|
      @poems << Poem.new(poem[:title], poem[:author], poem[:lines])
    end

    # Tone analyzer
    conn = Faraday.new("https://api.us-south.tone-analyzer.watson.cloud.ibm.com") do |connection|
      connection.basic_auth("apikey", ENV['IBM_TONE_API_KEY'])
    end

    @poems.each do |poem|
      response = conn.get("/instances/ff970768-3ae3-4524-84a9-e0441061d4c1/v3/tone?version=2017-09-21&text=#{poem.lines}")
      json = JSON.parse(response.body, symbolize_names: true)
      json[:document_tone][:tones].each do |tone|
        poem.tones << tone[:tone_name]
      end
    end
  end
end

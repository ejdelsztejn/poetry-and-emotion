class SearchController < ApplicationController
  def index
    # General Poem information
    author = params[:author]

    # poem_service = PoemService.new
    # results = poem_service.poems(author)
    #
    # @poems = []
    #
    # results.each do |poem|
    #   @poems << Poem.new(poem[:title], poem[:author], poem[:lines])
    # end

    poem_facade = PoemFacade.new(author)
    @poems = poem_facade.find_poems
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

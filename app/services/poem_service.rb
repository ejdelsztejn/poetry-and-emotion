class PoemService
  def poems(author)
    response = conn.get("/author/#{author}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[0..9]
  end

  private

  def conn
    Faraday.new(url: 'https://poetrydb.org')
  end
end

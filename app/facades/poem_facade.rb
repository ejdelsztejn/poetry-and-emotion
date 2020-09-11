class PoemFacade
  def initialize(author)
    @author = author
    @poem_service ||= PoemService.new
  end

  def find_poems
    poems_data = get_poems_data
    poems_data.map do |poem_data|
      Poem.new(poem_data)
    end
  end

  def get_poems_data
    @poem_service.poems(@author)
  end
end

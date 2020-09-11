class Poem
  attr_reader :id,
              :title,
              :author,
              :lines

  attr_accessor :tones

  def initialize(data)
    @title  = data[:title]
    @author = data[:author]
    @lines  = data[:lines].join(' ')
    @tones = []
  end
end

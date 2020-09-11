class Poem
  attr_reader :id,
              :title,
              :author,
              :lines

  attr_accessor :tones

  def initialize(title, author, lines)
    @title  = title
    @author = author
    @lines  = lines.join(' ')
    @tones = []
  end
end

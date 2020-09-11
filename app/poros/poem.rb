class Poem
  attr_reader :id,
              :title,
              :author,
              :lines,
              :tones

  def initialize(title, author, lines)
    @title  = title
    @author = author
    @lines  = lines].join(' ')
    @tones = nil
  end
end

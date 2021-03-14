require_relative 'pattern'

Literal = Struct.new(:character) do
  include Pattern

  def to_s
    character
  end

  def precedence
    3
  end
end

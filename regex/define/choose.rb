require_relative 'pattern'

Choose = Struct.new(:first, :second) do
  include Pattern

  def to_s
    [first, second].map { |pattern| pattern.bracket(precedence) }.join('|')
  end

  def precedence
    0
  end
end

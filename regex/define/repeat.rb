require_relative 'pattern'

Repeat = Struct.new(:pattern) do
  include Pattern

  def to_s
    "#{pattern.bracket(precedence)}*"
  end

  def precedence
    2
  end
end

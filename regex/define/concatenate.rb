require_relative 'pattern'

# 连接
Concatenate = Struct.new(:first, :second) do
  include Pattern

  def to_s
    [first, second].map { |pattern| pattern.bracket(precedence) }.join
  end

  def precedence
    1
  end
end

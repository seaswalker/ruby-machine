require_relative 'nothing'
require_relative '../sequence/sequence'

While = Struct.new(:condition, :body) do
  def to_s
    "while (#{condition}) { #{body} }"
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    true
  end

  def reduce(environment)
    [If.new(condition, Sequence.new(body, self), Nothing.new), environment]
  end
end

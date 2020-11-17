require_relative 'nothing'

Assign = Struct.new(:name, :expression) do
  def to_s
    "#{name} = #{expression}"
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    true
  end

  def reduce(environment)
    if expression.reducible?
      [Assign.new(name, expression.reduce(environment)), environment]
    else
      [Nothing.new, environment.merge({ name => expression })]
    end
  end
end

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

  def evaluate(environment)
    environment.merge({ name => expression.evaluate(environment) })
  end

  def to_ruby
    "-> e {e.merge({#{name.inspect} => (#{expression.to_ruby}).call(e)})}"
  end
end

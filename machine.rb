require File.join(File.dirname(__FILE__), 'number')
require_relative 'variable'

Machine = Struct.new(:expression, :environment) do
  def step
    self.expression = expression.reduce(environment)
  end

  def run
    while expression.reducible?
      puts expression
      step
    end
    puts expression
  end
end

Machine.new(
  Add.new(Variable.new(:x), Variable.new(:y)),
  { x: Number.new(3), y: Number.new(4) }
).run

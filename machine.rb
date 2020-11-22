require 'require_all'
require_all 'expression'
require_all 'statement'
require_all 'sequence'

Machine = Struct.new(:statement, :environment) do
  def step
    self.statement, self.environment = statement.reduce(environment)
  end

  def run
    while statement.reducible?
      puts "#{statement}, #{environment}"
      step
    end
    puts "#{statement}, #{environment}"
  end
end

Machine.new(
  While.new(
    LessThan.new(Variable.new(:x), Number.new(5)),
    Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(2)))
  ),
  { x: Number.new(1) }
).run

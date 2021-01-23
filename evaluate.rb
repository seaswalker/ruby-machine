require 'require_all'
require_all 'expression'
require_all 'statement'
require_all 'sequence'

puts(Number.new(23).evaluate({}))
puts(Variable.new(:x).evaluate({ x: Number.new(23) }))
puts(LessThan.new(
  Add.new(
    Variable.new(:x), Number.new(4)
  ),
  Variable.new(:y)
).evaluate({ x: Number.new(2), y: Number.new(5) }))

statement = Sequence.new(
  Assign.new(:x, Add.new(Number.new(1), Number.new(2))),
  Assign.new(:y, Add.new(Variable.new(:x), Number.new(7)))
)
puts(statement.evaluate({}))

statement = While.new(
  LessThan.new(Variable.new(:x), Number.new(5)),
  Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(2)))
)
puts(statement.evaluate({ x: Number.new(1) }))

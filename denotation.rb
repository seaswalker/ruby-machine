# 2.4 指称语义
require 'require_all'
require_all 'expression'
require_all 'statement'
require_all 'sequence'

puts(Number.new(3).to_ruby)
puts(Boolean.new(false).to_ruby)

proc = eval(Number.new(5).to_ruby)
puts(proc)
puts(proc.call({}))

proc = eval(Variable.new(:x).to_ruby)
puts(proc.call({ x: 6 }))

proc = eval(Add.new(Variable.new(:x), Number.new(4)).to_ruby)
puts(proc.call({ x: 3 }))

proc = eval(Assign.new(:x, Number.new(3)).to_ruby)
puts(proc.call({}))

statement = While.new(
  LessThan.new(Variable.new(:x), Number.new(5)),
  Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(2)))
)
puts(eval(statement.to_ruby).call({ x: 1 }))

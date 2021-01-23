require 'treetop'
require 'require_all'
require_all '../statement'
require_all '../expression'

Treetop.load('../treetop/simple')
parse_tree = SimpleParser.new.parse('while (x < 5) { x = x * 3 }')
statement = parse_tree.to_ast
puts(statement)

puts(statement.evaluate({ x: Number.new(1) }))
puts statement.to_ruby

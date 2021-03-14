require 'require_all'
require_all 'define'

pattern = Repeat.new(
  Choose.new(
    Concatenate.new(Literal.new('a'), Literal.new('b')),
    Literal.new('a')
  )
)

puts(pattern)

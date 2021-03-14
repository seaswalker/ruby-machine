require_relative 'define/empty'
require_relative 'define/literal'
require_relative 'define/repeat'
require_relative 'define/concatenate'
require_relative 'define/choose'

pattern = Repeat.new(
  Choose.new(
    Concatenate.new(Literal.new('a'), Literal.new('b')),
    Literal.new('a')
  )
)

puts(pattern)

# 3.3.2 语义
nfa_design = Empty.new.to_nfa_design
puts(nfa_design.accepts?(''))
puts(nfa_design.accepts?('a'))
nfa_design = Literal.new('a').to_nfa_design
puts(nfa_design.accepts?(''))
puts(nfa_design.accepts?('a'))
puts(nfa_design.accepts?('b'))
puts(Empty.new.matches?(''))
puts(Literal.new('b').matches?('a'))

pattern = Concatenate.new(Literal.new('a'), Literal.new('b'))
puts(pattern.matches?('a'))
puts(pattern.matches?('ab'))
puts(pattern.matches?('abc'))

pattern = Concatenate.new(
  Literal.new('a'),
  Concatenate.new(Literal.new('b'), Literal.new('c'))
)
puts(pattern.matches?('a'))
puts(pattern.matches?('ab'))
puts(pattern.matches?('abc'))

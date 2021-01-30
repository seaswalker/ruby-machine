require_relative 'nfa_rulebook'
require_relative '../dfa/dfa_rule_book'
require_relative 'nfa'
require_relative 'nfa_design'

rulebook = NFARulebook.new([
                             FARule.new(1, 'a', 1), FARule.new(1, 'b', 1),
                             FARule.new(1, 'b', 2), FARule.new(2, 'a', 3),
                             FARule.new(2, 'b', 3), FARule.new(3, 'a', 4),
                             FARule.new(3, 'b', 4)
                           ])

puts(rulebook.next_states(Set[1], 'b'))
puts(rulebook.next_states(Set[1, 2], 'a'))
puts(rulebook.next_states(Set[1, 3], 'b'))

nfa = NFA.new(Set[1], [4], rulebook)
puts(nfa.accepting?)
nfa = NFA.new(Set[1, 2, 4], [4], rulebook)
puts(nfa.accepting?)

puts('----------------')
nfa = NFA.new(Set[1], [4], rulebook)
puts(nfa.accepting?)
nfa.read_character('b')
puts(nfa.accepting?)
nfa.read_character('a')
puts(nfa.accepting?)
nfa.read_character('b')
puts(nfa.accepting?)
nfa = NFA.new(Set[1], [4], rulebook)
puts(nfa.accepting?)
nfa.read_string('bbbbb')
puts(nfa.accepting?)

puts('----------------')
nfa_design = NFADesign.new(1, [4], rulebook)
puts(nfa_design.accepts?('bab'))
puts(nfa_design.accepts?('bbbbb'))
puts(nfa_design.accepts?('bbabb'))

puts('----------------')
rulebook = NFARulebook.new([
                             FARule.new(1, nil, 2), FARule.new(1, nil, 4),
                             FARule.new(2, 'a', 3), FARule.new(3, 'a', 2),
                             FARule.new(4, 'a', 5), FARule.new(5, 'a', 6),
                             FARule.new(6, 'a', 4)
                           ])
puts(rulebook.follow_free_moves(Set[1]))

puts('----------------------')
nfa_design = NFADesign.new(1, [2, 4], rulebook)
puts(nfa_design.accepts?('aa'))
puts(nfa_design.accepts?('aaa'))
puts(nfa_design.accepts?('aaaaa'))
puts(nfa_design.accepts?('aaaaaa'))

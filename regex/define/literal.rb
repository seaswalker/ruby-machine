require_relative 'pattern'
require_relative '../../dfa/dfa_rule_book'
require_relative '../../nfa/nfa_rulebook'
require_relative '../../nfa/nfa_design'

Literal = Struct.new(:character) do
  include Pattern

  def to_s
    character
  end

  def precedence
    3
  end

  def to_nfa_design
    start_state = Object.new
    accept_state = Object.new
    rule = FARule.new(start_state, character, accept_state)
    rulebook = NFARulebook.new([rule])
    NFADesign.new(start_state, [accept_state], rulebook)
  end
end

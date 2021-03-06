require_relative 'pattern'

# 连接
Concatenate = Struct.new(:first, :second) do
  include Pattern

  def to_s
    [first, second].map { |pattern| pattern.bracket(precedence) }.join
  end

  def precedence
    1
  end

  def to_nfa_design
    first_nfa_design = first.to_nfa_design
    second_nfa_design = second.to_nfa_design
    start_state = first_nfa_design.start_state
    accept_states = second_nfa_design.accept_states
    rules = first_nfa_design.rulebook.rules + second_nfa_design.rulebook.rules
    extra_rules = first_nfa_design.accept_states.map do |state|
      # character为nil的为利用的NFA free move特性，参考书中3.2.2节
      FARule.new(state, nil, second_nfa_design.start_state)
    end
    rulebook = NFARulebook.new(rules + extra_rules)
    NFADesign.new(start_state, accept_states, rulebook)
  end
end

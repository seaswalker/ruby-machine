require_relative 'pattern'

Repeat = Struct.new(:pattern) do
  include Pattern

  def to_s
    "#{pattern.bracket(precedence)}*"
  end

  def precedence
    2
  end

  def to_nfa_design
    start_state = Object.new
    pattern_nfa_design = pattern.to_nfa_design

    # 空支持
    accept_states = pattern_nfa_design.accept_states + [start_state]
    rules = pattern_nfa_design.rulebook.rules
    # 每个接受状态重新指向开始状态，这样就可以支持表达式重复
    extra_rules = pattern_nfa_design.accept_states.map do |accept_state|
      FARule.new(accept_state, nil, start_state)
    end
    extra_rules = extra_rules + [FARule.new(start_state, nil, pattern_nfa_design.start_state)]
    rulebook = NFARulebook.new(rules + extra_rules)

    NFADesign.new(start_state, accept_states, rulebook)
  end
end

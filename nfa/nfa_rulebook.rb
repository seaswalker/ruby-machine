require 'set'

NFARulebook = Struct.new(:rules) do
  def rules_for(state, character)
    rules.select { |rule| rule.applies_to?(state, character) }
  end

  def follow_rules_for(state, character)
    rules_for(state, character).map(&:follow)
  end

  def next_states(states, character)
    states.flat_map { |state| follow_rules_for(state, character) }.to_set
  end
end

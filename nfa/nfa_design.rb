require_relative 'nfa'

NFADesign = Struct.new(:start_state, :accept_states, :rulebook) do
  def accepts?(string)
    to_nfa.tap { |nfa| nfa.read_string(string) }.accepting?
  end

  def to_nfa
    NFA.new(Set[start_state], accept_states, rulebook)
  end
end

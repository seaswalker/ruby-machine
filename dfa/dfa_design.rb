DFADesign = Struct.new(:start_state, :accept_states, :rulebook) do
  def to_dfa
    DFA.new(start_state, accept_states, rulebook)
  end

  # 每次都是在一个全新创建的dfa对象基础上操作
  def accepts?(string)
    to_dfa.tap { |dfa| dfa.read_string(string) }.accepting?
  end
end

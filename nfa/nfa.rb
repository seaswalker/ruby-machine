NFA = Struct.new(:current_states, :accept_states, :rulebook) do
  def accepting?
    # 取交集
    (current_states & accept_states).any?
  end

  def read_character(character)
    self.current_states = rulebook.next_states(current_states, character)
  end

  def read_string(string)
    string.chars.each do |character|
      read_character(character)
    end
  end

  def current_states
    # super的意思是调用父类的同名方法并将父方法的返回值拿过来作为follow_free_moves的参数
    # 要想使用这样的语法，NFA的定义方式必须修改为class NFA < Struct.new(...)，这样不是最优的写法，参考:
    # https://stackoverflow.com/questions/49294676/why-shouldnt-i-extend-an-instance-initialized-by-struct-new
    # rulebook.follow_free_moves(super)
    rulebook.follow_free_moves(self[:current_states])
  end
end

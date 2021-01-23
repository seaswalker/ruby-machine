Boolean = Struct.new(:value) do
  def to_s
    value.to_s
  end

  def inspect
    "<<#{value}>>"
  end

  def reducible?
    false
  end
  
  def evaluate(environment)
    self
  end

  def to_ruby
    "-> e {#{value.inspect}}"
  end
end

Variable = Struct.new(:name) do
  def to_s
    name.to_s
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    true
  end

  def reduce(environment)
    environment[name]
  end
end

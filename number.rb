Number = Struct.new(:value) do
  def to_s
    value.to_s
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    false
  end
end

Add = Struct.new(:left, :right) do
  def to_s
    "#{left} + #{right}"
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    true
  end

  def reduce
    if left.reducible?
      Add.new(left.reduce, right)
    elsif right.reducible?
      Add.new(left, right.reduce)
    else
      Number.new(left.value + right.value)
    end
  end
end

Multiply = Struct.new(:left, :right) do
  def to_s
    "#{left} * #{right}"
  end

  def inspect
    "<<#{self}>>>"
  end

  def reducible?
    true
  end

  def reduce
    if left.reducible?
      Multiply.new(left.reduce, right)
    elsif right.reducible?
      Multiply.new(left, right.reduce)
    else
      Number.new(left.value * right.value)
    end
  end
end

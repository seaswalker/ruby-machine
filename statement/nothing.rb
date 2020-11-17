# A do nothing statement
class Nothing
  def to_s
    'do_nothing'
  end

  def inspect
    "<<#{self}>>"
  end

  def ==(other)
    other.instance_of?(Nothing)
  end

  def reducible?
    false
  end
end

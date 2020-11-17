require File.join(File.dirname(__FILE__), 'number')
require_relative 'variable'
Dir[File.dirname(__FILE__) + '/statement/*.rb'].each { |file| require file }

Machine = Struct.new(:statement, :environment) do
  def step
    self.statement, self.environment = statement.reduce(environment)
  end

  def run
    while statement.reducible?
      puts "#{statement}, #{environment}"
      step
    end
    puts "#{statement}, #{environment}"
  end
end

Machine.new(
  Assign.new(:x, Add.new(Variable.new(:x), Number.new(1))),
  { x: Number.new(2) }
).run

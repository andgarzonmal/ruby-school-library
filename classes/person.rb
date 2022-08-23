require_relative './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknow', parent_permission: true)
    super()
    @id = rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  # Renamed variable according to linters instrucctions 🤷‍♂️
  private

  def of_age?
    return true if @age >= 18

    false
  end

  public

  def can_use_services?
    return true if @age >= 18 || @parent_permission == true

    false
  end
end

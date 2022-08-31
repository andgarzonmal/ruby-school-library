require_relative './nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def initialize(age, name = 'Unknow', id = nil, parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = id || Random.rand(1...1000)
    @rentals = []
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

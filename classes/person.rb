class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknow', parent_permission: true)
    @id = rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # Renamed variable according to linters instrucctions 🤷‍♂️
  def of_age?
    return true if @age >= 18

    false
  end

  def can_use_services?
    return true if @age >= 18 || @parent_permission == true

    false
  end

  public :can_use_service
  private :of_age
end

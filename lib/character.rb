class Character
  attr_reader :name_actor_salary,
              :name,
              :actor,
              :salary
  def initialize(name_actor_salary)
    @name   = name_actor_salary[:name]
    @actor  = name_actor_salary[:actor]
    @salary = name_actor_salary[:salary]
  end
  
end

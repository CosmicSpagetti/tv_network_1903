class Network
  attr_reader :name,
              :shows
  def initialize(name)
    @name  = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def highest_paid_actor
    characters = @shows.map{|show| show.characters}.flatten
    actor = characters.max_by{|char| char.salary}
    actor.actor
  end

  def payroll
      characters = @shows.map{|show| show.characters}.flatten
      actor = characters.map{|char| char.actor}
      salary = characters.map{|char|  char.salary}
      payrolls = Hash[actor.zip(salary)]

  end
end

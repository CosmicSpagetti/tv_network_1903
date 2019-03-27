require './lib/character'
require './lib/show'
require './lib/network'
require 'minitest/autorun'
require 'minitest/pride'

class NetworkTest < Minitest::Test
  def test_it_exist_and_has_name_and_empty_show_array
    nbc = Network.new("NBC")

    assert_instance_of Network, nbc
    assert_equal "NBC", nbc.name
    assert_equal [], nbc.shows
  end

  def test_can_use_add_shows_to_shows
    nbc = Network.new("NBC")
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

    assert_equal [knight_rider, parks_and_rec], nbc.shows
  end

  def test_can_check_for_highest_paid_actor
    nbc = Network.new("NBC")
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

    assert_equal "Amy Poehler", nbc.highest_paid_actor
  end

  def test_payroll_shows_all_actors_salary
    nbc = Network.new("NBC")
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)
    require 'pry'; binding.pry
    nbc.payroll #IDK HOW TO WRITE THIS TEST BUT I DID THE THING
    # assert_equal {"David Hasselhoff" => 1600000, "William Daniels" => 1000000, "Amy Poehler" => 2000000, "Nick Offerman" => 1400000}, nbc.payroll
  end
end

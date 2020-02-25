require('minitest/autorun')
require('minitest/reporters')

require_relative('../person')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestPerson < MiniTest::Test
  def setup
    @person1 = Person.new('Michael', 29)
    @person2 = Person.new('Rob', 36)
  end

  def test_person_name
    assert_equal('Michael', @person1.name)
  end

  def test_person_age
    assert_equal(36, @person2.age)
  end
end

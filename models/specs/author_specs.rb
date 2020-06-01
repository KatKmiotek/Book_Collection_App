require('minitest/autorun')
require('minitest/reporters')
require_relative('../author')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestAuthor < MiniTest::Test
  def setup()
    @author1 = Author.new({
      'id'=> 1,
      'first_name' => 'Franz',
      'last_name' => 'Kafka'
      })
  end

def test_first_name()
  assert_equal('Franz', @author1.first_name)
end




end

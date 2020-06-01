require('minitest/autorun')
require('minitest/reporters')
require_relative('../user')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestUser < MiniTest::Test
  def setup()
    @user1 = User.new({
      'id' => 1,
      'name' =>'Kat'
      })
  end

def test_name()
  assert_equal('Kat', @user1.name)
end

end

require('minitest/autorun')
require('minitest/reporters')
require_relative('../book')
require_relative('../author')
require_relative('../user')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestBook < MiniTest::Test
  def setup()
    @user1 = User.new({
      'id' => 1,
      'name' => 'Kat'
      })

    @author1 = Author.new({
      'id'=> 1,
      'first_name' => 'Franz',
      'last_name' => 'Kafka'
      })

    @book1 = Book.new({
      'id'=> 1,
      'title' => 'The Castle',
      'status' => 'have read',
      'location' => 'home',
      'language' => 'English',
      'comment' => 'very good',
      'author_id' => @author1.id,
      'user_id' => @user1.id
      })
  end

def test_comment()
  assert_equal('very good', @book1.comment)
end

def test_author_id()
  assert_equal(1, @book1.author_id)
end



end

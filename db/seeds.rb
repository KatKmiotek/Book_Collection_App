require('pry')
require_relative('../models/book')
require_relative('../models/user')

User.delete_all()
Book.delete_all()

user1 = User.new({
  'name' => 'Kat'
  })
user1.save()

book1 = Book.new({
  'title' => 'The Castle',
  'author' => 'Franz Kafka',
  'status' => 'have read',
  'location' => 'at home',
  'language' => 'English',
  'comment' => 'Very good',
  'user_id' => user1.id
  })
book2 = Book.new({
  'title' => 'America',
  'author' => 'Franz Kafka',
  'status' => 'to read',
  'location'=> 'at home',
  'language' => 'English',
  'comment' => '',
  'user_id' => user1.id
  })
book3 = Book.new({
  'title' => 'Down and out in Paris and London',
  'author' => 'George Orwell',
  'status' => 'to read',
  'location'=> 'at home',
  'language' => 'English',
  'comment' => '',
  'user_id' => user1.id
  })
book4 = Book.new({
  'title' => 'Lord of the Flies',
  'author' => 'William Golding',
  'status' => 'have read',
  'location' => 'at home',
  'language' => 'English',
  'comment' => 'Very good',
  'user_id' => user1.id
})
book5 = Book.new({
  'title' => 'Blindness',
  'author' => 'Jose Saramago',
  'status' => 'have read',
  'location' => 'away',
  'language' => 'English',
  'comment' => 'Paddy has it',
  'user_id' => user1.id
})
book6 = Book.new({
  'title' => 'Seeing',
  'author' => 'Jose Saramago',
  'status' => 'have read',
  'location' => 'at home',
  'language' => 'English',
  'comment' => '',
  'user_id' => user1.id
})
book7 = Book.new({
  'title' => 'Meditations',
  'author' => 'Marcus Aurelius',
  'status' => 'reading',
  'location' => 'at home',
  'language' => 'English',
  'comment' => '',
  'user_id' => user1.id
})
book8 = Book.new({
  'title' => 'Death at Intervals',
  'author' => 'Jose Saramago',
  'status' => 'have read',
  'location' => 'at home',
  'language' => 'English',
  'comment' => '',
  'user_id' => user1.id
})
book1.save()
book2.save()
book3.save()
book4.save()
book5.save()
book6.save()
book7.save()
book8.save()


binding.pry
nil

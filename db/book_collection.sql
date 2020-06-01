
DROP TABLE books;
DROP TABLE users;


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255),
  status VARCHAR(255),
  location VARCHAR(255),
  language VARCHAR(255),
  comment TEXT,
  user_id INT REFERENCES users(id) ON DELETE CASCADE
);

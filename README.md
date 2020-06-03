# Project01
book collection db

About the project:
  The app is a user friendly interface allowing to keep a track of books in collection.
Database includes two tables- users and books.
User is able to add book: author, title (are required in a add new book form), language that book is written in, location of the book status (to read, have read, reading) and comment.
  List of collection can be accessed via 'view them button' on Home Page or from nav bar 'your collection'. From there user can 'see details' of each book (as index view doesn't show everything), update them or delete entry.
By going back to index view user is able to sort book collection by author, title, status DESC, location DESC (table header indicator arrow).
  Search function of index view allows user to browse entire collection by typing keyword or even single letter. Ruby function (SQL) will loop database columns (author, title, comment) and return index view of matching items.
This is available for 'logged in' user. App has the admin site as well accessible via Admin link in top bar. User with admin rights can see list of all users and number of books in their collection, access index view of their collections, can also add and delete user.

For user is important to see result of their action so redirecting appears in case of adding and updating book but with case of removing it from collection user gets notification.

HTML:
Semantic HTML (nav, form, table, article) and carefully used h1-h6 tags to improve accessibility

CSS:
Color properties are defined by CSS variable (at :root) what could be useful with working on bigger design project
highlighted rows in index view. hover functions on submit buttons.

Diagrams:
1) object diagram and class diagram

 * https://miro.com/app/board/o9J_krvdYjw=/

2) use cases and sitemap

* https://miro.com/app/board/o9J_kruwIPw=/


3) planning board
* https://trello.com/b/zTo3RhI5/project-1

4) activity diagram
* https://miro.com/app/board/o9J_krz7SZg=/

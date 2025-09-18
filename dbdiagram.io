Table Authors {
  author_id int [pk]
  name varchar
  bio text
}

Table Books {
  book_id int [pk]
  title varchar
  genre varchar
  published_year year
}

Table BookAuthors {
  book_id int [ref: > Books.book_id]
  author_id int [ref: > Authors.author_id]
}

Table Members {
  member_id int [pk]
  name varchar
  email varchar
  join_date timestamp
}

Table Loans {
  loan_id int [pk]
  book_id int [ref: > Books.book_id]
  member_id int [ref: > Members.member_id]
  loan_date timestamp
  return_date date
}

CREATE TABLE students
( record_book numeric(5) NOT NULL,
  name text NOT NULL,
  doc_ser numeric(4),
  doc_num numeric(6),
  PRIMARY KEY (record_book),
  CONSTRAINT unique_passport UNIQUE (doc_ser, doc_num)
);

CREATE TABLE progress
( record_book numeric(5) NOT NULL,
  subject text NOT NULL,
  acad_year text NOT NULL,
  term numeric(1) NOT NULL CHECK (term = 1 OR term = 2),
  mark numeric(1) NOT NULL CHECK (mark >= 3 AND mark <= 5)
    DEFAULT 5,
  FOREIGN KEY (record_book)
    REFERENCES students (record_book)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
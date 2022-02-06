DROP TABLE IF EXISTS students CASCADE;
DROP TABLE progress;

CREATE TABLE students
( record_book numeric(5) NOT NULL UNIQUE,
  name text NOT NULL,
  doc_ser numeric(4),
  doc_num numeric(6),
  who_adds_row text DEFAULT current_user,
  time_added timestamp DEFAULT current_timestamp,
  PRIMARY KEY (doc_ser, doc_num)
);

CREATE TABLE progress
( doc_ser numeric(4),
  doc_num numeric(6),
  subject text NOT NULL,
  acad_year text NOT NULL,
  term numeric(1) NOT NULL CHECK (term = 1 OR term = 2),
  mark numeric(1) NOT NULL CHECK (mark >= 3 AND mark <= 5)
    DEFAULT 5,
  FOREIGN KEY (doc_ser, doc_num)
    REFERENCES students (doc_ser, doc_num)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

COMMENT ON COLUMN progress.mark IS 'Student''s term-closing exam grade';

INSERT INTO students (record_book, name, doc_ser, doc_num)
  VALUES (12300, 'Иванов Иван Иванович', 0402, 543281);

INSERT INTO progress (doc_ser, doc_num, subject, acad_year, term)
  VALUES (0402, 543281, 'Линейная алгебра', 2010, 1);

ALTER TABLE progress
  ADD COLUMN test_form text NOT NULL CHECK (test_form IN ('экзамен', 'зачёт'))
    DEFAULT 'экзамен';

ALTER TABLE progress
  ADD CHECK (
    (test_form = 'экзамен' AND mark IN (3, 4, 5))
    OR
    (test_form = 'зачёт' AND mark IN (0, 1))
  );

INSERT INTO progress (doc_ser, doc_num, subject, acad_year, term)
  VALUES (0402, 543281, 'Физика', '2016/2017', 1);

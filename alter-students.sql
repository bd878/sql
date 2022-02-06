ALTER TABLE students DROP CONSTRAINT IF EXISTS students_name_check;
ALTER TABLE students ADD CHECK (trim(name) <> '');

INSERT INTO students VALUES (12345, '  ', 0689, 394246); -- should fail
INSERT INTO students VALUES (12346, ' ', 9999, 234123); -- should fail

ALTER TABLE progress
  DROP CONSTRAINT IF EXISTS progress_doc_ser_doc_num_fkey;

ALTER TABLE students
  ALTER COLUMN doc_ser SET DATA TYPE varchar(4),
  ALTER COLUMN doc_num SET DATA TYPE varchar(6);

ALTER TABLE progress
  ALTER COLUMN doc_ser SET DATA TYPE varchar(4),
  ALTER COLUMN doc_num SET DATA TYPE varchar(6);

ALTER TABLE progress
  ADD FOREIGN KEY (doc_ser, doc_num)
    REFERENCES students (doc_ser, doc_num);
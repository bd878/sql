DROP TABLE IF EXISTS subjects;

CREATE TABLE subjects
( subject_code integer,
  subject_name varchar(30) NOT NULL,
  PRIMARY KEY (subject_code)
);

INSERT INTO subjects
  VALUES (1, 'Физика'),
         (2, 'Линейная алгебра'),
         (3, 'Аналитическая геометрия'),
         (4, 'Схемотехника');

ALTER TABLE progress
  ALTER COLUMN subject SET DATA TYPE integer
    USING (CASE WHEN subject = 'Физика' THEN 1
                WHEN subject = 'Линейная алгебра' THEN 2
                WHEN subject = 'Аналитическая геометрия' THEN 3
                ELSE 4 END
    );

ALTER TABLE progress
  ADD FOREIGN KEY (subject)
    REFERENCES subjects (subject_code);

ALTER TABLE progress
  RENAME COLUMN subject TO subject_code;

ALTER TABLE progress
  RENAME CONSTRAINT progress_subject_fkey
  TO progress_subject_code_fkey;

ALTER TABLE subjects ADD UNIQUE (subject_name);
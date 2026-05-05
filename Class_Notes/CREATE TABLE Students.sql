CREATE TABLE Students(
id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
age INTEGER,
grade TEXT,
email TEXT UNIQUE,
gpa REAL DEFAULT 0.00
)

DROP TABLE IF EXISTS Students

INSERT INTO Students(first_name, last_name, age, grade, email)
VALUES("Marlene", "Achieng", "27", "10th", "achienglina@gmail.com")

SELECT * FROM Students WHERE age < 25
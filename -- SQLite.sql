-- SQLite
SELECT name FROM sqlite_master WHERE type='table';

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT,
    password TEXT
);

PRAGMA table_info(users);

SELECT * FROM users;

INSERT INTO users (name, email, password) VALUES ('gilang', 'gilang@gmail.com', '123');

SELECT * FROM users;
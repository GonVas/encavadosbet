PRAGMA foreign_keys = 1;
DROP TABLE if exists candidate;
DROP TABLE if exists ip_vote;


CREATE TABLE candidate (

  id INTEGER PRIMARY KEY, 
  name text UNIQUE NOT NULL,
  matriculas text,
  curso text,
  image text NOT NULL
);


CREATE TABLE ip_vote (
  ip_id INTEGER PRIMARY KEY,
  ip text NOT NULL,
  ip_candidate INTEGER,

  FOREIGN KEY (ip_candidate) REFERENCES candidate(id)
);


INSERT INTO candidate (ID,NAME,matriculas, curso, image)
VALUES (1, 'OCO', '4', 'INPHORMATICA', 'sample');

INSERT INTO candidate (ID,NAME,matriculas, curso, image)
VALUES (2, 'RODRIGUEZ', '10' ,'ELECTRO', 'sample2' );

INSERT INTO candidate (ID,NAME,matriculas, curso, image)
VALUES (3, 'TOGAPI', '9', 'BIO', 'sample2');

INSERT INTO ip_vote (ip_id, ip, ip_candidate)
VALUES (1, '192.168.12.2', 1);

INSERT INTO ip_vote (ip_id, ip, ip_candidate)
VALUES (2, '192.169.12.2', 2);
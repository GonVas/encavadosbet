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


CREATE TABLE vote (
  vote_id INTEGER PRIMARY KEY,
  who text NOT NULL,
  what_candidate INTEGER,
  what_bet text,

  FOREIGN KEY (what_candidate) REFERENCES candidate(id),
  FOREIGN KEY (who) REFERENCES voter(token),
);

CREATE TABLE voter (

	token INTEGER PRIMARY KEY,
	name text NOT NULL,
	nick text NOT NULL,
	pass text NOT NULL,
	ative INTEGER DEFAULT 0

);


INSERT INTO candidate (ID,NAME,matriculas, curso, image)
VALUES (1, 'OCO', '4', 'INPHORMATICA', 'sample');

INSERT INTO candidate (ID,NAME,matriculas, curso, image)
VALUES (2, 'RODRIGUEZ', '10' ,'ELECTRO', 'sample2' );

INSERT INTO candidate (ID,NAME,matriculas, curso, image)
VALUES (3, 'TOGAPI', '9', 'BIO', 'sample2');

INSERT INTO ip_vote (ip_id, ip, ip_candidate, what_bet)
VALUES (1, '192.168.12.2', 1, "1 unhada");

INSERT INTO ip_vote (ip_id, ip, ip_candidate, what_bet)
VALUES (2, '192.169.12.2', 2, "4 pranchas");
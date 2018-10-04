PRAGMA foreign_keys = 1;
DROP TABLE if exists vote;
DROP TABLE if exists voter;


CREATE TABLE vote (
  vote_id INTEGER PRIMARY KEY,
  who INTEGER NOT NULL,
  what_candidate INTEGER,
  what_bet text,

  FOREIGN KEY (what_candidate) REFERENCES voter(token),
  FOREIGN KEY (who) REFERENCES voter(token)
);

CREATE TABLE voter (

	token INTEGER PRIMARY KEY,

	name text NOT NULL,
	nick text NOT NULL,
	pass text NOT NULL,
  email text NOT NULL,

	matriculas INTEGER,
  curso text,

  image text NOT NULL,

  candidato INTEGER DEFAULT 0,
	active INTEGER DEFAULT 0

);

INSERT INTO voter (token, name, nick, pass, email, matriculas, curso, image, candidato, active)
VALUES(1, "Oco", "Oco", "oco", "goncalo.moreno97@gmail.com", 4, "Inph", "sample2", 1, 1);

INSERT INTO voter (token, name, nick, pass, email, matriculas, curso, image, candidato, active)
VALUES(2, "RODRIGUEZ", "RODRIGUEZ", "RODRIGUEZ","goncalo.moreno97@gmail.com", 10, "Electro", "sample", 1, 1);

INSERT INTO voter (token, name, nick, pass, email, matriculas, curso, image, candidato, active)
VALUES(3, "TOGAPI", "TOGAPI", "TOGAPI", "goncalo.moreno97@gmail.com", 9, "Metal e Bio", "sample", 1, 1);

INSERT INTO vote(vote_id, who, what_candidate, what_bet)
VALUES(1, 1, 2, "3 Pranchas");

INSERT INTO vote(vote_id, who, what_candidate, what_bet)
VALUES(2, 3, 2, "3 Unhadas");

INSERT INTO vote(vote_id, who, what_candidate, what_bet)
VALUES(3, 2, 1, "1 Tesourada");
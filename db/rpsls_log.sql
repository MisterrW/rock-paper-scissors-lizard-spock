DROP TABLE IF EXISTS log;

CREATE TABLE log (
  id SERIAL8 primary key,
  player_choice VARCHAR(255),
  computer_choice VARCHAR(255),
  winner VARCHAR(255)
);
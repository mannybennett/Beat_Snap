DROP TABLE IF EXISTS users, users_credentials, audio_files, votes;

CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  profile_picture VARCHAR(250)
);

CREATE TABLE users_credentials (
  id INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),
  user_name VARCHAR(50),
  password VARCHAR(50),
  email VARCHAR(50),
  user_id INT NOT NULL,
  FOREIGN KEY (user_id)
	REFERENCES users (id)
);

CREATE TABLE audio_files (
  id INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),
  file_id INT NOT NULL,
  file_name VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id)
	REFERENCES users (id)
);

CREATE TABLE votes (
  id INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),
  vote INT NOT NULL,
  user_id INT NOT NULL, 
  FOREIGN KEY (user_id)
	REFERENCES users (id),
  audio_file_id INT NOT NULL,
  FOREIGN KEY (audio_file_id)
	REFERENCES audio_files (id)
);

INSERT INTO users
	(first_name, last_name, profile_picture)
VALUES 
	("Manny", "Bennett", "image.com"),
    ("Beat", "Maker", "image2.com"),
    ("Better", "BeatMaker", "image3.com");
    
INSERT INTO users_credentials
	(user_name, password, email, user_id)
VALUES 
	("MTEK", "Password1234", "mtekmusic@gmail.com", 1),
    ("BestBeats", "Password12345678", "bestbeats@gmail.com", 2),
    ("BetterBeats", "BetterPassword", "betterbeats@gmail.com", 3);
    
INSERT INTO audio_files
	(file_id, file_name, user_id)
VALUES 
	(123, "Beat1", 1),
    (1234, "Beat2", 2),
    (12345, "Beat3", 3);
    
INSERT INTO votes
	(vote, user_id, audio_file_id)
VALUES 
	(1, 2, 1),
    (1, 3, 1),
    (2, 3, 2);
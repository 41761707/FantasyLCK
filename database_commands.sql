--database schema
CREATE TABLE team (
	id INTEGER NOT NULL, 
	name VARCHAR(50) NOT NULL, 
	shortcut VARCHAR(3) NOT NULL, 
	wins INTEGER NOT NULL, 
	loses INTEGER NOT NULL, 
	map_ratio VARCHAR(10) NOT NULL, 
	matches INTEGER NOT NULL, 
	PRIMARY KEY (id), 
	UNIQUE (name), 
	UNIQUE (shortcut)
);
CREATE TABLE player (
	id INTEGER NOT NULL, 
	team_id INTEGER NOT NULL, 
	name VARCHAR(25) NOT NULL, 
	role VARCHAR(3) NOT NULL, 
	locked VARCHAR(50), 
	PRIMARY KEY (id), 
	FOREIGN KEY(team_id) REFERENCES team (id), 
	UNIQUE (name)
);
CREATE TABLE IF NOT EXISTS "match" (
	id INTEGER NOT NULL, 
	game_number INTEGER, 
	team1_id INTEGER NOT NULL, 
	team1_score INTEGER NOT NULL, 
	team2_id INTEGER NOT NULL, 
	team2_score INTEGER NOT NULL, 
	week INTEGER NOT NULL, 
	length VARCHAR(10) NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(team1_id) REFERENCES team (id), 
	FOREIGN KEY(team2_id) REFERENCES team (id)
);
CREATE TABLE IF NOT EXISTS "TeamsStatsSummary" (
	team_id INTEGER NOT NULL, 
	barons INTEGER NOT NULL, 
	dragons INTEGER NOT NULL, 
	first_bloods INTEGER NOT NULL, 
	towers INTEGER NOT NULL, 
	points FLOAT NOT NULL, 
	PRIMARY KEY (team_id), 
	FOREIGN KEY(team_id) REFERENCES team (id)
);
CREATE TABLE IF NOT EXISTS "PlayersStatsWeekly" (
	id INTEGER NOT NULL, 
	player_id INTEGER NOT NULL, 
	match_id INTEGER NOT NULL, 
	kills INTEGER NOT NULL, 
	deaths INTEGER NOT NULL, 
	assists INTEGER NOT NULL, 
	creep_score INTEGER NOT NULL, 
	triples INTEGER NOT NULL, 
	quadras INTEGER NOT NULL, 
	pentas INTEGER NOT NULL, 
	length TIME NOT NULL, 
	week INTEGER NOT NULL, 
	game INTEGER NOT NULL, 
	points FLOAT NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(player_id) REFERENCES player (id), 
	FOREIGN KEY(match_id) REFERENCES "match" (id)
);
CREATE TABLE IF NOT EXISTS "PlayersStatsSummary" (
	player_id INTEGER NOT NULL, 
	kills INTEGER NOT NULL, 
	deaths INTEGER NOT NULL, 
	assists INTEGER NOT NULL, 
	creep_score INTEGER NOT NULL, 
	triples INTEGER NOT NULL, 
	quadras INTEGER NOT NULL, 
	pentas INTEGER NOT NULL, 
	points FLOAT NOT NULL, 
	PRIMARY KEY (player_id), 
	FOREIGN KEY(player_id) REFERENCES player (id)
);
CREATE TABLE IF NOT EXISTS "TeamsStatsWeekly" (
	id INTEGER NOT NULL, 
	team_id INTEGER NOT NULL, 
	match_id INTEGER NOT NULL, 
	barons INTEGER NOT NULL, 
	dragons INTEGER NOT NULL, 
	first_bloods INTEGER NOT NULL, 
	towers INTEGER NOT NULL, 
	length TIME NOT NULL, 
	week INTEGER NOT NULL, 
	game INTEGER NOT NULL, 
	points FLOAT NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(team_id) REFERENCES team (id), 
	FOREIGN KEY(match_id) REFERENCES "match" (id)
);
CREATE TABLE IF NOT EXISTS "User" (
	id INTEGER NOT NULL, 
	nickname VARCHAR(30) NOT NULL, 
	password BLOB NOT NULL, 
	email VARCHAR(50) NOT NULL, 
	PRIMARY KEY (id)
);


--team table insertions
INSERT INTO team VALUES(1,"Afreeca Freecs","AF",0,0,"0:0",0);
INSERT INTO team VALUES(2,"DRX","DRX",0,0,"0:0",0);
INSERT INTO team VALUES(3,"DWG KIA","DWG",0,0,"0:0",0);
INSERT INTO team VALUES(4,"Fredit BRION","BRO",0,0,"0:0",0);
INSERT INTO team VALUES(5,"Gen.G","GEN",0,0,"0:0",0);
INSERT INTO team VALUES(6,"Hanwha Life Esports","HLE",0,0,"0:0",0);
INSERT INTO team VALUES(7,"kt Rolster","KT",0,0,"0:0",0);
INSERT INTO team VALUES(8,"Liiv SANDBOX","LSB",0,0,"0:0",0);
INSERT INTO team VALUES(9,"Nongshim RedForce","NS",0,0,"0:0",0);
INSERT INTO team VALUES(10,"T1","T1",0,0,"0:0",0);

--player table insertions
INSERT INTO player("team_id","name","role") VALUES(1,"Kiin","TOP");
INSERT INTO player("team_id","name","role") VALUES(1,"Dread","JNG");
INSERT INTO player("team_id","name","role") VALUES(1,"Fly","MID");
INSERT INTO player("team_id","name","role") VALUES(1,"Leo","ADC");
INSERT INTO player("team_id","name","role") VALUES(1,"Lehends","SUP");
INSERT INTO player("team_id","name","role") VALUES(1,"Bang","ADC");
INSERT INTO player("team_id","name","role") VALUES(1,"MapSSi","SUP");

-- player stats summary table insertions (test puropuse only)
INSERT INTO PlayersStatsSummary VALUES(1,4,2,5,6.50,0,0,0,12);
INSERT INTO PlayersStatsSummary VALUES(2,8,3,10,4.50,0,0,0,20);
INSERT INTO PlayersStatsSummary VALUES(3,6,1,5,9.50,0,0,0,25);
INSERT INTO PlayersStatsSummary VALUES(4,2,0,4,9.40,0,0,0,16);
INSERT INTO PlayersStatsSummary VALUES(5,0,2,12,0.50,0,0,0,10);
INSERT INTO PlayersStatsSummary VALUES(6,0,0,0,0.00,0,0,0,0);
INSERT INTO PlayersStatsSummary VALUES(7,0,0,0,0.00,0,0,0,0);
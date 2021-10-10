--database schema
CREATE TABLE team (
	id INTEGER NOT NULL, 
	name VARCHAR(50) NOT NULL, 
	shortcut VARCHAR(3) NOT NULL, 
	photo VARCHAR(100) NOT NULL, 
	wins INTEGER NOT NULL, 
	loses INTEGER NOT NULL, 
	maps_won INTEGER NOT NULL, 
	maps_lost INTEGER NOT NULL, 
	matches INTEGER NOT NULL, 
	PRIMARY KEY (id), 
	UNIQUE (name), 
	UNIQUE (shortcut)
);
CREATE TABLE IF NOT EXISTS "User" (
	id INTEGER NOT NULL, 
	nickname VARCHAR(30) NOT NULL, 
	password BLOB NOT NULL, 
	email VARCHAR(50) NOT NULL, 
	PRIMARY KEY (id)
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
CREATE TABLE game (
	id INTEGER NOT NULL, 
	team1_id INTEGER NOT NULL, 
	team1_score INTEGER NOT NULL, 
	team2_id INTEGER NOT NULL, 
	team2_score INTEGER NOT NULL, 
	week INTEGER NOT NULL, 
	game_played BOOLEAN NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(team1_id) REFERENCES team (id), 
	FOREIGN KEY(team2_id) REFERENCES team (id)
);
CREATE TABLE IF NOT EXISTS "TeamsStatsWeekly" (
	id INTEGER NOT NULL, 
	team_id INTEGER NOT NULL, 
	games_played INTEGER NOT NULL, 
	barons INTEGER NOT NULL, 
	dragons INTEGER NOT NULL, 
	first_bloods INTEGER NOT NULL, 
	towers INTEGER NOT NULL, 
	points FLOAT NOT NULL, 
	week INTEGER NOT NULL, 
	PRIMARY KEY (id, team_id), 
	FOREIGN KEY(team_id) REFERENCES team (id)
);
CREATE TABLE IF NOT EXISTS "TeamsStatsSummary" (
	team_id INTEGER NOT NULL, 
	games_played INTEGER NOT NULL, 
	barons INTEGER NOT NULL, 
	dragons INTEGER NOT NULL, 
	first_bloods INTEGER NOT NULL, 
	towers INTEGER NOT NULL, 
	points FLOAT NOT NULL, 
	PRIMARY KEY (team_id), 
	FOREIGN KEY(team_id) REFERENCES team (id)
);
CREATE TABLE IF NOT EXISTS "match" (
	id INTEGER NOT NULL, 
	game_number INTEGER, 
	game_id INTEGER NOT NULL, 
	played BOOLEAN NOT NULL, 
	team1_id INTEGER NOT NULL, 
	team1_score INTEGER NOT NULL, 
	team2_id INTEGER NOT NULL, 
	team2_score INTEGER NOT NULL, 
	week INTEGER NOT NULL, 
	minutes INTEGER NOT NULL, 
	seconds INTEGER NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(game_id) REFERENCES game (id), 
	FOREIGN KEY(team1_id) REFERENCES team (id), 
	FOREIGN KEY(team2_id) REFERENCES team (id)
);
CREATE TABLE IF NOT EXISTS "PlayersStatsWeekly" (
	id INTEGER NOT NULL, 
	player_id INTEGER NOT NULL, 
	games_played INTEGER NOT NULL, 
	kills INTEGER NOT NULL, 
	deaths INTEGER NOT NULL, 
	assists INTEGER NOT NULL, 
	creep_score FLOAT NOT NULL, 
	triples INTEGER NOT NULL, 
	quadras INTEGER NOT NULL, 
	pentas INTEGER NOT NULL, 
	points FLOAT NOT NULL, 
	week INTEGER NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(player_id) REFERENCES player (id)
);
CREATE TABLE IF NOT EXISTS "PlayersStatsSummary" (
	player_id INTEGER NOT NULL, 
	games_played INTEGER NOT NULL, 
	kills INTEGER NOT NULL, 
	deaths INTEGER NOT NULL, 
	assists INTEGER NOT NULL, 
	creep_score FLOAT NOT NULL, 
	triples INTEGER NOT NULL, 
	quadras INTEGER NOT NULL, 
	pentas INTEGER NOT NULL, 
	points FLOAT NOT NULL, 
	PRIMARY KEY (player_id), 
	FOREIGN KEY(player_id) REFERENCES player (id)
);
CREATE TABLE IF NOT EXISTS "PlayersStats" (
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
	points FLOAT NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(player_id) REFERENCES player (id), 
	FOREIGN KEY(match_id) REFERENCES "match" (id)
);
CREATE TABLE IF NOT EXISTS "TeamsStats" (
	id INTEGER NOT NULL, 
	team_id INTEGER NOT NULL, 
	match_id INTEGER NOT NULL, 
	barons INTEGER NOT NULL, 
	dragons INTEGER NOT NULL, 
	first_bloods INTEGER NOT NULL, 
	towers INTEGER NOT NULL, 
	points FLOAT NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(team_id) REFERENCES team (id), 
	FOREIGN KEY(match_id) REFERENCES "match" (id)
);







--team table insertions
INSERT INTO team VALUES(1,"Afreeca Freecs","AF","logos/Afreeca Freecs.jpg",2,0,4,1,2);
INSERT INTO team VALUES(2,"DRX","DRX","logos/DRX.jpg",0,2,1,4,2);
INSERT INTO team VALUES(3,"DWG KIA","DK","logos/DWG KIA.jpg",1,1,2,3,2);
INSERT INTO team VALUES(4,"Fredit BRION","BRO","logos/Fredit BRION.jpg",1,1,3,2,2);
INSERT INTO team VALUES(5,"Gen.G","GEN","logos/Gen.G.jpg",2,0,4,1,2);
INSERT INTO team VALUES(6,"Hanwha Life Esports","HLE","logos/Hanwha Life Esports.jpg",0,2,0,4,2);
INSERT INTO team VALUES(7,"kt Rolster","KT","logos/kt Rolster.jpg",1,1,3,2,2);
INSERT INTO team VALUES(8,"Liiv SANDBOX","LSB","logos/Liiv SANDBOX.jpg",0,2,1,4,2);
INSERT INTO team VALUES(9,"Nongshim RedForce","NS","logos/Nongshim RedForce.jpg",2,0,4,2,2);
INSERT INTO team VALUES(10,"T1","T1","logos/T1.jpg",1,1,3,2,2);

--player table insertions

--AF
INSERT INTO player("team_id","name","role") VALUES(1,"Kiin","TOP");
INSERT INTO player("team_id","name","role") VALUES(1,"Dread","JNG");
INSERT INTO player("team_id","name","role") VALUES(1,"Fly","MID");
INSERT INTO player("team_id","name","role") VALUES(1,"Leo","ADC");
INSERT INTO player("team_id","name","role") VALUES(1,"Lehends","SUP");
INSERT INTO player("team_id","name","role") VALUES(1,"Bang","ADC");
INSERT INTO player("team_id","name","role") VALUES(1,"MapSSi","SUP");
--DRX
INSERT INTO player("team_id","name","role") VALUES(2,"Kingen","TOP");
INSERT INTO player("team_id","name","role") VALUES(2,"Pyosik","JNG");
INSERT INTO player("team_id","name","role") VALUES(2,"Jett","MID");
INSERT INTO player("team_id","name","role") VALUES(2,"Taeyoon","ADC");
INSERT INTO player("team_id","name","role") VALUES(2,"Jun","SUP");
INSERT INTO player("team_id","name","role") VALUES(2,"Destroy","TOP");
--DK
INSERT INTO player("team_id","name","role") VALUES(3,"Khan","TOP");
INSERT INTO player("team_id","name","role") VALUES(3,"Canyon","JNG");
INSERT INTO player("team_id","name","role") VALUES(3,"ShowMaker","MID");
INSERT INTO player("team_id","name","role") VALUES(3,"Ghost","ADC");
INSERT INTO player("team_id","name","role") VALUES(3,"BeryL","SUP");
INSERT INTO player("team_id","name","role") VALUES(3,"Malrang","JNG");
INSERT INTO player("team_id","name","role") VALUES(3,"Rahel","ADC");
--BRO
INSERT INTO player("team_id","name","role") VALUES(4,"Hoya","TOP");
INSERT INTO player("team_id","name","role") VALUES(4,"UmTi","JNG");
INSERT INTO player("team_id","name","role") VALUES(4,"Lava","MID");
INSERT INTO player("team_id","name","role") VALUES(4,"Hena","ADC");
INSERT INTO player("team_id","name","role") VALUES(4,"Delight","SUP");
INSERT INTO player("team_id","name","role") VALUES(4,"Chieftain","JNG");
INSERT INTO player("team_id","name","role") VALUES(4,"Yaharong","MID");
--GEN
INSERT INTO player("team_id","name","role") VALUES(5,"Rascal","TOP");
INSERT INTO player("team_id","name","role") VALUES(5,"Clid","JNG");
INSERT INTO player("team_id","name","role") VALUES(5,"Bdd","MID");
INSERT INTO player("team_id","name","role") VALUES(5,"Ruler","ADC");
INSERT INTO player("team_id","name","role") VALUES(5,"Life","SUP");
INSERT INTO player("team_id","name","role") VALUES(5,"Burdol","TOP");
INSERT INTO player("team_id","name","role") VALUES(5,"YoungJae","JNG");
--HLE
INSERT INTO player("team_id","name","role") VALUES(6,"DuDu","TOP");
INSERT INTO player("team_id","name","role") VALUES(6,"Morgan","TOP");
INSERT INTO player("team_id","name","role") VALUES(6,"Willer","JNG");
INSERT INTO player("team_id","name","role") VALUES(6,"yoHan","JNG");
INSERT INTO player("team_id","name","role") VALUES(6,"Chovy","MID");
INSERT INTO player("team_id","name","role") VALUES(6,"Deft","ADC");
INSERT INTO player("team_id","name","role") VALUES(6,"Vsta","SUP");
--KT
INSERT INTO player("team_id","name","role") VALUES(7,"Doran","TOP");
INSERT INTO player("team_id","name","role") VALUES(7,"Blank","JNG");
INSERT INTO player("team_id","name","role") VALUES(7,"Dove","MID");
INSERT INTO player("team_id","name","role") VALUES(7,"5kid","ADC");
INSERT INTO player("team_id","name","role") VALUES(7,"Noah","ADC");
INSERT INTO player("team_id","name","role") VALUES(7,"Harp","SUP");
INSERT INTO player("team_id","name","role") VALUES(7,"Zzus","SUP");
INSERT INTO player("team_id","name","role") VALUES(7,"GIDEON","JNG");
INSERT INTO player("team_id","name","role") VALUES(7,"Ucal","MID");
--LSB
INSERT INTO player("team_id","name","role") VALUES(8,"Summit","TOP");
INSERT INTO player("team_id","name","role") VALUES(8,"Croco","JNG");
INSERT INTO player("team_id","name","role") VALUES(8,"FATE","MID");
INSERT INTO player("team_id","name","role") VALUES(8,"Prince","ADC");
INSERT INTO player("team_id","name","role") VALUES(8,"Effort","SUP");
INSERT INTO player("team_id","name","role") VALUES(8,"Howling","TOP");
INSERT INTO player("team_id","name","role") VALUES(8,"OnFleek","JNG");
--NS
INSERT INTO player("team_id","name","role") VALUES(9,"Rich","TOP");
INSERT INTO player("team_id","name","role") VALUES(9,"Peanut","JNG");
INSERT INTO player("team_id","name","role") VALUES(9,"Gori","MID");
INSERT INTO player("team_id","name","role") VALUES(9,"deokdam","ADC");
INSERT INTO player("team_id","name","role") VALUES(9,"Kellin","SUP");
INSERT INTO player("team_id","name","role") VALUES(9,"Wayne","ADC");
--T1
INSERT INTO player("team_id","name","role") VALUES(10,"Canna","TOP");
INSERT INTO player("team_id","name","role") VALUES(10,"Oner","JNG");
INSERT INTO player("team_id","name","role") VALUES(10,"Faker","MID");
INSERT INTO player("team_id","name","role") VALUES(10,"Gumayusi","ADC");
INSERT INTO player("team_id","name","role") VALUES(10,"Keria","SUP");
INSERT INTO player("team_id","name","role") VALUES(10,"Zeus","TOP");
INSERT INTO player("team_id","name","role") VALUES(10,"Cuzz","JNG");
INSERT INTO player("team_id","name","role") VALUES(10,"Clozer","MID");
INSERT INTO player("team_id","name","role") VALUES(10,"Teddy","ADC");
INSERT INTO player("team_id","name","role") VALUES(10,"Hoit","SUP");

-- player stats weekly insertions

INSERT INTO PlayersStatsWeekly VALUES(1,1,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(2,1,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(3,1,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(4,1,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(5,1,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(6,1,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(7,1,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(8,1,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(9,1,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(10,1,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(11,2,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(12,2,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(13,2,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(14,2,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(15,2,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(16,2,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(17,2,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(18,2,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(19,2,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(20,2,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(21,3,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(22,3,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(23,3,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(24,3,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(25,3,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(26,3,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(27,3,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(28,3,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(29,3,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(30,3,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(31,4,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(32,4,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(33,4,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(34,4,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(35,4,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(36,4,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(37,4,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(38,4,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(39,4,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(40,4,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(41,5,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(42,5,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(43,5,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(44,5,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(45,5,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(46,5,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(47,5,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(48,5,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(49,5,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(50,5,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(51,6,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(52,6,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(53,6,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(54,6,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(55,6,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(56,6,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(57,6,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(58,6,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(59,6,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(60,6,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(61,7,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(62,7,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(63,7,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(64,7,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(65,7,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(66,7,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(67,7,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(68,7,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(69,7,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(70,7,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(71,8,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(72,8,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(73,8,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(74,8,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(75,8,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(76,8,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(77,8,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(78,8,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(79,8,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(80,8,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(81,9,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(82,9,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(83,9,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(84,9,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(85,9,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(86,9,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(87,9,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(88,9,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(89,9,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(90,9,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(91,10,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(92,10,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(93,10,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(94,10,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(95,10,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(96,10,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(97,10,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(98,10,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(99,10,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(100,10,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(101,11,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(102,11,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(103,11,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(104,11,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(105,11,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(106,11,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(107,11,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(108,11,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(109,11,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(110,11,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(111,12,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(112,12,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(113,12,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(114,12,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(115,12,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(116,12,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(117,12,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(118,12,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(119,12,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(120,12,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(121,13,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(122,13,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(123,13,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(124,13,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(125,13,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(126,13,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(127,13,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(128,13,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(129,13,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(130,13,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(131,14,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(132,14,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(133,14,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(134,14,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(135,14,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(136,14,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(137,14,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(138,14,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(139,14,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(140,14,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(141,15,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(142,15,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(143,15,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(144,15,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(145,15,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(146,15,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(147,15,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(148,15,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(149,15,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(150,15,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(151,16,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(152,16,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(153,16,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(154,16,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(155,16,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(156,16,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(157,16,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(158,16,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(159,16,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(160,16,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(161,17,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(162,17,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(163,17,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(164,17,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(165,17,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(166,17,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(167,17,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(168,17,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(169,17,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(170,17,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(171,18,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(172,18,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(173,18,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(174,18,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(175,18,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(176,18,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(177,18,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(178,18,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(179,18,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(180,18,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(181,19,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(182,19,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(183,19,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(184,19,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(185,19,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(186,19,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(187,19,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(188,19,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(189,19,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(190,19,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(191,20,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(192,20,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(193,20,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(194,20,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(195,20,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(196,20,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(197,20,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(198,20,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(199,20,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(200,20,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(201,21,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(202,21,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(203,21,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(204,21,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(205,21,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(206,21,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(207,21,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(208,21,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(209,21,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(210,21,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(211,22,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(212,22,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(213,22,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(214,22,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(215,22,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(216,22,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(217,22,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(218,22,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(219,22,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(220,22,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(221,23,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(222,23,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(223,23,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(224,23,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(225,23,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(226,23,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(227,23,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(228,23,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(229,23,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(230,23,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(231,24,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(232,24,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(233,24,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(234,24,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(235,24,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(236,24,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(237,24,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(238,24,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(239,24,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(240,24,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(241,25,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(242,25,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(243,25,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(244,25,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(245,25,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(246,25,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(247,25,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(248,25,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(249,25,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(250,25,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(251,26,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(252,26,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(253,26,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(254,26,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(255,26,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(256,26,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(257,26,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(258,26,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(259,26,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(260,26,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(261,27,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(262,27,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(263,27,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(264,27,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(265,27,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(266,27,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(267,27,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(268,27,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(269,27,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(270,27,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(271,28,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(272,28,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(273,28,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(274,28,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(275,28,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(276,28,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(277,28,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(278,28,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(279,28,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(280,28,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(281,29,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(282,29,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(283,29,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(284,29,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(285,29,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(286,29,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(287,29,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(288,29,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(289,29,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(290,29,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(291,30,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(292,30,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(293,30,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(294,30,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(295,30,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(296,30,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(297,30,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(298,30,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(299,30,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(300,30,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(301,31,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(302,31,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(303,31,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(304,31,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(305,31,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(306,31,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(307,31,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(308,31,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(309,31,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(310,31,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(311,32,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(312,32,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(313,32,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(314,32,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(315,32,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(316,32,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(317,32,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(318,32,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(319,32,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(320,32,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(321,33,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(322,33,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(323,33,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(324,33,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(325,33,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(326,33,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(327,33,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(328,33,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(329,33,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(330,33,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(331,34,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(332,34,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(333,34,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(334,34,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(335,34,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(336,34,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(337,34,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(338,34,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(339,34,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(340,34,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(341,35,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(342,35,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(343,35,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(344,35,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(345,35,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(346,35,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(347,35,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(348,35,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(349,35,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(350,35,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(351,36,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(352,36,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(353,36,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(354,36,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(355,36,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(356,36,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(357,36,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(358,36,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(359,36,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(360,36,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(361,37,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(362,37,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(363,37,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(364,37,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(365,37,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(366,37,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(367,37,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(368,37,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(369,37,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(370,37,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(371,38,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(372,38,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(373,38,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(374,38,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(375,38,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(376,38,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(377,38,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(378,38,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(379,38,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(380,38,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(381,39,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(382,39,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(383,39,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(384,39,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(385,39,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(386,39,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(387,39,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(388,39,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(389,39,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(390,39,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(391,40,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(392,40,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(393,40,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(394,40,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(395,40,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(396,40,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(397,40,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(398,40,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(399,40,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(400,40,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(401,41,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(402,41,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(403,41,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(404,41,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(405,41,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(406,41,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(407,41,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(408,41,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(409,41,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(410,41,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(411,42,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(412,42,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(413,42,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(414,42,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(415,42,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(416,42,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(417,42,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(418,42,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(419,42,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(420,42,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(421,43,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(422,43,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(423,43,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(424,43,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(425,43,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(426,43,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(427,43,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(428,43,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(429,43,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(430,43,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(431,44,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(432,44,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(433,44,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(434,44,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(435,44,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(436,44,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(437,44,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(438,44,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(439,44,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(440,44,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(441,45,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(442,45,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(443,45,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(444,45,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(445,45,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(446,45,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(447,45,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(448,45,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(449,45,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(450,45,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(451,46,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(452,46,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(453,46,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(454,46,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(455,46,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(456,46,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(457,46,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(458,46,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(459,46,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(460,46,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(461,47,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(462,47,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(463,47,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(464,47,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(465,47,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(466,47,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(467,47,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(468,47,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(469,47,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(470,47,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(471,48,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(472,48,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(473,48,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(474,48,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(475,48,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(476,48,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(477,48,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(478,48,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(479,48,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(480,48,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(481,49,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(482,49,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(483,49,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(484,49,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(485,49,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(486,49,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(487,49,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(488,49,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(489,49,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(490,49,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(491,50,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(492,50,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(493,50,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(494,50,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(495,50,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(496,50,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(497,50,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(498,50,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(499,50,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(500,50,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(501,51,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(502,51,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(503,51,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(504,51,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(505,51,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(506,51,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(507,51,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(508,51,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(509,51,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(510,51,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(511,52,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(512,52,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(513,52,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(514,52,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(515,52,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(516,52,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(517,52,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(518,52,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(519,52,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(520,52,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(521,53,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(522,53,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(523,53,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(524,53,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(525,53,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(526,53,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(527,53,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(528,53,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(529,53,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(530,53,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(531,54,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(532,54,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(533,54,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(534,54,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(535,54,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(536,54,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(537,54,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(538,54,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(539,54,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(540,54,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(541,55,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(542,55,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(543,55,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(544,55,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(545,55,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(546,55,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(547,55,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(548,55,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(549,55,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(550,55,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(551,56,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(552,56,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(553,56,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(554,56,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(555,56,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(556,56,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(557,56,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(558,56,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(559,56,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(560,56,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(561,57,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(562,57,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(563,57,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(564,57,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(565,57,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(566,57,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(567,57,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(568,57,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(569,57,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(570,57,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(571,58,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(572,58,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(573,58,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(574,58,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(575,58,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(576,58,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(577,58,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(578,58,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(579,58,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(580,58,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(581,59,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(582,59,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(583,59,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(584,59,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(585,59,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(586,59,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(587,59,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(588,59,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(589,59,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(590,59,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(591,60,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(592,60,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(593,60,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(594,60,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(595,60,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(596,60,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(597,60,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(598,60,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(599,60,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(600,60,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(601,61,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(602,61,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(603,61,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(604,61,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(605,61,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(606,61,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(607,61,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(608,61,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(609,61,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(610,61,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(611,62,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(612,62,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(613,62,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(614,62,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(615,62,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(616,62,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(617,62,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(618,62,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(619,62,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(620,62,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(621,63,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(622,63,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(623,63,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(624,63,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(625,63,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(626,63,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(627,63,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(628,63,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(629,63,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(630,63,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(631,64,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(632,64,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(633,64,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(634,64,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(635,64,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(636,64,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(637,64,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(638,64,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(639,64,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(640,64,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(641,65,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(642,65,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(643,65,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(644,65,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(645,65,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(646,65,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(647,65,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(648,65,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(649,65,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(650,65,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(651,66,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(652,66,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(653,66,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(654,66,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(655,66,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(656,66,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(657,66,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(658,66,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(659,66,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(660,66,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(661,67,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(662,67,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(663,67,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(664,67,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(665,67,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(666,67,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(667,67,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(668,67,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(669,67,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(670,67,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(671,68,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(672,68,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(673,68,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(674,68,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(675,68,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(676,68,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(677,68,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(678,68,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(679,68,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(680,68,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(681,69,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(682,69,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(683,69,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(684,69,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(685,69,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(686,69,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(687,69,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(688,69,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(689,69,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(690,69,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(691,70,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(692,70,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(693,70,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(694,70,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(695,70,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(696,70,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(697,70,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(698,70,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(699,70,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(700,70,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(701,71,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(702,71,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(703,71,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(704,71,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(705,71,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(706,71,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(707,71,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(708,71,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(709,71,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(710,71,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(711,72,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(712,72,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(713,72,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(714,72,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(715,72,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(716,72,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(717,72,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(718,72,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(719,72,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(720,72,0,0,0,0,0.00,0,0,0,0,10);
INSERT INTO PlayersStatsWeekly VALUES(721,73,0,0,0,0,0.00,0,0,0,0,1);
INSERT INTO PlayersStatsWeekly VALUES(722,73,0,0,0,0,0.00,0,0,0,0,2);
INSERT INTO PlayersStatsWeekly VALUES(723,73,0,0,0,0,0.00,0,0,0,0,3);
INSERT INTO PlayersStatsWeekly VALUES(724,73,0,0,0,0,0.00,0,0,0,0,4);
INSERT INTO PlayersStatsWeekly VALUES(725,73,0,0,0,0,0.00,0,0,0,0,5);
INSERT INTO PlayersStatsWeekly VALUES(726,73,0,0,0,0,0.00,0,0,0,0,6);
INSERT INTO PlayersStatsWeekly VALUES(727,73,0,0,0,0,0.00,0,0,0,0,7);
INSERT INTO PlayersStatsWeekly VALUES(728,73,0,0,0,0,0.00,0,0,0,0,8);
INSERT INTO PlayersStatsWeekly VALUES(729,73,0,0,0,0,0.00,0,0,0,0,9);
INSERT INTO PlayersStatsWeekly VALUES(730,73,0,0,0,0,0.00,0,0,0,0,10);

-- player stats summary insertions
INSERT INTO PlayersStatsSummary VALUES(1,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(2,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(3,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(4,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(5,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(6,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(7,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(8,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(9,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(10,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(11,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(12,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(13,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(14,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(15,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(16,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(17,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(18,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(19,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(20,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(21,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(22,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(23,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(24,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(25,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(26,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(27,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(28,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(29,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(30,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(31,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(32,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(33,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(34,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(35,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(36,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(37,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(38,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(39,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(40,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(41,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(42,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(43,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(44,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(45,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(46,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(47,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(48,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(49,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(50,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(51,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(52,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(53,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(54,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(55,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(56,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(57,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(58,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(59,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(60,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(61,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(62,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(63,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(64,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(65,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(66,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(67,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(68,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(69,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(70,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(71,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(72,0,0,0,0,0.00,0,0,0,0.00);
INSERT INTO PlayersStatsSummary VALUES(73,0,0,0,0,0.00,0,0,0,0.00);
-- teams stats  insertions

INSERT INTO TeamsStats VALUES(1,1,1,1,3,1,8,12);

-- teams stats weekly insertions

INSERT INTO TeamsStatsWeekly VALUES(1,1,0,0,0,0,0,0.00,1);
INSERT INTO TeamsStatsWeekly VALUES(2,1,0,0,0,0,0,0.00,2);
INSERT INTO TeamsStatsWeekly VALUES(3,1,0,0,0,0,0,0.00,3);
INSERT INTO TeamsStatsWeekly VALUES(4,1,0,0,0,0,0,0.00,4);
INSERT INTO TeamsStatsWeekly VALUES(5,1,0,0,0,0,0,0.00,5);
INSERT INTO TeamsStatsWeekly VALUES(6,1,0,0,0,0,0,0.00,6);
INSERT INTO TeamsStatsWeekly VALUES(7,1,0,0,0,0,0,0.00,7);
INSERT INTO TeamsStatsWeekly VALUES(8,1,0,0,0,0,0,0.00,8);
INSERT INTO TeamsStatsWeekly VALUES(9,1,0,0,0,0,0,0.00,9);
INSERT INTO TeamsStatsWeekly VALUES(10,1,0,0,0,0,0,0.00,10);
INSERT INTO TeamsStatsWeekly VALUES(11,2,0,0,0,0,0,0.00,1);
INSERT INTO TeamsStatsWeekly VALUES(12,2,0,0,0,0,0,0.00,2);
INSERT INTO TeamsStatsWeekly VALUES(13,2,0,0,0,0,0,0.00,3);
INSERT INTO TeamsStatsWeekly VALUES(14,2,0,0,0,0,0,0.00,4);
INSERT INTO TeamsStatsWeekly VALUES(15,2,0,0,0,0,0,0.00,5);
INSERT INTO TeamsStatsWeekly VALUES(16,2,0,0,0,0,0,0.00,6);
INSERT INTO TeamsStatsWeekly VALUES(17,2,0,0,0,0,0,0.00,7);
INSERT INTO TeamsStatsWeekly VALUES(18,2,0,0,0,0,0,0.00,8);
INSERT INTO TeamsStatsWeekly VALUES(19,2,0,0,0,0,0,0.00,9);
INSERT INTO TeamsStatsWeekly VALUES(20,2,0,0,0,0,0,0.00,10);
INSERT INTO TeamsStatsWeekly VALUES(21,3,0,0,0,0,0,0.00,1);
INSERT INTO TeamsStatsWeekly VALUES(22,3,0,0,0,0,0,0.00,2);
INSERT INTO TeamsStatsWeekly VALUES(23,3,0,0,0,0,0,0.00,3);
INSERT INTO TeamsStatsWeekly VALUES(24,3,0,0,0,0,0,0.00,4);
INSERT INTO TeamsStatsWeekly VALUES(25,3,0,0,0,0,0,0.00,5);
INSERT INTO TeamsStatsWeekly VALUES(26,3,0,0,0,0,0,0.00,6);
INSERT INTO TeamsStatsWeekly VALUES(27,3,0,0,0,0,0,0.00,7);
INSERT INTO TeamsStatsWeekly VALUES(28,3,0,0,0,0,0,0.00,8);
INSERT INTO TeamsStatsWeekly VALUES(29,3,0,0,0,0,0,0.00,9);
INSERT INTO TeamsStatsWeekly VALUES(30,3,0,0,0,0,0,0.00,10);
INSERT INTO TeamsStatsWeekly VALUES(31,4,0,0,0,0,0,0.00,1);
INSERT INTO TeamsStatsWeekly VALUES(32,4,0,0,0,0,0,0.00,2);
INSERT INTO TeamsStatsWeekly VALUES(33,4,0,0,0,0,0,0.00,3);
INSERT INTO TeamsStatsWeekly VALUES(34,4,0,0,0,0,0,0.00,4);
INSERT INTO TeamsStatsWeekly VALUES(35,4,0,0,0,0,0,0.00,5);
INSERT INTO TeamsStatsWeekly VALUES(36,4,0,0,0,0,0,0.00,6);
INSERT INTO TeamsStatsWeekly VALUES(37,4,0,0,0,0,0,0.00,7);
INSERT INTO TeamsStatsWeekly VALUES(38,4,0,0,0,0,0,0.00,8);
INSERT INTO TeamsStatsWeekly VALUES(39,4,0,0,0,0,0,0.00,9);
INSERT INTO TeamsStatsWeekly VALUES(40,4,0,0,0,0,0,0.00,10);
INSERT INTO TeamsStatsWeekly VALUES(41,5,0,0,0,0,0,0.00,1);
INSERT INTO TeamsStatsWeekly VALUES(42,5,0,0,0,0,0,0.00,2);
INSERT INTO TeamsStatsWeekly VALUES(43,5,0,0,0,0,0,0.00,3);
INSERT INTO TeamsStatsWeekly VALUES(44,5,0,0,0,0,0,0.00,4);
INSERT INTO TeamsStatsWeekly VALUES(45,5,0,0,0,0,0,0.00,5);
INSERT INTO TeamsStatsWeekly VALUES(46,5,0,0,0,0,0,0.00,6);
INSERT INTO TeamsStatsWeekly VALUES(47,5,0,0,0,0,0,0.00,7);
INSERT INTO TeamsStatsWeekly VALUES(48,5,0,0,0,0,0,0.00,8);
INSERT INTO TeamsStatsWeekly VALUES(49,5,0,0,0,0,0,0.00,9);
INSERT INTO TeamsStatsWeekly VALUES(50,5,0,0,0,0,0,0.00,10);
INSERT INTO TeamsStatsWeekly VALUES(51,6,0,0,0,0,0,0.00,1);
INSERT INTO TeamsStatsWeekly VALUES(52,6,0,0,0,0,0,0.00,2);
INSERT INTO TeamsStatsWeekly VALUES(53,6,0,0,0,0,0,0.00,3);
INSERT INTO TeamsStatsWeekly VALUES(54,6,0,0,0,0,0,0.00,4);
INSERT INTO TeamsStatsWeekly VALUES(55,6,0,0,0,0,0,0.00,5);
INSERT INTO TeamsStatsWeekly VALUES(56,6,0,0,0,0,0,0.00,6);
INSERT INTO TeamsStatsWeekly VALUES(57,6,0,0,0,0,0,0.00,7);
INSERT INTO TeamsStatsWeekly VALUES(58,6,0,0,0,0,0,0.00,8);
INSERT INTO TeamsStatsWeekly VALUES(59,6,0,0,0,0,0,0.00,9);
INSERT INTO TeamsStatsWeekly VALUES(60,6,0,0,0,0,0,0.00,10);
INSERT INTO TeamsStatsWeekly VALUES(61,7,0,0,0,0,0,0.00,1);
INSERT INTO TeamsStatsWeekly VALUES(62,7,0,0,0,0,0,0.00,2);
INSERT INTO TeamsStatsWeekly VALUES(63,7,0,0,0,0,0,0.00,3);
INSERT INTO TeamsStatsWeekly VALUES(64,7,0,0,0,0,0,0.00,4);
INSERT INTO TeamsStatsWeekly VALUES(65,7,0,0,0,0,0,0.00,5);
INSERT INTO TeamsStatsWeekly VALUES(66,7,0,0,0,0,0,0.00,6);
INSERT INTO TeamsStatsWeekly VALUES(67,7,0,0,0,0,0,0.00,7);
INSERT INTO TeamsStatsWeekly VALUES(68,7,0,0,0,0,0,0.00,8);
INSERT INTO TeamsStatsWeekly VALUES(69,7,0,0,0,0,0,0.00,9);
INSERT INTO TeamsStatsWeekly VALUES(70,7,0,0,0,0,0,0.00,10);
INSERT INTO TeamsStatsWeekly VALUES(71,8,0,0,0,0,0,0.00,1);
INSERT INTO TeamsStatsWeekly VALUES(72,8,0,0,0,0,0,0.00,2);
INSERT INTO TeamsStatsWeekly VALUES(73,8,0,0,0,0,0,0.00,3);
INSERT INTO TeamsStatsWeekly VALUES(74,8,0,0,0,0,0,0.00,4);
INSERT INTO TeamsStatsWeekly VALUES(75,8,0,0,0,0,0,0.00,5);
INSERT INTO TeamsStatsWeekly VALUES(76,8,0,0,0,0,0,0.00,6);
INSERT INTO TeamsStatsWeekly VALUES(77,8,0,0,0,0,0,0.00,7);
INSERT INTO TeamsStatsWeekly VALUES(78,8,0,0,0,0,0,0.00,8);
INSERT INTO TeamsStatsWeekly VALUES(79,8,0,0,0,0,0,0.00,9);
INSERT INTO TeamsStatsWeekly VALUES(80,8,0,0,0,0,0,0.00,10);
INSERT INTO TeamsStatsWeekly VALUES(81,9,0,0,0,0,0,0.00,1);
INSERT INTO TeamsStatsWeekly VALUES(82,9,0,0,0,0,0,0.00,2);
INSERT INTO TeamsStatsWeekly VALUES(83,9,0,0,0,0,0,0.00,3);
INSERT INTO TeamsStatsWeekly VALUES(84,9,0,0,0,0,0,0.00,4);
INSERT INTO TeamsStatsWeekly VALUES(85,9,0,0,0,0,0,0.00,5);
INSERT INTO TeamsStatsWeekly VALUES(86,9,0,0,0,0,0,0.00,6);
INSERT INTO TeamsStatsWeekly VALUES(87,9,0,0,0,0,0,0.00,7);
INSERT INTO TeamsStatsWeekly VALUES(88,9,0,0,0,0,0,0.00,8);
INSERT INTO TeamsStatsWeekly VALUES(89,9,0,0,0,0,0,0.00,9);
INSERT INTO TeamsStatsWeekly VALUES(90,9,0,0,0,0,0,0.00,10);
INSERT INTO TeamsStatsWeekly VALUES(91,10,0,0,0,0,0,0.00,1);
INSERT INTO TeamsStatsWeekly VALUES(92,10,0,0,0,0,0,0.00,2);
INSERT INTO TeamsStatsWeekly VALUES(93,10,0,0,0,0,0,0.00,3);
INSERT INTO TeamsStatsWeekly VALUES(94,10,0,0,0,0,0,0.00,4);
INSERT INTO TeamsStatsWeekly VALUES(95,10,0,0,0,0,0,0.00,5);
INSERT INTO TeamsStatsWeekly VALUES(96,10,0,0,0,0,0,0.00,6);
INSERT INTO TeamsStatsWeekly VALUES(97,10,0,0,0,0,0,0.00,7);
INSERT INTO TeamsStatsWeekly VALUES(98,10,0,0,0,0,0,0.00,8);
INSERT INTO TeamsStatsWeekly VALUES(99,10,0,0,0,0,0,0.00,9);
INSERT INTO TeamsStatsWeekly VALUES(100,10,0,0,0,0,0,0.00,10);


-- teams stats summary insertions
INSERT INTO TeamsStatsSummary VALUES(1,0,0,0,0,0,0.00);
INSERT INTO TeamsStatsSummary VALUES(2,0,0,0,0,0,0.00);
INSERT INTO TeamsStatsSummary VALUES(3,0,0,0,0,0,0.00);
INSERT INTO TeamsStatsSummary VALUES(4,0,0,0,0,0,0.00);
INSERT INTO TeamsStatsSummary VALUES(5,0,0,0,0,0,0.00);
INSERT INTO TeamsStatsSummary VALUES(6,0,0,0,0,0,0.00);
INSERT INTO TeamsStatsSummary VALUES(7,0,0,0,0,0,0.00);
INSERT INTO TeamsStatsSummary VALUES(8,0,0,0,0,0,0.00);
INSERT INTO TeamsStatsSummary VALUES(9,0,0,0,0,0,0.00);
INSERT INTO TeamsStatsSummary VALUES(10,0,0,0,0,0,0.00);

-- procedures


-- triggers

--TeamsStatsWeekly

DROP TRIGGER insert_games_team_weekly;
CREATE TRIGGER IF NOT EXISTS insert_games_team_weekly AFTER INSERT ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET games_played=games_played+1 WHERE TeamsStatsWeekly.team_id =new.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER update_games_team_weekly;
CREATE TRIGGER IF NOT EXISTS update_games_team_weekly AFTER UPDATE ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET games_played=games_played WHERE TeamsStatsWeekly.team_id =old.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_games_team_weekly;
CREATE TRIGGER IF NOT EXISTS delete_games_team_weekly AFTER DELETE ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET games_played=games_played-1 WHERE TeamsStatsWeekly.team_id =old.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER insert_barons_weekly;
CREATE TRIGGER IF NOT EXISTS insert_barons_weekly AFTER INSERT ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET barons=barons+new.barons WHERE TeamsStatsWeekly.team_id =new.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER update_barons_weekly;
CREATE TRIGGER IF NOT EXISTS update_barons_weekly AFTER UPDATE ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET barons=barons+new.barons-old.barons WHERE TeamsStatsWeekly.team_id =old.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_barons_weekly;
CREATE TRIGGER IF NOT EXISTS delete_barons_weekly AFTER DELETE ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET barons=barons-old.barons WHERE TeamsStatsWeekly.team_id =old.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER insert_dragons_weekly;
CREATE TRIGGER IF NOT EXISTS insert_dragons_weekly AFTER INSERT ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET dragons=dragons+new.dragons WHERE TeamsStatsWeekly.team_id =new.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER update_dragons_weekly;
CREATE TRIGGER IF NOT EXISTS update_dragons_weekly AFTER UPDATE ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET dragons=dragons+new.dragons-old.dragons WHERE TeamsStatsWeekly.team_id =old.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_dragons_weekly;
CREATE TRIGGER IF NOT EXISTS delete_dragons_weekly AFTER DELETE ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET dragons=dragons-old.dragons WHERE TeamsStatsWeekly.team_id =old.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER insert_first_bloods_weekly;
CREATE TRIGGER IF NOT EXISTS insert_first_bloods_weekly AFTER INSERT ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET first_bloods=first_bloods+new.first_bloods WHERE TeamsStatsWeekly.team_id =new.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER update_first_bloods_weekly;
CREATE TRIGGER IF NOT EXISTS update_first_bloods_weekly AFTER UPDATE ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET first_bloods=first_bloods+new.first_bloods-old.first_bloods WHERE TeamsStatsWeekly.team_id =old.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_first_bloods_weekly;
CREATE TRIGGER IF NOT EXISTS delete_first_bloods_weekly AFTER DELETE ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET first_bloods=first_bloods-old.first_bloods WHERE TeamsStatsWeekly.team_id =old.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER insert_towers_weekly;
CREATE TRIGGER IF NOT EXISTS insert_towers_weekly AFTER INSERT ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET towers=towers+new.towers WHERE TeamsStatsWeekly.team_id =new.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER update_towers_weekly;
CREATE TRIGGER IF NOT EXISTS update_towers_weekly AFTER UPDATE ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET towers=towers+new.towers-old.towers WHERE TeamsStatsWeekly.team_id =old.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_towers_weekly;
CREATE TRIGGER IF NOT EXISTS delete_towers_weekly AFTER DELETE ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET towers=towers-old.towers WHERE TeamsStatsWeekly.team_id =old.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER insert_points_team_weekly;
CREATE TRIGGER IF NOT EXISTS insert_points_team_weekly AFTER INSERT ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET points=points+new.points WHERE TeamsStatsWeekly.team_id =new.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER update_points_team_weekly;
CREATE TRIGGER IF NOT EXISTS update_points_team_weekly AFTER UPDATE ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET points=points+new.points-old.points WHERE TeamsStatsWeekly.team_id =old.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_points_team_weekly;
CREATE TRIGGER IF NOT EXISTS delete_points_team_weekly AFTER DELETE ON TeamsStats
BEGIN
	UPDATE TeamsStatsWeekly SET points=points-old.points WHERE TeamsStatsWeekly.team_id =old.team_id AND TeamsStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

--TeamsStatsSummary
DROP TRIGGER insert_games_team;
CREATE TRIGGER IF NOT EXISTS insert_games_team AFTER INSERT ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET games_played=games_played+1 WHERE TeamsStatsSummary.team_id =new.team_id;
END;

DROP TRIGGER update_games_team;
CREATE TRIGGER IF NOT EXISTS update_games_team AFTER UPDATE ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET games_played=games_played WHERE TeamsStatsSummary.team_id =old.team_id;
END;

DROP TRIGGER delete_games_team;
CREATE TRIGGER IF NOT EXISTS delete_games_team AFTER DELETE ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET games_played=games_played-1 WHERE TeamsStatsSummary.team_id =old.team_id;
END;

DROP TRIGGER insert_barons;
CREATE TRIGGER IF NOT EXISTS insert_barons AFTER INSERT ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET barons=barons+new.barons WHERE TeamsStatsSummary.team_id =new.team_id;
END;

DROP TRIGGER update_barons;
CREATE TRIGGER IF NOT EXISTS update_barons AFTER UPDATE ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET barons=barons+new.barons-old.barons WHERE TeamsStatsSummary.team_id =old.team_id;
END;

DROP TRIGGER delete_barons;
CREATE TRIGGER IF NOT EXISTS delete_barons AFTER DELETE ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET barons=barons-old.barons WHERE TeamsStatsSummary.team_id =old.team_id;
END;

DROP TRIGGER insert_dragons;
CREATE TRIGGER IF NOT EXISTS insert_dragons AFTER INSERT ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET dragons=dragons+new.dragons WHERE TeamsStatsSummary.team_id =new.team_id;
END;

DROP TRIGGER update_dragons;
CREATE TRIGGER IF NOT EXISTS update_dragons AFTER UPDATE ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET dragons=dragons+new.dragons-old.dragons WHERE TeamsStatsSummary.team_id =old.team_id);
END;

DROP TRIGGER delete_dragons;
CREATE TRIGGER IF NOT EXISTS delete_dragons AFTER DELETE ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET dragons=dragons-old.dragons WHERE TeamsStatsSummary.team_id =old.team_id;
END;

DROP TRIGGER insert_first_bloods;
CREATE TRIGGER IF NOT EXISTS insert_first_bloods AFTER INSERT ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET first_bloods=first_bloods+new.first_bloods WHERE TeamsStatsSummary.team_id =new.team_id;
END;

DROP TRIGGER update_first_bloods;
CREATE TRIGGER IF NOT EXISTS update_first_bloods AFTER UPDATE ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET first_bloods=first_bloods+new.first_bloods-old.first_bloods WHERE TeamsStatsSummary.team_id =old.team_id;
END;

DROP TRIGGER delete_first_bloods;
CREATE TRIGGER IF NOT EXISTS delete_first_bloods AFTER DELETE ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET first_bloods=first_bloods-old.first_bloods WHERE TeamsStatsSummary.team_id =old.team_id;
END;

DROP TRIGGER insert_towers;
CREATE TRIGGER IF NOT EXISTS insert_towers AFTER INSERT ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET towers=towers+new.towers WHERE TeamsStatsSummary.team_id =new.team_id;
END;

DROP TRIGGER update_towers;
CREATE TRIGGER IF NOT EXISTS update_towers AFTER UPDATE ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET towers=towers+new.towers-old.towers WHERE TeamsStatsSummary.team_id =old.team_id;
END;

DROP TRIGGER delete_towers;
CREATE TRIGGER IF NOT EXISTS delete_towers AFTER DELETE ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET towers=towers-old.towers WHERE TeamsStatsSummary.team_id =old.team_id;
END;

DROP TRIGGER insert_points_team;
CREATE TRIGGER IF NOT EXISTS insert_points_team AFTER INSERT ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET points=points+new.points WHERE TeamsStatsSummary.team_id =new.team_id;
END;

DROP TRIGGER update_points_team;
CREATE TRIGGER IF NOT EXISTS update_points_team AFTER UPDATE ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET points=points+new.points-old.points WHERE TeamsStatsSummary.team_id =old.team_id;
END;

DROP TRIGGER delete_points_team;
CREATE TRIGGER IF NOT EXISTS delete_points_team AFTER DELETE ON TeamsStats
BEGIN
	UPDATE TeamsStatsSummary SET points=points-old.points WHERE TeamsStatsSummary.team_id =old.team_id;
END;

--PlayersStatsWeekly
DROP TRIGGER insert_kills_weekly;
CREATE TRIGGER IF NOT EXISTS insert_kills_weekly AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET kills=kills+new.kills WHERE PlayersStatsWeekly.player_id =new.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER insert_deaths_weekly;
CREATE TRIGGER IF NOT EXISTS insert_deaths_weekly AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET deaths=deaths+new.deaths WHERE PlayersStatsWeekly.player_id =new.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER insert_assists_weekly;
CREATE TRIGGER IF NOT EXISTS insert_assists_weekly AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET assists=assists+new.assists WHERE PlayersStatsWeekly.player_id =new.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER update_kills_weekly;
CREATE TRIGGER IF NOT EXISTS update_kills_weekly AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET kills=kills+new.kills-old.kills WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER update_deaths_weekly;
CREATE TRIGGER IF NOT EXISTS update_deaths_weekly AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET deaths=deaths+new.deaths-old.deaths WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER update_assists_weekly;
CREATE TRIGGER IF NOT EXISTS update_assists_weekly AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET assists=assists+new.assists-old.assists WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_kills_weekly;
CREATE TRIGGER IF NOT EXISTS delete_kills_weekly AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET kills=kills-old.kills WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_deaths_weekly;
CREATE TRIGGER IF NOT EXISTS delete_deaths_weekly AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET deaths=deaths-old.deaths WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_assists_weekly;
CREATE TRIGGER IF NOT EXISTS delete_assists_weekly AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET assists=assists-old.assists WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;



DROP TRIGGER insert_triples_weekly;
CREATE TRIGGER IF NOT EXISTS insert_triples_weekly AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET triples=triples+new.triples WHERE PlayersStatsWeekly.player_id =new.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER update_triples_weekly;
CREATE TRIGGER IF NOT EXISTS update_triples_weekly AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET triples=triples+new.triples-old.triples WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_triples_weekly;
CREATE TRIGGER IF NOT EXISTS delete_triples_weekly AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET triples=triples-old.triples WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER insert_quadras_weekly;
CREATE TRIGGER IF NOT EXISTS insert_quadras_weekly AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET quadras=quadras+new.quadras WHERE PlayersStatsWeekly.player_id =new.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER update_quadras_weekly;
CREATE TRIGGER IF NOT EXISTS update_quadras_weekly AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET quadras=quadras+new.quadras-old.quadras WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_quadras_weekly;
CREATE TRIGGER IF NOT EXISTS delete_quadras_weekly AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET quadras=quadras-old.quadras WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER insert_pentas_weekly;
CREATE TRIGGER IF NOT EXISTS insert_pentas_weekly AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET pentas=pentas+new.pentas WHERE PlayersStatsWeekly.player_id =new.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER update_pentas_weekly;
CREATE TRIGGER IF NOT EXISTS update_pentas_weekly AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET pentas=pentas+new.pentas-old.pentas WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_pentas_weekly;
CREATE TRIGGER IF NOT EXISTS delete_pentas_weekly AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET pentas=pentas-old.pentas WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER insert_points_weekly;
CREATE TRIGGER IF NOT EXISTS insert_points_weekly AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET points=points+new.points WHERE PlayersStatsWeekly.player_id =new.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER update_points_weekly;
CREATE TRIGGER IF NOT EXISTS update_points_weekly AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET points=points+new.points-old.points WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_points_weekly;
CREATE TRIGGER IF NOT EXISTS delete_points_weekly AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET points=points-old.points WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;



DROP TRIGGER insert_games_played_weekly;
CREATE TRIGGER IF NOT EXISTS insert_games_played_weekly AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET games_played=games_played+1 WHERE PlayersStatsWeekly.player_id =new.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER update_games_played_weekly;
CREATE TRIGGER IF NOT EXISTS update_games_played_weekly AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET games_played=games_played WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_games_played_weekly;
CREATE TRIGGER IF NOT EXISTS delete_games_played_weekly AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET games_played=games_played-1 WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;


DROP TRIGGER insert_creep_score_weekly;
CREATE TRIGGER IF NOT EXISTS insert_creep_score_weekly AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET creep_score=creep_score+new.creep_score WHERE PlayersStatsWeekly.player_id =new.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=new.match_id);
END;

DROP TRIGGER update_creep_score_weekly;
CREATE TRIGGER IF NOT EXISTS update_creep_score_weekly AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET creep_score=creep_score+new.creep_score-old.creep_score WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

DROP TRIGGER delete_creep_score_weekly;
CREATE TRIGGER IF NOT EXISTS delete_creep_score_weekly AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsWeekly SET creep_score=creep_score-old.creep_score WHERE PlayersStatsWeekly.player_id =old.player_id AND PlayersStatsWeekly.week =(SELECT week FROM Match WHERE Match.id=old.match_id);
END;

--PlayersStatsSummary
DROP TRIGGER insert_kills;
CREATE TRIGGER IF NOT EXISTS insert_kills AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET kills=kills+new.kills WHERE PlayersStatsSummary.player_id =new.player_id;
END;

DROP TRIGGER insert_deaths;
CREATE TRIGGER IF NOT EXISTS insert_deaths AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET deaths=deaths+new.deaths WHERE PlayersStatsSummary.player_id =new.player_id;
END;

DROP TRIGGER insert_assists;
CREATE TRIGGER IF NOT EXISTS insert_assists AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET assists=assists+new.assists WHERE PlayersStatsSummary.player_id =new.player_id;
END;

DROP TRIGGER update_kills;
CREATE TRIGGER IF NOT EXISTS update_kills AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET kills=kills+new.kills-old.kills WHERE PlayersStatsSummary.player_id =old.player_id;
END;

DROP TRIGGER update_deaths;
CREATE TRIGGER IF NOT EXISTS update_deaths AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET deaths=deaths+new.deaths-old.deaths WHERE PlayersStatsSummary.player_id =old.player_id;
END;

DROP TRIGGER update_assists;
CREATE TRIGGER IF NOT EXISTS update_assists AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET assists=assists+new.assists-old.assists WHERE PlayersStatsSummary.player_id =old.player_id;
END;

DROP TRIGGER delete_kills;
CREATE TRIGGER IF NOT EXISTS delete_kills AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET kills=kills-old.kills WHERE PlayersStatsSummary.player_id =old.player_id;
END;

DROP TRIGGER delete_deaths; 
CREATE TRIGGER IF NOT EXISTS delete_deaths AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET deaths=deaths-old.deaths WHERE PlayersStatsSummary.player_id =old.player_id;
END;

DROP TRIGGER delete_assists;
CREATE TRIGGER IF NOT EXISTS delete_assists AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET assists=assists-old.assists WHERE PlayersStatsSummary.player_id =old.player_id;
END;



DROP TRIGGER insert_triples;
CREATE TRIGGER IF NOT EXISTS insert_triples AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET triples=triples+new.triples WHERE PlayersStatsSummary.player_id =new.player_id;
END;

DROP TRIGGER update_triples;
CREATE TRIGGER IF NOT EXISTS update_triples AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET triples=triples+new.triples-old.triples WHERE PlayersStatsSummary.player_id =old.player_id;
END;

DROP TRIGGER delete_triples;
CREATE TRIGGER IF NOT EXISTS delete_triples AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET triples=triples-old.triples WHERE PlayersStatsSummary.player_id =old.player_id;
END;

DROP TRIGGER insert_quadras;
CREATE TRIGGER IF NOT EXISTS insert_quadras AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET quadras=quadras+new.quadras WHERE PlayersStatsSummary.player_id =new.player_id;
END;

DROP TRIGGER update_quadras;
CREATE TRIGGER IF NOT EXISTS update_quadras AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET quadras=quadras+new.quadras-old.quadras WHERE PlayersStatsSummary.player_id =old.player_id;
END;

DROP TRIGGER delete_quadras;
CREATE TRIGGER IF NOT EXISTS delete_quadras AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET quadras=quadras-old.quadras WHERE PlayersStatsSummary.player_id =old.player_id;
END;

DROP TRIGGER insert_pentas;
CREATE TRIGGER IF NOT EXISTS insert_pentas AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET pentas=pentas+new.pentas WHERE PlayersStatsSummary.player_id =new.player_id;
END;

DROP TRIGGER update_pentas;
CREATE TRIGGER IF NOT EXISTS update_pentas AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET pentas=pentas+new.pentas-old.pentas WHERE PlayersStatsSummary.player_id =old.player_id;
END;

DROP TRIGGER delete_pentas;
CREATE TRIGGER IF NOT EXISTS delete_pentas AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET pentas=pentas-old.pentas WHERE PlayersStatsSummary.player_id =old.player_id;
END;

DROP TRIGGER insert_points;
CREATE TRIGGER IF NOT EXISTS insert_points AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET points=points+new.points WHERE PlayersStatsSummary.player_id =new.player_id;
END;

DROP TRIGGER update_points;
CREATE TRIGGER IF NOT EXISTS update_points AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET points=points+new.points-old.points WHERE PlayersStatsSummary.player_id =old.player_id;
END;

DROP TRIGGER delete_points;
CREATE TRIGGER IF NOT EXISTS delete_points AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET points=points-old.points WHERE PlayersStatsSummary.player_id =old.player_id;
END;


DROP TRIGGER insert_games_played;
CREATE TRIGGER IF NOT EXISTS insert_games_played AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET games_played=games_played+1 WHERE PlayersStatsSummary.player_id =new.player_id;
END;

DROP TRIGGER update_games_played;
CREATE TRIGGER IF NOT EXISTS update_games_played AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET games_played=games_played WHERE PlayersStatsSummary.player_id =old.player_id;
END;

DROP TRIGGER delete_games_played;
CREATE TRIGGER IF NOT EXISTS delete_games_played AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET games_played=games_played-1 WHERE PlayersStatsSummary.player_id =old.player_id;
END;


DROP TRIGGER insert_creep_score;
CREATE TRIGGER IF NOT EXISTS insert_creep_score AFTER INSERT ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET creep_score=creep_score+new.creep_score WHERE PlayersStatsSummary.player_id =new.player_id;
END;

DROP TRIGGER update_creep_score;
CREATE TRIGGER IF NOT EXISTS update_creep_score AFTER UPDATE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET creep_score=creep_score+new.creep_score-old.creep_score WHERE PlayersStatsSummary.player_id =old.player_id;
END;

DROP TRIGGER delete_creep_score;
CREATE TRIGGER IF NOT EXISTS delete_creep_score AFTER DELETE ON PlayersStats
BEGIN
	UPDATE PlayersStatsSummary SET creep_score=creep_score-old.creep_score WHERE PlayersStatsSummary.player_id =old.player_id;
END;

-- TO-DO: same for Teams!


-- ATTENTION: Test data comes from Summer Split 2021
-- ONLY WEEK 1, this takes way too much time

-- game table insertions

INSERT INTO Game VALUES(1,4,2,8,0,1,TRUE);
INSERT INTO Game VALUES(2,10,2,6,0,1,TRUE);
INSERT INTO Game VALUES(3,7,1,9,2,1,TRUE);
INSERT INTO Game VALUES(4,5,2,2,1,1,TRUE);
INSERT INTO Game VALUES(5,1,2,4,1,1,TRUE);
INSERT INTO Game VALUES(6,3,2,10,1,1,TRUE);
INSERT INTO Game VALUES(7,9,2,8,1,1,TRUE);
INSERT INTO Game VALUES(8,5,2,6,0,1,TRUE);
INSERT INTO Game VALUES(9,7,2,3,0,1,TRUE);
INSERT INTO Game VALUES(10,2,0,1,2,1,TRUE);
INSERT INTO Game VALUES(11,2,0,9,0,2,FALSE);
INSERT INTO Game VALUES(12,7,0,5,0,2,FALSE);
INSERT INTO Game VALUES(13,10,0,4,0,2,FALSE);
INSERT INTO Game VALUES(14,3,0,1,0,2,FALSE);
INSERT INTO Game VALUES(15,8,0,6,0,2,FALSE);
INSERT INTO Game VALUES(16,9,0,5,0,2,FALSE);
INSERT INTO Game VALUES(17,3,0,2,0,2,FALSE);
INSERT INTO Game VALUES(18,1,0,7,0,2,FALSE);
INSERT INTO Game VALUES(19,8,0,10,0,2,FALSE);
INSERT INTO Game VALUES(20,4,0,6,0,2,FALSE);

-- match table insertions
INSERT INTO Match VALUES(1,1,1,TRUE,8,0,4,1,1,36,6);
INSERT INTO Match VALUES(2,2,1,TRUE,4,1,8,0,1,32,54);
INSERT INTO Match VALUES(3,1,2,TRUE,10,1,6,0,1,28,42);
INSERT INTO Match VALUES(4,2,2,TRUE,6,0,10,1,1,23,41);
INSERT INTO Match VALUES(5,1,3,TRUE,7,1,9,0,1,26,39);
INSERT INTO Match VALUES(6,2,3,TRUE,9,1,7,0,1,38,16);
INSERT INTO Match VALUES(7,3,3,TRUE,7,0,9,1,1,34,52);
INSERT INTO Match VALUES(8,1,4,TRUE,5,0,2,1,1,37,58);
INSERT INTO Match VALUES(9,2,4,TRUE,2,0,5,1,1,29,08);
INSERT INTO Match VALUES(10,3,4,TRUE,5,1,2,0,1,25,21);
INSERT INTO Match VALUES(11,1,5,TRUE,1,0,4,1,1,33,15);
INSERT INTO Match VALUES(12,2,5,TRUE,1,1,4,0,1,32,21);
INSERT INTO Match VALUES(13,3,5,TRUE,4,0,1,1,1,32,38);
INSERT INTO Match VALUES(14,1,6,TRUE,3,1,10,0,1,34,31);
INSERT INTO Match VALUES(15,2,6,TRUE,10,1,3,0,1,32,47);
INSERT INTO Match VALUES(16,3,6,TRUE,3,1,10,0,1,37,11);
INSERT INTO Match VALUES(17,1,7,TRUE,9,0,8,1,1,25,15);
INSERT INTO Match VALUES(18,2,7,TRUE,9,1,8,0,1,32,37);
INSERT INTO Match VALUES(19,3,7,TRUE,8,0,9,1,1,28,55);
INSERT INTO Match VALUES(20,1,8,TRUE,6,0,5,1,1,45,09);
INSERT INTO Match VALUES(21,2,8,TRUE,6,0,5,1,1,31,22);
INSERT INTO Match VALUES(22,1,9,TRUE,7,1,3,0,1,27,57);
INSERT INTO Match VALUES(23,2,9,TRUE,3,0,7,1,1,29,39);
INSERT INTO Match VALUES(24,1,10,TRUE,2,0,1,1,1,30,58);
INSERT INTO Match VALUES(25,2,10,TRUE,1,1,2,0,1,40,07);

-- player stats insertions
INSERT INTO PlayersStats VALUES(1,21,1,2,0,9,309,0,0,0,20.59);
INSERT INTO PlayersStats VALUES(2,22,1,2,3,13,222,0,0,0,26.22);
INSERT INTO PlayersStats VALUES(3,23,1,11,0,5,376,0,0,0,35.26);
INSERT INTO PlayersStats VALUES(4,24,1,3,1,10,347,0,0,0,26.47);
INSERT INTO PlayersStats VALUES(5,25,1,1,2,11,47,0,0,0,20.47);
INSERT INTO PlayersStats VALUES(6,51,1,3,2,1,334,0,0,0,9.84);
INSERT INTO PlayersStats VALUES(7,52,1,1,6,4,203,0,0,0,7.03);
INSERT INTO PlayersStats VALUES(8,53,1,2,4,3,324,0,0,0,9.74);
INSERT INTO PlayersStats VALUES(9,54,1,0,2,3,288,0,0,0,6.38);
INSERT INTO PlayersStats VALUES(10,55,1,0,5,4,33,0,0,0,3.83);
INSERT INTO PlayersStats VALUES(11,21,2,3,2,7,233,0,0,0,17.83);
INSERT INTO PlayersStats VALUES(12,22,2,4,0,9,198,0,0,0,23.48);
INSERT INTO PlayersStats VALUES(13,23,2,9,1,4,276,0,0,0,26.26);
INSERT INTO PlayersStats VALUES(14,24,2,1,2,9,356,0,0,0,18.06);
INSERT INTO PlayersStats VALUES(15,25,2,0,1,11,52,0,0,0,18.52);
INSERT INTO PlayersStats VALUES(16,51,2,2,6,3,301,0,0,0,8.51);
INSERT INTO PlayersStats VALUES(17,52,2,1,2,2,190,0,0,0,5.90);
INSERT INTO PlayersStats VALUES(18,53,2,2,3,3,259,0,0,0,9.59);
INSERT INTO PlayersStats VALUES(19,54,2,1,4,2,264,0,0,0,4.64);
INSERT INTO PlayersStats VALUES(20,55,2,0,2,4,36,0,0,0,3.36);
INSERT INTO PlayersStats VALUES(21,64,3,7,0,5,260,0,0,0,24.1);
INSERT INTO PlayersStats VALUES(22,70,3,4,1,10,185,0,0,0,26.35);
INSERT INTO PlayersStats VALUES(23,66,3,4,2,6,221,0,0,0,18.21);
INSERT INTO PlayersStats VALUES(24,72,3,4,0,10,267,0,0,0,27.67);
INSERT INTO PlayersStats VALUES(25,68,3,1,3,13,36,0,0,0,25.36);
INSERT INTO PlayersStats VALUES(26,36,3,0,4,4,166,0,0,0,5.66);
INSERT INTO PlayersStats VALUES(27,38,3,2,5,2,139,0,0,0,5.89);
INSERT INTO PlayersStats VALUES(28,39,3,1,1,3,257,0,0,0,8.57);
INSERT INTO PlayersStats VALUES(29,40,3,3,5,2,245,0,0,0,8.95);
INSERT INTO PlayersStats VALUES(30,41,4,0,5,5,33,0,0,0,5.33);
INSERT INTO PlayersStats VALUES(31,36,4,0,5,1,187,0,0,0,0.87);
INSERT INTO PlayersStats VALUES(32,38,4,1,5,4,129,0,0,0,6.79);
INSERT INTO PlayersStats VALUES(33,39,4,1,0,3,225,0,0,0,8.75);
INSERT INTO PlayersStats VALUES(34,40,4,3,4,1,165,0,0,0,7.15);
INSERT INTO PlayersStats VALUES(35,41,4,0,6,3,35,0,0,0,1.85);
INSERT INTO PlayersStats VALUES(36,64,4,2,1,11,181,0,0,0,23.81);
INSERT INTO PlayersStats VALUES(37,70,4,4,2,9,158,0,0,0,22.08);
INSERT INTO PlayersStats VALUES(38,66,4,7,1,6,197,0,0,0,24.47);
INSERT INTO PlayersStats VALUES(39,72,4,7,0,10,50,0,0,0,31.5);
INSERT INTO PlayersStats VALUES(40,68,4,0,1,13,102,0,0,0,22.02);
INSERT INTO PlayersStats VALUES(41,42,5,4,1,3,273,0,0,0,14.73);
INSERT INTO PlayersStats VALUES(42,43,5,6,0,5,197,0,0,0,21.47);
INSERT INTO PlayersStats VALUES(43,44,5,1,2,9,222,0,0,0,16.72);
INSERT INTO PlayersStats VALUES(44,46,5,7,0,3,261,0,0,0,21.11);
INSERT INTO PlayersStats VALUES(45,48,5,0,1,7,28,0,0,0,10.28);
INSERT INTO PlayersStats VALUES(46,58,5,1,3,1,222,0,0,0,4.22);
INSERT INTO PlayersStats VALUES(47,59,5,1,2,2,177,0,0,0,5.77);
INSERT INTO PlayersStats VALUES(48,60,5,1,5,1,207,0,0,0,3.07);
INSERT INTO PlayersStats VALUES(49,61,5,1,6,2,29,0,0,0,2.29);
INSERT INTO PlayersStats VALUES(50,62,5,0,2,1,172,0,0,0,2.22);
INSERT INTO PlayersStats VALUES(51,58,6,1,3,12,285,0,0,0,21.35);
INSERT INTO PlayersStats VALUES(52,59,6,1,0,5,269,0,0,0,12.19);
INSERT INTO PlayersStats VALUES(53,60,6,9,1,8,346,0,0,0,32.96);
INSERT INTO PlayersStats VALUES(54,61,6,5,2,7,376,0,0,0,25.26);
INSERT INTO PlayersStats VALUES(55,62,6,1,2,11,26,0,0,0,19.76);
INSERT INTO PlayersStats VALUES(56,42,6,3,4,1,298,0,0,0,8.48);
INSERT INTO PlayersStats VALUES(57,43,6,0,3,3,235,0,0,0,5.35);
INSERT INTO PlayersStats VALUES(58,44,6,2,3,2,317,0,0,0,8.67);
INSERT INTO PlayersStats VALUES(59,46,6,3,3,2,391,0,0,0,11.41);
INSERT INTO PlayersStats VALUES(60,48,6,0,4,4,28,0,0,0,4.28);
INSERT INTO PlayersStats VALUES(61,42,7,5,4,2,323,0,0,0,14.23);
INSERT INTO PlayersStats VALUES(62,43,7,1,3,6,202,0,0,0,14.02);
INSERT INTO PlayersStats VALUES(63,44,7,1,2,5,304,0,0,0,14.04);
INSERT INTO PlayersStats VALUES(64,46,7,2,4,4,341,0,0,0,11.41);
INSERT INTO PlayersStats VALUES(65,48,7,0,3,7,42,0,0,0,9.42);
INSERT INTO PlayersStats VALUES(66,58,7,6,1,6,300,0,0,0,23.50);
INSERT INTO PlayersStats VALUES(67,59,7,3,1,9,258,0,0,0,21.58);
INSERT INTO PlayersStats VALUES(68,60,7,1,3,8,284,0,0,0,14.34);
INSERT INTO PlayersStats VALUES(69,61,7,5,1,6,330,0,0,0,21.80);
INSERT INTO PlayersStats VALUES(70,62,7,1,3,10,38,0,0,0,15.88);
INSERT INTO PlayersStats VALUES(71,28,8,0,1,3,313,0,0,0,4.13);
INSERT INTO PlayersStats VALUES(72,29,8,1,1,2,244,0,0,0,6.94);
INSERT INTO PlayersStats VALUES(73,30,8,0,4,1,290,0,0,0,2.40);
INSERT INTO PlayersStats VALUES(74,31,8,3,2,0,397,0,0,0,8.97);
INSERT INTO PlayersStats VALUES(75,32,8,0,4,1,31,0,0,0,-0.21);
INSERT INTO PlayersStats VALUES(76,8,8,0,0,11,241,0,0,0,20.91);
INSERT INTO PlayersStats VALUES(77,9,8,5,3,7,269,0,0,0,21.69);
INSERT INTO PlayersStats VALUES(78,10,8,2,0,5,313,0,0,0,17.13);
INSERT INTO PlayersStats VALUES(79,11,8,4,0,8,427,0,0,0,24.27);
INSERT INTO PlayersStats VALUES(80,12,8,1,1,9,35,0,0,0,15.35);
INSERT INTO PlayersStats VALUES(81,28,9,3,1,1,255,0,0,0,9.55);
INSERT INTO PlayersStats VALUES(82,29,9,2,0,6,189,0,0,0,14.89);
INSERT INTO PlayersStats VALUES(83,30,9,8,1,7,225,0,0,0,28.25);
INSERT INTO PlayersStats VALUES(84,31,9,5,1,5,282,0,0,0,14.82);
INSERT INTO PlayersStats VALUES(85,32,9,0,2,11,27,0,0,0,15.77);
INSERT INTO PlayersStats VALUES(86,8,9,0,3,2,234,0,0,0,3.84);
INSERT INTO PlayersStats VALUES(87,9,9,2,6,3,174,0,0,0,7.24);
INSERT INTO PlayersStats VALUES(88,10,9,1,4,4,232,0,0,0,8.32);
INSERT INTO PlayersStats VALUES(89,11,9,1,4,3,263,0,0,0,7.13);
INSERT INTO PlayersStats VALUES(90,12,9,1,1,3,38,0,0,0,4.88);
INSERT INTO PlayersStats VALUES(91,28,10,1,1,4,212,0,0,0,9.62);
INSERT INTO PlayersStats VALUES(92,29,10,3,0,4,160,0,0,0,16.60);
INSERT INTO PlayersStats VALUES(93,30,10,2,1,4,240,0,0,0,11.90);
INSERT INTO PlayersStats VALUES(94,31,10,4,0,4,297,0,0,0,16.97);
INSERT INTO PlayersStats VALUES(95,32,10,1,0,8,24,0,0,0,14.24);
INSERT INTO PlayersStats VALUES(96,8,10,0,3,1,165,0,0,0,1.65);
INSERT INTO PlayersStats VALUES(97,9,10,1,3,0,185,0,0,0,2.35);
INSERT INTO PlayersStats VALUES(98,10,10,0,1,0,223,0,0,0,1.73);
INSERT INTO PlayersStats VALUES(99,11,10,1,2,0,248,0,0,0,5.48);
INSERT INTO PlayersStats VALUES(100,12,10,0,2,2,7,0,0,0,2.07);
INSERT INTO PlayersStats VALUES(101,1,11,1,3,0,319,0,0,0,3.69);
INSERT INTO PlayersStats VALUES(102,2,11,1,4,0,233,0,0,0,2.33);
INSERT INTO PlayersStats VALUES(103,3,11,0,3,1,271,0,0,0,2.71);
INSERT INTO PlayersStats VALUES(104,4,11,0,2,1,66,0,0,0,1.16);
INSERT INTO PlayersStats VALUES(105,5,11,0,2,1,247,0,0,0,2.97);
INSERT INTO PlayersStats VALUES(106,21,11,2,1,10,225,0,0,0,27.75);
INSERT INTO PlayersStats VALUES(107,22,11,3,0,7,224,0,0,0,18.74);
INSERT INTO PlayersStats VALUES(108,23,11,4,1,10,349,0,0,0,32.99);
INSERT INTO PlayersStats VALUES(109,24,11,3,0,7,328,0,0,0,19.78);
INSERT INTO PlayersStats VALUES(110,25,11,2,0,6,46,0,0,0,13.46);
INSERT INTO PlayersStats VALUES(111,1,12,7,2,2,333,0,0,0,19.33);
INSERT INTO PlayersStats VALUES(112,2,12,1,1,8,236,0,0,0,15.86);
INSERT INTO PlayersStats VALUES(113,3,12,4,2,5,289,0,0,0,17.39);
INSERT INTO PlayersStats VALUES(114,4,12,1,1,12,58,0,0,0,22.08);
INSERT INTO PlayersStats VALUES(115,5,12,1,1,8,184,0,0,0,15.34);
INSERT INTO PlayersStats VALUES(116,21,12,2,5,1,202,0,0,0,5.02);
INSERT INTO PlayersStats VALUES(117,22,12,1,4,6,163,0,0,0,10.63);
INSERT INTO PlayersStats VALUES(118,23,12,1,2,3,278,0,0,0,8.28);
INSERT INTO PlayersStats VALUES(119,24,12,2,2,5,312,0,0,0,13.62);
INSERT INTO PlayersStats VALUES(120,25,12,1,1,6,33,0,0,0,10.33);
INSERT INTO PlayersStats VALUES(121,21,13,0,2,0,240,0,0,0,1.40);
INSERT INTO PlayersStats VALUES(122,22,13,1,1,0,238,0,0,0,3.83);
INSERT INTO PlayersStats VALUES(123,23,13,0,1,1,289,0,0,0,3.89);
INSERT INTO PlayersStats VALUES(124,24,13,0,1,0,314,0,0,0,2.64);
INSERT INTO PlayersStats VALUES(125,25,13,0,2,0,38,0,0,0,-0.62);
INSERT INTO PlayersStats VALUES(126,1,13,2,0,2,326,0,0,0,10.26);
INSERT INTO PlayersStats VALUES(127,2,13,2,0,4,233,0,0,0,12.33);
INSERT INTO PlayersStats VALUES(128,3,13,1,1,4,312,0,0,0,10.62);
INSERT INTO PlayersStats VALUES(129,4,13,2,0,4,284,0,0,0,12.84);
INSERT INTO PlayersStats VALUES(130,5,13,0,0,7,39,0,0,0,3.89);
INSERT INTO PlayersStats VALUES(131,14,14,9,3,7,260,0,0,0,29.60);
INSERT INTO PlayersStats VALUES(132,15,14,4,3,4,221,0,0,0,14.71);
INSERT INTO PlayersStats VALUES(133,16,14,2,3,8,340,0,0,0,17.90);
INSERT INTO PlayersStats VALUES(134,17,14,2,1,13,53,0,0,0,25.53);
INSERT INTO PlayersStats VALUES(135,18,14,0,3,5,214,0,0,0,8.14);
INSERT INTO PlayersStats VALUES(136,64,14,4,4,4,251,0,0,0,14.51);
INSERT INTO PlayersStats VALUES(137,70,14,1,4,8,209,0,0,0,14.09);
INSERT INTO PlayersStats VALUES(138,66,14,3,3,3,294,0,0,0,12.94);
INSERT INTO PlayersStats VALUES(139,72,14,3,3,3,334,0,0,0,13.34);
INSERT INTO PlayersStats VALUES(140,68,14,2,3,5,44,0,0,0,10.44);
INSERT INTO PlayersStats VALUES(141,64,15,5,2,8,233,0,0,0,23.33);
INSERT INTO PlayersStats VALUES(142,70,15,2,4,9,166,0,0,0,17.16);
INSERT INTO PlayersStats VALUES(143,66,15,4,3,7,238,0,0,0,19.38);
INSERT INTO PlayersStats VALUES(144,72,15,3,1,5,349,0,0,0,16.49);
INSERT INTO PlayersStats VALUES(145,68,15,1,3,8,35,0,0,0,12.85);
INSERT INTO PlayersStats VALUES(146,14,15,5,3,6,197,0,0,0,19.47);
INSERT INTO PlayersStats VALUES(147,15,15,1,4,8,216,0,0,0,14.16);
INSERT INTO PlayersStats VALUES(148,16,15,4,3,4,249,0,0,0,16.49);
INSERT INTO PlayersStats VALUES(149,17,15,2,2,6,314,0,0,0,15.14);
INSERT INTO PlayersStats VALUES(150,18,15,0,3,6,37,0,0,0,10.37);
INSERT INTO PlayersStats VALUES(151,14,16,4,4,5,295,0,0,0,16.45);
INSERT INTO PlayersStats VALUES(152,15,16,1,1,9,243,0,0,0,17.43);
INSERT INTO PlayersStats VALUES(153,16,16,3,0,11,229,0,0,0,26.79);
INSERT INTO PlayersStats VALUES(154,17,16,6,3,4,377,0,0,0,20.27);
INSERT INTO PlayersStats VALUES(155,18,16,1,5,5,55,0,0,0,7.55);
INSERT INTO PlayersStats VALUES(156,64,16,1,2,4,283,0,0,0,9.83);
INSERT INTO PlayersStats VALUES(157,70,16,3,3,5,180,0,0,0,13.80);
INSERT INTO PlayersStats VALUES(158,66,16,2,3,3,299,0,0,0,9.99);
INSERT INTO PlayersStats VALUES(159,72,16,7,4,4,363,0,0,0,21.63);
INSERT INTO PlayersStats VALUES(160,68,16,0,3,9,39,0,0,0,12.39);
INSERT INTO PlayersStats VALUES(161,58,17,3,4,2,174,0,0,0,8.74);
INSERT INTO PlayersStats VALUES(162,59,17,2,3,3,153,0,0,0,8.53);
INSERT INTO PlayersStats VALUES(163,60,17,0,1,4,232,0,0,0,7.82);
INSERT INTO PlayersStats VALUES(164,61,17,1,1,2,278,0,0,0,7.28);
INSERT INTO PlayersStats VALUES(165,62,17,0,3,3,32,0,0,0,3.32);
INSERT INTO PlayersStats VALUES(166,51,17,4,2,6,222,0,0,0,18.22);
INSERT INTO PlayersStats VALUES(167,52,17,3,0,6,158,0,0,0,16.58);
INSERT INTO PlayersStats VALUES(168,53,17,2,0,4,249,0,0,0,12.49);
INSERT INTO PlayersStats VALUES(169,54,17,2,1,2,238,0,0,0,8.88);
INSERT INTO PlayersStats VALUES(170,55,17,1,3,4,29,0,0,0,6.79);
INSERT INTO PlayersStats VALUES(171,58,18,3,0,9,231,0,0,0,21.81);
INSERT INTO PlayersStats VALUES(172,59,18,6,0,11,243,0,0,0,32.93);
INSERT INTO PlayersStats VALUES(173,60,18,2,3,11,240,0,0,0,23.40);
INSERT INTO PlayersStats VALUES(174,61,18,10,2,4,284,0,0,0,29.84);
INSERT INTO PlayersStats VALUES(175,62,18,0,3,15,36,0,0,0,23.36);
INSERT INTO PlayersStats VALUES(176,51,18,4,2,2,300,0,0,0,13.00);
INSERT INTO PlayersStats VALUES(177,52,18,0,7,5,153,0,0,0,5.53);
INSERT INTO PlayersStats VALUES(178,53,18,2,3,3,302,0,0,0,10.02);
INSERT INTO PlayersStats VALUES(179,54,18,2,3,3,308,0,0,0,10.08);
INSERT INTO PlayersStats VALUES(180,55,18,0,6,4,33,0,0,0,2.33);
INSERT INTO PlayersStats VALUES(181,51,19,0,2,0,247,0,0,0,1.47);
INSERT INTO PlayersStats VALUES(182,52,19,0,6,0,155,0,0,0,-1.45);
INSERT INTO PlayersStats VALUES(183,53,19,0,1,0,219,0,0,0,1.69);
INSERT INTO PlayersStats VALUES(184,54,19,2,4,0,279,0,0,0,4.79);
INSERT INTO PlayersStats VALUES(185,55,19,0,7,2,31,0,0,0,-0.19);
INSERT INTO PlayersStats VALUES(186,58,19,5,0,9,213,0,0,0,25.63);
INSERT INTO PlayersStats VALUES(187,59,19,8,0,7,170,0,0,0,21.20);
INSERT INTO PlayersStats VALUES(188,60,19,2,0,12,240,0,0,0,26.40);
INSERT INTO PlayersStats VALUES(189,61,19,4,0,12,269,0,0,0,30.69);
INSERT INTO PlayersStats VALUES(190,62,19,1,2,17,27,0,0,0,26.77);
INSERT INTO PlayersStats VALUES(191,36,20,0,2,3,266,0,0,0,6.16);
INSERT INTO PlayersStats VALUES(192,38,20,2,5,7,208,0,0,0,14.08);
INSERT INTO PlayersStats VALUES(193,39,20,5,1,4,439,0,0,0,19.89);
INSERT INTO PlayersStats VALUES(194,40,20,3,2,5,462,0,0,0,17.12);
INSERT INTO PlayersStats VALUES(195,41,20,1,1,9,43,0,0,0,14.93);
INSERT INTO PlayersStats VALUES(196,28,20,1,4,4,402,0,0,0,10.02);
INSERT INTO PlayersStats VALUES(197,29,20,4,0,4,228,0,0,0,16.28);
INSERT INTO PlayersStats VALUES(198,30,20,4,5,5,304,0,0,0,16.04);
INSERT INTO PlayersStats VALUES(199,31,20,2,0,5,547,0,0,0,16.97);
INSERT INTO PlayersStats VALUES(200,32,20,0,2,8,14,0,0,0,11.14);
INSERT INTO PlayersStats VALUES(201,36,21,3,4,5,260,0,0,0,14.1);
INSERT INTO PlayersStats VALUES(202,38,21,5,4,7,146,0,0,0,19.96);
INSERT INTO PlayersStats VALUES(203,39,21,2,6,4,211,0,0,0,9.11);
INSERT INTO PlayersStats VALUES(204,40,21,3,4,8,286,0,0,0,18.86);
INSERT INTO PlayersStats VALUES(205,41,21,0,7,9,29,0,0,0,10.29);
INSERT INTO PlayersStats VALUES(206,28,21,5,4,13,289,0,0,0,32.39);
INSERT INTO PlayersStats VALUES(207,29,21,6,2,5,160,0,0,0,20.1);
INSERT INTO PlayersStats VALUES(208,30,21,8,2,6,256,0,0,0,26.56);
INSERT INTO PlayersStats VALUES(209,31,21,5,2,8,333,0,0,0,24.33);
INSERT INTO PlayersStats VALUES(210,32,21,1,3,16,33,0,0,0,26.83);
INSERT INTO PlayersStats VALUES(211,42,22,4,0,11,241,0,0,0,28.91);
INSERT INTO PlayersStats VALUES(212,43,22,2,2,12,183,0,0,0,24.83);
INSERT INTO PlayersStats VALUES(213,44,22,7,0,6,242,0,0,0,25.42);
INSERT INTO PlayersStats VALUES(214,46,22,4,4,7,282,0,0,0,19.32);
INSERT INTO PlayersStats VALUES(215,47,22,1,1,15,41,0,0,0,26.41);
INSERT INTO PlayersStats VALUES(216,14,22,0,3,5,236,0,0,0,8.36);
INSERT INTO PlayersStats VALUES(217,15,22,0,3,3,186,0,0,0,4.86);
INSERT INTO PlayersStats VALUES(218,16,22,5,3,0,225,0,0,0,10.75);
INSERT INTO PlayersStats VALUES(219,17,22,1,4,4,237,0,0,0,8.37);
INSERT INTO PlayersStats VALUES(220,18,22,1,5,4,51,0,0,0,6.01);
INSERT INTO PlayersStats VALUES(221,14,23,0,5,1,250,0,0,0,1.00);
INSERT INTO PlayersStats VALUES(222,15,23,1,3,1,193,0,0,0,3.93);
INSERT INTO PlayersStats VALUES(223,16,23,0,1,1,196,0,0,0,2.96);
INSERT INTO PlayersStats VALUES(224,17,23,1,4,0,246,0,0,0,2.46);
INSERT INTO PlayersStats VALUES(225,18,23,0,4,2,33,0,0,0,1.33);
INSERT INTO PlayersStats VALUES(226,42,23,0,2,10,273,0,0,0,18.73);
INSERT INTO PlayersStats VALUES(227,43,23,2,0,10,178,0,0,0,22.78);
INSERT INTO PlayersStats VALUES(228,44,23,8,0,3,235,0,0,0,22.85);
INSERT INTO PlayersStats VALUES(229,46,23,7,0,8,79,0,0,0,26.79);
INSERT INTO PlayersStats VALUES(230,47,23,0,0,12,182,0,0,0,21.82);
INSERT INTO PlayersStats VALUES(231,8,24,1,3,1,258,0,0,0,4.58);
INSERT INTO PlayersStats VALUES(232,9,24,0,1,2,254,0,0,0,4.54);
INSERT INTO PlayersStats VALUES(233,10,24,1,5,1,276,0,0,0,3.76);
INSERT INTO PlayersStats VALUES(234,11,24,2,3,1,288,0,0,0,6.88);
INSERT INTO PlayersStats VALUES(235,12,24,0,3,3,38,0,0,0,3.38);
INSERT INTO PlayersStats VALUES(236,1,24,3,2,7,286,0,0,0,18.36);
INSERT INTO PlayersStats VALUES(237,2,24,0,0,10,198,0,0,0,18.98);
INSERT INTO PlayersStats VALUES(238,3,24,4,1,5,284,0,0,0,17.84);
INSERT INTO PlayersStats VALUES(239,4,24,8,0,3,290,0,0,0,23.40);
INSERT INTO PlayersStats VALUES(240,5,24,0,1,8,43,0,0,0,11.93);
INSERT INTO PlayersStats VALUES(241,1,25,0,0,8,433,0,0,0,16.33);
INSERT INTO PlayersStats VALUES(242,2,25,2,1,3,243,0,0,0,10.43);
INSERT INTO PlayersStats VALUES(243,3,25,2,0,3,359,0,0,0,12.09);
INSERT INTO PlayersStats VALUES(244,4,25,4,0,3,431,0,0,0,16.81);
INSERT INTO PlayersStats VALUES(245,5,25,1,0,6,41,0,0,0,11.41);
INSERT INTO PlayersStats VALUES(246,8,25,0,0,1,356,0,0,0,5.06);
INSERT INTO PlayersStats VALUES(247,9,25,0,4,1,252,0,0,0,2.02);
INSERT INTO PlayersStats VALUES(248,10,25,0,1,1,360,0,0,0,4.60);
INSERT INTO PlayersStats VALUES(249,11,25,1,0,0,447,0,0,0,6.47);
INSERT INTO PlayersStats VALUES(250,12,25,0,4,1,42,0,0,0,-0.08);
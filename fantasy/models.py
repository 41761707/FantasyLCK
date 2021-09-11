from fantasy import db

class Player(db.Model):
	id=db.Column(db.Integer(),primary_key=True)
	team_id=db.Column(db.Integer(),db.ForeignKey('team.id'),nullable=False)
	name=db.Column(db.String(length=25),nullable=False,unique=True)
	role=db.Column(db.String(length=3),nullable=False)
	locked=db.Column(db.String(length=50))
	stats_weekly = db.relationship('PlayersStatsWeekly', backref='playersstatsweekly', lazy=True)
	stats_summary = db.relationship('PlayersStatsSummary', backref='playersstatssummary', lazy=True)

	def __repr__(self):
		return f'{self.name}'


class Team(db.Model):
	id=db.Column(db.Integer(),primary_key=True)
	name=db.Column(db.String(length=50),nullable=False,unique=True)
	shortcut=db.Column(db.String(length=3),nullable=False,unique=True)
	wins=db.Column(db.Integer(),nullable=False)
	loses=db.Column(db.Integer(),nullable=False)
	map_ratio=db.Column(db.String(length=10),nullable=False)
	matches=db.Column(db.Integer(),nullable=False)
	player=db.relationship('Player',backref='player',lazy=True)
	stats_weekly = db.relationship('TeamsStatsWeekly', backref='teamstatsweekly', lazy=True)
	stats_summary = db.relationship('TeamsStatsSummary', backref='teamssstatssummary', lazy=True)
	team1_match=db.relationship('Match',foreign_keys='Match.team1_id',backref='match_team1',lazy=True)
	team2_match=db.relationship('Match',foreign_keys='Match.team2_id',backref='match_team2',lazy=True)



	def __repr__(self):
		return f'{self.name}'

class Match(db.Model):
	id=db.Column(db.Integer(),primary_key=True)
	game_number=db.Column(db.Integer())
	team1_id=db.Column(db.Integer(),db.ForeignKey('team.id'),nullable=False)
	team1_score=db.Column(db.Integer(),nullable=False)
	team2_id=db.Column(db.Integer(),db.ForeignKey('team.id'),nullable=False)
	team2_score=db.Column(db.Integer(),nullable=False)
	week=db.Column(db.Integer(),nullable=False)
	length=db.Column(db.String(length=10),nullable=False)
	players_stats_weekly=db.relationship('PlayersStatsWeekly',backref='playersstats',lazy=True)
	teams_stats_weekly=db.relationship('TeamsStatsWeekly',backref='teamstats',lazy=True)

	def __repr__(self):
		return f'{self.id}'




class PlayersStatsWeekly(db.Model):
	__tablename__ = 'PlayersStatsWeekly'
	id=db.Column(db.Integer(),primary_key=True)
	player_id=db.Column(db.Integer(),db.ForeignKey('player.id'),nullable=False)
	match_id=db.Column(db.Integer(),db.ForeignKey('match.id'),nullable=False)
	kills=db.Column(db.Integer(),nullable=False)
	deaths=db.Column(db.Integer(),nullable=False)
	assists=db.Column(db.Integer(),nullable=False)
	creep_score=db.Column(db.Integer(),nullable=False)
	triples=db.Column(db.Integer(),nullable=False)
	quadras=db.Column(db.Integer(),nullable=False)
	pentas=db.Column(db.Integer(),nullable=False)
	length=db.Column(db.Time(),nullable=False)
	week=db.Column(db.Integer(),nullable=False)
	game=db.Column(db.Integer(),nullable=False)
	points=db.Column(db.Float(),nullable=False)

	def __repr__(self):
		return f'{self.player_id} week {self.week} game {self.game}'

class PlayersStatsSummary(db.Model):
	__tablename__ = 'PlayersStatsSummary'
	player_id=db.Column(db.Integer(),db.ForeignKey('player.id'),nullable=False,primary_key=True)
	kills=db.Column(db.Integer(),nullable=False)
	deaths=db.Column(db.Integer(),nullable=False)
	assists=db.Column(db.Integer(),nullable=False)
	creep_score=db.Column(db.Integer(),nullable=False)
	triples=db.Column(db.Integer(),nullable=False)
	quadras=db.Column(db.Integer(),nullable=False)
	pentas=db.Column(db.Integer(),nullable=False)
	points=db.Column(db.Float(),nullable=False)

	def __repr__(self):
		return f'{self.player_id}'



class TeamsStatsWeekly(db.Model):
	__tablename__ = 'TeamsStatsWeekly'
	id=db.Column(db.Integer(),primary_key=True)
	team_id=db.Column(db.Integer(),db.ForeignKey('team.id'),nullable=False)
	match_id=db.Column(db.Integer(),db.ForeignKey('match.id'),nullable=False)
	barons=db.Column(db.Integer(),nullable=False)
	dragons=db.Column(db.Integer(),nullable=False)
	first_bloods=db.Column(db.Integer(),nullable=False)
	towers=db.Column(db.Integer(),nullable=False)
	length=db.Column(db.Time(),nullable=False)
	week=db.Column(db.Integer(),nullable=False)
	game=db.Column(db.Integer(),nullable=False)
	points=db.Column(db.Float(),nullable=False)

	def __repr__(self):
		return f'{self.team_id} week {self.week} game {self.game}'

class TeamsStatsSummary(db.Model):
	__tablename__ = 'TeamsStatsSummary'
	team_id=db.Column(db.Integer(),db.ForeignKey('team.id'),nullable=False,primary_key=True)
	barons=db.Column(db.Integer(),nullable=False)
	dragons=db.Column(db.Integer(),nullable=False)
	first_bloods=db.Column(db.Integer(),nullable=False)
	towers=db.Column(db.Integer(),nullable=False)
	points=db.Column(db.Float(),nullable=False)

	def __repr__(self):
		return f'{self.team_id}'
class User(db.Model):
	__tablename__='User'
	id=db.Column(db.Integer(),primary_key=True)
	nickname=db.Column(db.String(length=30),nullable=False)
	password=db.Column(db.LargeBinary(),nullable=False)
	email=db.Column(db.String(length=50),nullable=False)
	
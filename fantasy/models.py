from fantasy import db, bcrypt, login_manager, app
#from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
import datetime
from flask_login import UserMixin


@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


class User(db.Model, UserMixin):
    __tablename__ = "User"
    id = db.Column(db.Integer(), primary_key=True)
    nickname = db.Column(db.String(length=30), nullable=False, unique=True)
    login = db.Column(db.String(20), nullable=False)
    password = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(40), nullable=False, unique=True)
    user_team_ID = db.Column(
        db.Integer(),
        db.ForeignKey('userTeam.id'),
        nullable=False,
        unique=True)
    user_league = db.Column(
        db.Integer(),
        db.ForeignKey('league.id'),
        nullable=False)

    @property
    def passw(self):
        return self.passw

    @passw.setter
    def passw(self, plain_text_password):
        self.password = bcrypt.generate_password_hash(
            plain_text_password).decode('utf-8')

    def check_passw_correction(self, attempted_password):
        return bcrypt.check_password_hash(self.password, attempted_password)

    '''def get_token(self):
		serial=Serializer(app.config['SECRET_KEY'],expires_in=360)
		return serial.dumps({'user_id':self.id}).decode('utf-8')

	@staticmethod
	def verify_token(token):
		serial=Serializer(app.config['SECRET_KEY'])
		try:
			user_id=serial.loads(token)['user_id']
		except:
			return None
		return User.query.get(int(user_id))
	'''


class UserTeam(db.Model):
    __tablename__ = "UserTeam"
    id = db.Column(db.Integer(), primary_key=True)


class UserLeague(db.Model):
    __tablename__ = "UserLeague"
    id = db.Column(db.Integer(), primary_key=True)


class Player(db.Model):
    id = db.Column(db.Integer(), primary_key=True)
    team_id = db.Column(db.Integer(), db.ForeignKey('team.id'), nullable=False)
    name = db.Column(db.String(length=25), nullable=False, unique=True)
    role = db.Column(db.String(length=3), nullable=False)
    # photo=db.Column(db.String(length=100),nullable=False)
    locked = db.Column(db.String(length=50))
    stats = db.relationship('PlayersStats', backref='playersstats', lazy=True)
    stats_weekly = db.relationship(
        'PlayersStatsWeekly',
        backref='playersstatsweekly',
        lazy=True)
    stats_summary = db.relationship(
        'PlayersStatsSummary',
        backref='playersstatssummary',
        lazy=True)

    def __repr__(self):
        return f'{self.name}'


class Team(db.Model):
    id = db.Column(db.Integer(), primary_key=True)
    name = db.Column(db.String(length=50), nullable=False, unique=True)
    shortcut = db.Column(db.String(length=3), nullable=False, unique=True)
    photo = db.Column(db.String(length=100), nullable=False)
    wins = db.Column(db.Integer(), nullable=False, default=0)
    loses = db.Column(db.Integer(), nullable=False, default=0)
    maps_won = db.Column(db.Integer(), nullable=False, default=0)
    maps_lost = db.Column(db.Integer(), nullable=False, default=0)
    matches = db.Column(db.Integer(), nullable=False, default=0)
    player = db.relationship('Player', backref='player', lazy=True)
    stats = db.relationship('TeamsStats', backref='teamstats', lazy=True)
    stats_weekly = db.relationship(
        'TeamsStatsWeekly',
        backref='teamstatsweekly',
        lazy=True)
    stats_summary = db.relationship(
        'TeamsStatsSummary',
        backref='teamstatssummary',
        lazy=True)
    team1_match = db.relationship(
        'Match',
        foreign_keys='Match.team1_id',
        backref='match_team1',
        lazy=True)
    team2_match = db.relationship(
        'Match',
        foreign_keys='Match.team2_id',
        backref='match_team2',
        lazy=True)
    game1_match = db.relationship(
        'Game',
        foreign_keys='Game.team1_id',
        backref='game_team1',
        lazy=True)
    game2_match = db.relationship(
        'Game',
        foreign_keys='Game.team2_id',
        backref='game_team2',
        lazy=True)

    def __repr__(self):
        return f'{self.name}'


class Game(db.Model):
    id = db.Column(db.Integer(), primary_key=True)
    team1_id = db.Column(
        db.Integer(),
        db.ForeignKey('team.id'),
        nullable=False)
    team1_score = db.Column(db.Integer(), nullable=False)
    team2_id = db.Column(
        db.Integer(),
        db.ForeignKey('team.id'),
        nullable=False)
    team2_score = db.Column(db.Integer(), nullable=False)
    week = db.Column(db.Integer(), nullable=False)
    game_played = db.Column(db.Boolean(), nullable=False, default=False)
    match = db.relationship('Match', backref="game", lazy=True)

    def __repr__(self):
        return f'{self.id}'


class Match(db.Model):
    id = db.Column(db.Integer(), primary_key=True)
    game_number = db.Column(db.Integer())
    game_id = db.Column(db.Integer(), db.ForeignKey('game.id'), nullable=False)
    played = db.Column(db.Boolean(), nullable=False, default=False)
    team1_id = db.Column(
        db.Integer(),
        db.ForeignKey('team.id'),
        nullable=False)
    team1_score = db.Column(db.Integer(), nullable=False)
    team2_id = db.Column(
        db.Integer(),
        db.ForeignKey('team.id'),
        nullable=False)
    team2_score = db.Column(db.Integer(), nullable=False)
    week = db.Column(db.Integer(), nullable=False)
    minutes = db.Column(db.Integer(), nullable=False, default=0)
    seconds = db.Column(db.Integer(), nullable=False, default=0)
    players_stats_weekly = db.relationship(
        'PlayersStats', backref='playersstatsmatch', lazy=True)
    teams_stats_weekly = db.relationship(
        'TeamsStats', backref='teamstatsmatch', lazy=True)

    def __repr__(self):
        return f'{self.id}'


class PlayersStats(db.Model):
    __tablename__ = 'PlayersStats'
    id = db.Column(db.Integer(), primary_key=True)
    player_id = db.Column(
        db.Integer(),
        db.ForeignKey('player.id'),
        nullable=False)
    match_id = db.Column(
        db.Integer(),
        db.ForeignKey('match.id'),
        nullable=False)
    kills = db.Column(db.Integer(), nullable=False, default=0)
    deaths = db.Column(db.Integer(), nullable=False, default=0)
    assists = db.Column(db.Integer(), nullable=False, default=0)
    creep_score = db.Column(db.Integer(), nullable=False)
    triples = db.Column(db.Integer(), nullable=False, default=0)
    quadras = db.Column(db.Integer(), nullable=False, default=0)
    pentas = db.Column(db.Integer(), nullable=False, default=0)
    points = db.Column(db.Float(), nullable=False, default=0)

    def __repr__(self):
        return f'{self.player_id} match {self.match_id}'


class PlayersStatsWeekly(db.Model):
    __tablename__ = 'PlayersStatsWeekly'
    id = db.Column(db.Integer(), primary_key=True)
    player_id = db.Column(
        db.Integer(),
        db.ForeignKey('player.id'),
        nullable=False)
    games_played = db.Column(db.Integer(), nullable=False, default=0)
    kills = db.Column(db.Integer(), nullable=False, default=0)
    deaths = db.Column(db.Integer(), nullable=False, default=0)
    assists = db.Column(db.Integer(), nullable=False, default=0)
    creep_score = db.Column(db.Float(), nullable=False)
    triples = db.Column(db.Integer(), nullable=False, default=0)
    quadras = db.Column(db.Integer(), nullable=False, default=0)
    pentas = db.Column(db.Integer(), nullable=False, default=0)
    points = db.Column(db.Float(), nullable=False, default=0)
    week = db.Column(db.Integer(), nullable=False)

    def __repr__(self):
        return f'{self.player_id} week {self.week}'


class PlayersStatsSummary(db.Model):
    __tablename__ = 'PlayersStatsSummary'
    player_id = db.Column(
        db.Integer(),
        db.ForeignKey('player.id'),
        nullable=False,
        primary_key=True)
    games_played = db.Column(db.Integer(), nullable=False, default=0)
    kills = db.Column(db.Integer(), nullable=False, default=0)
    deaths = db.Column(db.Integer(), nullable=False, default=0)
    assists = db.Column(db.Integer(), nullable=False, default=0)
    creep_score = db.Column(db.Float(), nullable=False)
    triples = db.Column(db.Integer(), nullable=False, default=0)
    quadras = db.Column(db.Integer(), nullable=False, default=0)
    pentas = db.Column(db.Integer(), nullable=False, default=0)
    points = db.Column(db.Float(), nullable=False, default=0)

    def __repr__(self):
        return f'{self.player_id}'


class TeamsStats(db.Model):
    __tablename__ = 'TeamsStats'
    id = db.Column(db.Integer(), primary_key=True)
    team_id = db.Column(db.Integer(), db.ForeignKey('team.id'), nullable=False)
    match_id = db.Column(
        db.Integer(),
        db.ForeignKey('match.id'),
        nullable=False)
    barons = db.Column(db.Integer(), nullable=False, default=0)
    dragons = db.Column(db.Integer(), nullable=False, default=0)
    first_bloods = db.Column(db.Integer(), nullable=False, default=0)
    towers = db.Column(db.Integer(), nullable=False, default=0)
    points = db.Column(db.Float(), nullable=False, default=0)

    def __repr__(self):
        return f'{self.team_id} match {self.match_id}'


class TeamsStatsWeekly(db.Model):
    __tablename__ = 'TeamsStatsWeekly'
    id = db.Column(db.Integer(), primary_key=True)
    team_id = db.Column(
        db.Integer(),
        db.ForeignKey('team.id'),
        nullable=False,
        primary_key=True)
    games_played = db.Column(db.Integer(), nullable=False, default=0)
    barons = db.Column(db.Integer(), nullable=False, default=0)
    dragons = db.Column(db.Integer(), nullable=False, default=0)
    first_bloods = db.Column(db.Integer(), nullable=False, default=0)
    towers = db.Column(db.Integer(), nullable=False, default=0)
    points = db.Column(db.Float(), nullable=False, default=0)
    week = db.Column(db.Integer(), nullable=False)

    def __repr__(self):
        return f'{self.team_id} week {self.week}'


class TeamsStatsSummary(db.Model):
    __tablename__ = 'TeamsStatsSummary'
    team_id = db.Column(
        db.Integer(),
        db.ForeignKey('team.id'),
        nullable=False,
        primary_key=True)
    games_played = db.Column(db.Integer(), nullable=False, default=0)
    barons = db.Column(db.Integer(), nullable=False, default=0)
    dragons = db.Column(db.Integer(), nullable=False, default=0)
    first_bloods = db.Column(db.Integer(), nullable=False, default=0)
    towers = db.Column(db.Integer(), nullable=False, default=0)
    points = db.Column(db.Float(), nullable=False, default=0)

    def __repr__(self):
        return f'{self.team_id}'


class Article(db.Model):
    __tablename__ = "Article"
    id = db.Column(db.Integer(), primary_key=True)
    author = db.Column(db.String(length=30), nullable=False)
    content = db.Column(db.String(), nullable=False)

from fantasy import app,conn,db
from flask import render_template,abort
from sqlalchemy.orm import aliased
from sqlalchemy import desc
from sqlalchemy.sql import func
from fantasy.models import Player,PlayersStatsWeekly,PlayersStatsSummary,Match,Team,Game

@app.route('/index/')
@app.route('/')
def home_page():
	T1=aliased(Team)
	T2=aliased(Team)
	latest_games=db.session.query(Game.id,Game.team1_id,Game.team1_score,Game.team2_id,Game.team2_score,Game.game_played,T1.photo.label("photo1"),T2.photo.label("photo2")).join(T1,T1.id==Game.team1_id).join(T2,T2.id==Game.team2_id).filter(Game.game_played==True).order_by(Game.id.desc()).limit(3).all()
	upcoming_games=db.session.query(Game.id,Game.team1_id,Game.team1_score,Game.team2_id,Game.team2_score,Game.game_played,T1.photo.label("photo1"),T2.photo.label("photo2")).join(T1,T1.id==Game.team1_id).join(T2,T2.id==Game.team2_id).filter(Game.game_played==False).order_by(Game.id).limit(3).all()
	team_of_the_week=[]
	best_top=db.session.query((PlayersStatsWeekly.points/PlayersStatsWeekly.games_played).label("score"),PlayersStatsWeekly.player_id,Player.id,Player.name,Player.role,Player.team_id,Team.id,Team.shortcut).join(Player,PlayersStatsWeekly.player_id==Player.id).join(Team,Player.team_id==Team.id).filter(Player.role=="TOP").filter(PlayersStatsWeekly.week==1).order_by(desc("score")).first()
	best_jng=db.session.query((PlayersStatsWeekly.points/PlayersStatsWeekly.games_played).label("score"),PlayersStatsWeekly.player_id,Player.id,Player.name,Player.role,Player.team_id,Team.id,Team.shortcut).join(Player,PlayersStatsWeekly.player_id==Player.id).join(Team,Player.team_id==Team.id).filter(Player.role=="JNG").filter(PlayersStatsWeekly.week==1).order_by(desc("score")).first()
	best_mid=db.session.query((PlayersStatsWeekly.points/PlayersStatsWeekly.games_played).label("score"),PlayersStatsWeekly.player_id,Player.id,Player.name,Player.role,Player.team_id,Team.id,Team.shortcut).join(Player,PlayersStatsWeekly.player_id==Player.id).join(Team,Player.team_id==Team.id).filter(Player.role=="MID").filter(PlayersStatsWeekly.week==1).order_by(desc("score")).first()
	best_adc=db.session.query((PlayersStatsWeekly.points/PlayersStatsWeekly.games_played).label("score"),PlayersStatsWeekly.player_id,Player.id,Player.name,Player.role,Player.team_id,Team.id,Team.shortcut).join(Player,PlayersStatsWeekly.player_id==Player.id).join(Team,Player.team_id==Team.id).filter(Player.role=="ADC").filter(PlayersStatsWeekly.week==1).order_by(desc("score")).first()
	best_sup=db.session.query((PlayersStatsWeekly.points/PlayersStatsWeekly.games_played).label("score"),PlayersStatsWeekly.player_id,Player.id,Player.name,Player.role,Player.team_id,Team.id,Team.shortcut).join(Player,PlayersStatsWeekly.player_id==Player.id).join(Team,Player.team_id==Team.id).filter(Player.role=="SUP").filter(PlayersStatsWeekly.week==1).order_by(desc("score")).first()
	team_of_the_week.append(best_top)
	team_of_the_week.append(best_jng)
	team_of_the_week.append(best_mid)
	team_of_the_week.append(best_adc)
	team_of_the_week.append(best_sup)
	highest_kills=db.session.query(func.sum(PlayersStatsWeekly.kills).label("N_O_kills"),PlayersStatsWeekly.player_id,Player.id,Player.name,Player.role,Player.team_id,Team.id,Team.photo).join(Player,PlayersStatsWeekly.player_id==Player.id).join(Team,Player.team_id==Team.id).group_by(Player.id).order_by(desc("N_O_kills")).limit(3).all()
	highest_deaths=db.session.query(func.sum(PlayersStatsWeekly.deaths).label("N_O_deaths"),PlayersStatsWeekly.player_id,Player.id,Player.name,Player.role,Player.team_id,Team.id,Team.shortcut).join(Player,PlayersStatsWeekly.player_id==Player.id).join(Team,Player.team_id==Team.id).group_by(Player.id).order_by(desc("N_O_deaths")).limit(3).all()
	highest_assists=db.session.query(func.sum(PlayersStatsWeekly.assists).label("N_O_assists"),PlayersStatsWeekly.player_id,Player.id,Player.name,Player.role,Player.team_id,Team.id,Team.shortcut).join(Player,PlayersStatsWeekly.player_id==Player.id).join(Team,Player.team_id==Team.id).group_by(Player.id).order_by(desc("N_O_assists")).limit(3).all()
	highest_creep_score=db.session.query(func.sum(PlayersStatsWeekly.creep_score).label("N_O_creeps"),PlayersStatsWeekly.player_id,Player.id,Player.name,Player.role,Player.team_id,Team.id,Team.shortcut).join(Player,PlayersStatsWeekly.player_id==Player.id).join(Team,Player.team_id==Team.id).group_by(Player.id).order_by(desc("N_O_creeps")).limit(3).all()
	print(highest_creep_score)
	return render_template('base.html',
		latest_games=latest_games,
		upcoming_games=upcoming_games,
		team_of_the_week=team_of_the_week,
		highest_kills=highest_kills,
		highest_deaths=highest_deaths,
		highest_assists=highest_assists,
		highest_creep_score=highest_creep_score)


@app.route('/news')
def news_page():
	return render_template('news.html')

@app.route('/table')
def table_page():
	teams=Team.query.order_by(Team.wins.desc(),Team.maps_won.desc());
	return render_template('table.html',teams=teams)

@app.route('/players')
def players_page():
	players=Player.query.all()
	stats_weekly=PlayersStatsWeekly.query.all()
	stats_summary=PlayersStatsSummary.query.all()
	teams=Team.query.all()
	return render_template('players.html',
		players=players,
		stats_summary=stats_summary,
		stats_weekly=stats_weekly,
		teams=teams)

@app.route('/schedule')
def schedule_page():
	T1=aliased(Team)
	T2=aliased(Team)

	games=db.session.query(Game.id,Game.team1_id,Game.team1_score,Game.team2_id,Game.team2_score,Game.week,Game.game_played,T1.shortcut.label("shortcut1"),T1.photo.label("photo1"),T2.shortcut.label("shortcut2"),T2.photo.label("photo2")).join(T1,T1.id==Game.team1_id).join(T2,T2.id==Game.team2_id)
	return render_template('schedule.html',games=games)

@app.route('/matches')
def matches_page():
	return render_template('matches.html')

@app.route('/how')
def how_page():
	return render_template('how.html')

@app.route('/about')
def about_page():
	return render_template('about.html')

@app.route('/teams')
def teams_page():
	return render_template('teams.html')


@app.route('/teams/<team>')
def given_team_page(team):
	t=Team.query.filter(Team.name==team).first()
	if t is not None:
		players=Player.query.filter(Player.team_id==t.id).all()
		return render_template(f"teams/{team}.html",team=t,players=players)
	else:
		abort(404)

@app.route('/players/<player>')
def given_player_page(player):
	p=Player.query.filter(Player.name==player).first()
	if p is not None:
		return render_template('player.html',player=p)
	else:
		abort(404)
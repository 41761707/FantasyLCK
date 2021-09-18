from fantasy import app,conn,db
from flask import render_template,abort
from sqlalchemy.orm import aliased
from fantasy.models import Player,PlayersStatsWeekly,PlayersStatsSummary,Match,Team,Game

@app.route('/index/')
@app.route('/')
def home_page():
	return render_template('base.html')


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

	games=db.session.query(Game.id,Game.team1_id,Game.team1_score,Game.team2_id,Game.team2_score,Game.week,T1.shortcut.label("shortcut1"),T1.photo.label("photo1"),T2.shortcut.label("shortcut2"),T2.photo.label("photo2")).join(T1,T1.id==Game.team1_id).join(T2,T2.id==Game.team2_id)
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
	return render_template('base.html')
from fantasy import app
from flask import render_template
from fantasy.models import Player,PlayersStatsWeekly,PlayersStatsSummary,Match,Team

@app.route('/index/')
@app.route('/')
def home_page():
	return render_template('base.html')


@app.route('/news')
def news_page():
	return render_template('news.html')

@app.route('/table')
def table_page():
	return render_template('table.html')

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
	return render_template('schedule.html')

@app.route('/matches')
def matches_page():
	return render_template('matches.html')

@app.route('/how')
def how_page():
	return render_template('how.html')

@app.route('/about')
def about_page():
	return render_template('about.html')
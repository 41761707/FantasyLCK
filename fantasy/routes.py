from fantasy import app,conn,db, mail
from flask import render_template,abort, redirect,url_for,flash
from fantasy.forms import RegisterForm, LoginForm, RecoverForm
from sqlalchemy.orm import aliased
from sqlalchemy import desc
from sqlalchemy.sql import func
from fantasy.models import Player,PlayersStatsWeekly,PlayersStatsSummary,Match,Team,Game,User, UserTeam, UserLeague
from flask_login import login_user, logout_user, login_required, current_user
from flask_mail import Message
import datetime

session={}

def send_mail(user):
	token=user.get_token()
	msg=Message('Resetowanie hasła',recipients=[user.email],sender="raggioconivalli@gmail.com")
	msg.body=f'''
		Aby zresetować hasło naciśnij poniższy link:
		{url_for('reset_page',token=token,_external=True)}
		W przeciwnym razie zignoruj wiadomość
	'''
	mail.send(msg)
	print("Wyslalem wiadomosc")

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
	highest_triple_score=db.session.query(func.sum(PlayersStatsWeekly.triples).label("N_O_triples"),PlayersStatsWeekly.player_id,Player.id,Player.name,Player.role,Player.team_id,Team.id,Team.shortcut).join(Player,PlayersStatsWeekly.player_id==Player.id).join(Team,Player.team_id==Team.id).group_by(Player.id).order_by(desc("N_O_triples")).limit(3).all()
	highest_quadra_score=db.session.query(func.sum(PlayersStatsWeekly.quadras).label("N_O_quadras"),PlayersStatsWeekly.player_id,Player.id,Player.name,Player.role,Player.team_id,Team.id,Team.shortcut).join(Player,PlayersStatsWeekly.player_id==Player.id).join(Team,Player.team_id==Team.id).group_by(Player.id).order_by(desc("N_O_quadras")).limit(3).all()
	for player in highest_triple_score:
		print(player.name)
		print(player.N_O_triples)
	return render_template('base.html',
		latest_games=latest_games,
		upcoming_games=upcoming_games,
		team_of_the_week=team_of_the_week,
		highest_kills=highest_kills,
		highest_deaths=highest_deaths,
		highest_assists=highest_assists,
		highest_creep_score=highest_creep_score,
		highest_triple_score=highest_triple_score,
		highest_quadra_score=highest_quadra_score)


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

@app.route('/login',methods=['GET','POST'])
def login_page():
	if current_user.is_authenticated:
		return redirect(url_for('home_page'))
	form=LoginForm()
	if form.validate_on_submit():
		requested_user=User.query.filter_by(login=form.login.data).first()
		if requested_user and requested_user.check_passw_correction(form.password.data):
			login_user(requested_user)
			flash('Udało Ci się zalogować na konto o nazwie: {}'.format(requested_user.login), category='success')
			return redirect(url_for('home_page'))
		else:
			flash('Logowanie nie powiodło się. Spróbuj ponownie',category='danger')
	if form.errors != {}:
		for err_msg in form.errors.values():
			flash('Logowanie nie powiodło się, powód: {}'.format(err_msg),category='danger')
	return render_template('login.html',form=form)

@app.route('/signUp',methods=['GET','POST'])
def signup_page():
	if current_user.is_authenticated:
		return redirect(url_for('home_page'))
	form=RegisterForm()
	if form.validate_on_submit():
		query=db.session.query(User.id).all()
		print(query)
		if query == []:
			max_id=0
		else:
			max_id=int(query[-1][0])
		new_acc_number=max_id+1
		acc_number=str(new_acc_number).zfill(8)
		user_to_create=User(account_number=acc_number,login=form.login.data,email=form.email.data,passw=form.password1.data,savings=0)
		db.session.add(user_to_create)
		db.session.commit()
		login_user(user_to_create)
		flash('Zakładanie konta ukończone powodzeniem, jesteś zalogowany jako:{}'.format(user_to_create.login), category='success')
		return redirect(url_for('home_page'))
	if form.errors != {}:
		for err_msg in form.errors.values():
			flash('Utworzenie użytkownika nie powiodło się, powód: {}'.format(err_msg),category='danger')
	return render_template('signup.html',form=form)

@app.route('/logout')
@login_required
def logout_page():
	logout_user()
	flash("Pomyślnie wylogowano!",category="info")
	return redirect(url_for('home_page'))

@app.route('/restore',methods=["GET", "POST"])
def restore_page():
	if current_user.is_authenticated:
		return redirect(url_for('home_page'))
	form = RecoverForm()
	if form.validate_on_submit():
		user = User.query.filter_by(email=form.email.data).first()
		if user:
			send_mail(user)
		flash('Informacje o resetowaniu hasła zostały przesłane na wprowadzony adres e-mail',category='success')
		return redirect(url_for('home_page'))
	if form.errors != {}:
		for err_msg in form.errors.values():
			flash('Wysłanie wiadomości z odzyskaniem hasła nie powiodła się, powód: {}'.format(err_msg),category='danger')

	return render_template('restore.html',form=form)
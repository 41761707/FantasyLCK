from flask import Flask,render_template
app=Flask(__name__)


@app.route('/index')
@app.route('/')
def hello_world():
	return render_template('base.html')
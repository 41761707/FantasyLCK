from flask import Flask,render_template
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine, MetaData
app=Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI']='sqlite:///database.db'
db=SQLAlchemy(app)
engine = create_engine('sqlite:///database.db', echo = True)
meta = MetaData()

conn = engine.connect()

from fantasy import routes
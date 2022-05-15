from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, IntegerField, DateField
from wtforms.validators import Length, EqualTo, Email, DataRequired, ValidationError
from fantasy.models import User


class RegisterForm(FlaskForm):

    def validate_login(self, user_to_check):
        user = User.query.filter_by(login=user_to_check.data).first()
        if user:
            raise ValidationError('Użytkownik z takim loginem już istnieje')
        for letter in user_to_check.data:
            if letter.isalnum() == False:
                raise ValidationError('Niedozowlone znaki w loginie')

    def validate_email(self, email_to_check):
        email = User.query.filter_by(email=email_to_check.data).first()
        if email:
            raise ValidationError(
                'Użytkownik z takim adresem e-mail już istnieje')
        for letter in email_to_check.data:
            if letter.isalnum() == False:
                if letter in ['@', '-', '_', '.']:
                    pass
                else:
                    raise ValidationError(
                        'Niedozowlone znaki w adresie e-mail')

    login = StringField(
        label='Login: ',
        validators=[
            Length(
                min=6,
                max=20),
            DataRequired()])
    email = StringField(
        label='Adres E-mail:',
        validators=[
            Email(
                message="Nieprawidłowy adres e-mail",
                check_deliverability=True),
            DataRequired()])
    password1 = PasswordField(
        label='Hasło: ',
        validators=[
            Length(
                min=8),
            DataRequired()])
    password2 = PasswordField(
        label='Powtórz Hasło:',
        validators=[
            EqualTo(
                'password1',
                message="Niezgodność haseł"),
            DataRequired()])
    submit = SubmitField(label='Zarejestruj')


class LoginForm(FlaskForm):
    def validate_login(self, user_to_check):
        for letter in user_to_check.data:
            if letter.isalnum() == False:
                raise ValidationError('Niedozowlone znaki w loginie')

    login = StringField(
        label="Login: ", validators=[
            DataRequired(), Length(
                min=6, max=20)])
    password = PasswordField(
        label="Password: ",
        validators=[
            DataRequired(),
            Length(
                min=8)])
    submit = SubmitField(label='Zaloguj')


class RecoverForm(FlaskForm):
    def validate_email(self, email_to_check):
        for letter in email_to_check.data:
            if letter.isalnum() == False:
                if letter == '@' or letter == '.':
                    pass
                else:
                    raise ValidationError(
                        'Niedozowlone znaki w adresie e-mail')

    email = StringField(
        label='Adres E-mail:',
        validators=[
            Email(
                message="Niepoprawny adres e-mail",
                check_deliverability=True),
            DataRequired()])
    submit = SubmitField(label='Przypomnij hasło')


'''class RecoverForm(FlaskForm):
	def validate_email(self,email_to_check):
		for letter in email_to_check.data:
			if letter.isalnum()==False:
				if letter=='@' or letter=='.':
					pass
				else:
					raise ValidationError('Niedozowlone znaki w adresie e-mail')



	email=StringField(label='Adres E-mail:',validators=[Email(message="Niepoprawny adres e-mail",check_deliverability=True),DataRequired()])
	submit=SubmitField(label='Przypomnij hasło')'''

'''class PasswordChangeForm(FlaskForm):
	password1=PasswordField(label='Hasło: ',validators=[Length(min=8),DataRequired()])
	password2=PasswordField(label='Powtórz Hasło:',validators=[EqualTo('password1'),DataRequired()])
	submit=SubmitField(label='Reset')
'''

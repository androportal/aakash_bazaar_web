import os
from bottle import *
from bottle_mysql import *

app = Bottle()
#Install MySQL plugin
plugin = Plugin(dbuser='root', dbpass='asd', dbname='bazaar')
app.install(plugin)

#Global Variables
key = 'tm4k$8Dnb1mG!K$'
#Serve the static files
@app.route('/static/<filepath:path>')
def server_file(filepath):
	return static_file(filepath, root='./static')

@app.route('/')
def HomePage():
	if not user():
		if device() == "mobile":
			return template('./static/mobile/index.tpl')
		else:
			return template('./static/index.tpl')
	else:
		if device() == "mobile":
			return template('./static/mobile/dashboard.tpl')
		else:
			redirect('/dashboard')

@app.route('/about')
def About():
	if not user():
		return template('./static/about.tpl')
	else:
		redirect('/dashboard')
		
@app.route('/contact')
def Contact():
	if not user():
		return template('./static/contact.tpl')
	else:
		redirect('/dashboard')



###############################################################################
#####     Login Section     ###################################################
###############################################################################

@app.get('/login')
def login_form():
	if not user():
		msg = request.query.getall('msg')
		if not msg:
			msg = None
		else:	
			if msg[0] == 'xlog':
				msg = 'Wrong username or password.'
			else:
				msg = None
		template_values = {
			'message': msg
		}
		return template('./static/login.tpl',template_values)
	else:
		redirect('/dashboard')

@app.post('/login')
def login_submit(db):
	email = request.forms.get('email')
	password = request.forms.get('password')
	
	db.execute('SELECT *,COUNT(*) FROM BazaarUsers WHERE email=%s  AND password=%s', (email,password))
	row = db.fetchone()
	if row['COUNT(*)'] == 1:
		cookie = request.get_cookie('AakashBazaar',secret='tm4k$8Dnb1mG!K$')
		if cookie == email:
			redirect('/dashboard')
		else:
			response.set_cookie('AakashBazaar',email,secret=key)
			redirect('/dashboard')
	else:
		redirect('/login?msg=xlog')



###############################################################################
#####     Register Section     ################################################
###############################################################################
@app.get('/register')
def register_form():
	if not user():
		message = request.query.getall('msg')
		template_values={
			'message': message
		}
		return template('./static/register.tpl',template_values)
	else:
		redirect('/dashboard')

@app.post('/register')
def register_submit(db):
	first_name = request.forms.get('first_name')
	last_name = request.forms.get('last_name')
	email = request.forms.get('reg_email')
	password = request.forms.get('reg_password')
	#check whether user exists
	db.execute('SELECT *,COUNT(*) FROM BazaarUsers WHERE email=%s',(email))
	row = db.fetchone()
	if row['COUNT(*)'] != 0:
		redirect('/register?msg=exist')
	else:
		db.execute('INSERT INTO BazaarUsers (first_name, last_name, email, password) VALUES (%s,%s,%s,%s)',(first_name,last_name,email,password))
	response.set_cookie('AakashBazaar',email,secret=key)
	redirect('/')



###############################################################################
#####     Upload Section      #################################################
###############################################################################
@app.get('/upload')
def register_form():
	if user():
		return template('./static/upload.tpl')
	else:
		redirect('/')

@app.post('/upload')
def upload_submit(db):
	# Text Data
	if user():
		package_name = request.forms.get('package_name')
		apk_name = request.forms.get('apk_name')
		category = request.forms.get('category')
		license = request.forms.get('license')
		website = request.forms.get('website')
		source = request.forms.get('source_code')
		issue = request.forms.get('issue_tracker')
		summary = request.forms.get('summary')
		description = request.forms.get('description')
		changelog = request.forms.get('changelog')
	
		#Files
		screenshot1 = request.files.get('screenshot1')
		screenshot2 = request.files.get('screenshot2')
		screenshot3 = request.files.get('screenshot3')
		apk = request.files.get('apk')

		#Creating directory(package_name) and dumping contents
		save_path = '/tmp/{folder}'.format(folder=package_name)
		os.makedirs(save_path)
	
		txt_file = save_path+'/'+package_name+'.txt'
		fptr = open(txt_file,'w')
		fptr.write('Category: %s\n' %(category))
		fptr.write('Licence: %s\n' %(license))
		fptr.write('Web Site: %s\n' %(website))
		fptr.write('Source Code: %s\n' %(source))
		fptr.write('Issue Tracker: %s\n\n' %(issue))
		fptr.write('Summary: %s\n\n' %(summary.replace('<br>','\n')))
		fptr.write('Description: %s\n\n' %(description.replace('<br>','\n')))
		fptr.write('Changelog: %s\n.\n\nUpdate Check Mode:Market' %(changelog))
		fptr.close()
		
		file_path=save_path+'/'
		#Saving screenshots
		if screenshot1:
			name, ext = os.path.splitext(screenshot1.filename)
			screenshot1.save(file_path+package_name+'.1'+ext)
		if screenshot2:
			name, ext = os.path.splitext(screenshot2.filename)
			screenshot2.save(file_path+package_name+'.2'+ext)
		if screenshot3:
			name, ext = os.path.splitext(screenshot3.filename)
			screenshot3.save(file_path+package_name+'.3'+ext)
		#Saving APK
		if apk:
			apk.save(file_path+apk.filename)
		# Updating AppData Table
		db.execute('INSERT INTO AppData (email,package,apk,category) VALUES (%s,%s,%s,%s)', (user(),package_name,apk_name,category))
		redirect('/dashboard?msg=up')
	else:
		redirect('/')
#checking if package name exists
@app.get('/check')
def Check(db):
	package_name = request.query.getall('package_name')
	if package_name:
		package_name = package_name[0]
	#return str(package_name)
	db.execute("SELECT COUNT(*) FROM AppData WHERE package=%s", (package_name))
	row = db.fetchone()
	if row['COUNT(*)']:
		return 'exists'
	else:
		return 'valid'



###############################################################################
#####     User Section      ###################################################
###############################################################################
def user():
	user = request.get_cookie('AakashBazaar',secret=key)
	return user

@app.route('/logout')
def logout():
	response.delete_cookie('AakashBazaar')
	redirect('/')

@app.get('/profile')
def profile_form(db):
	if user():
		message = request.query.getall('msg')
		if not message:
			message = None
		else:
			message = message[0]
		email = user()
		db.execute("SELECT * FROM BazaarUsers WHERE email=%s",(email))
		row = db.fetchone()
		template_values={
			'first_name': row['first_name'],
			'last_name': row['last_name'],
			'email': row['email'],
			'password':row['password'],
			'message': message
		}
		return template('./static/profile.tpl',template_values)
	else:
		redirect('/')

@app.post('/profile')
def profile_submit(db):
	if user():
		email = user()
		first_name = request.forms.get('first_name')
		last_name = request.forms.get('last_name')
		e_mail = request.forms.get('email')
		password = request.forms.get('password')
		new_password = request.forms.get('new_password')
		re_new_password = request.forms.get('re_new_password')
		
		#Updating user data
		db.execute("UPDATE BazaarUsers SET first_name=%s, last_name=%s, email=%s, password=%s WHERE email=%s",(first_name, last_name, e_mail, password, email))
		
		#Updating password if changed
		if new_password and new_password == re_new_password:
			db.execute("UPDATE BazaarUsers SET password=%s WHERE email=%s",(new_password,e_mail))
		
		#Updating cookie value and AppData(db) on email change
		if e_mail != email:
			db.execute("UPDATE AppData SET email=%s WHERE email=%s", (e_mail,email))
			response.set_cookie('AakashBazaar',e_mail,secret=key)
		redirect('/profile?msg=done')
	else:
		redirect('/')



###############################################################################
#####     User Dashboard     ##################################################
###############################################################################
@app.get('/dashboard')
def Dashboard(db):
	if user() and device() == 'desktop':
		#Fetching get-msg
		message = request.query.getall('msg')
		if not message:
			message=None
		else:
			message = message[0]
		#Fetching count of user-apps
		db.execute("SELECT COUNT(*) FROM AppData WHERE email=%s", (user()))
		row = db.fetchone()
		package = []
		apk = []
		category = []
		count = row['COUNT(*)']
		if count >0:
			db.execute("SELECT * FROM AppData WHERE email=%s", (user()))
			rows = db.fetchall()
			for row in rows:
				package.append(row['package'])
				apk.append(row['apk'])
				category.append(row['category'])
		template_values = {
			'count': count,
			'package': package,
			'apk': apk,
			'category': category,
			'message': message
		}
		return template('./static/dashboard.tpl',template_values)
	elif user() and device() == 'mobile':
		return template('./static/mobile/dashboard.tpl')
	else:
		redirect('/')



###############################################################################
#####     User Agent Detection     ############################################
###############################################################################
def device():
	agent = request.environ.get('HTTP_USER_AGENT')
	if "mobile" in agent.lower():
		return "mobile"
	else:
		return "desktop"

@app.route('/test')
def Test():
	return template('./static/mobile/index.tpl')

run(app, host='10.101.201.141', port=8080, debug=True)

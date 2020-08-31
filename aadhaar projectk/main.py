from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail
import random
from news import l, k, d

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config.update(MAIL_SERVER='smtp.gmail.com',
                  MAIL_PORT='465',
                  MAIL_USE_SSL=True,
                  MAIL_USERNAME="projectcs257@gmail.com",
                  MAIL_PASSWORD="cs257proj")

mail = Mail(app)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/aadhar'
db = SQLAlchemy(app)


class Citizen(db.Model):
    aadhar_no = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(25), nullable=False)
    phone_no = db.Column(db.Integer, nullable=False)
    address = db.Column(db.String(80), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(40), nullable=False)


class Passport(db.Model):
    aadhar_no = db.Column(db.Integer, primary_key=True)
    tripto = db.Column(db.String(25), nullable=True)
    dod = db.Column(db.String(12), nullable=True)
    doa = db.Column(db.String(12), nullable=True)
    approval = db.Column(db.String(10), nullable=True)


class Visa(db.Model):
    aadhar_no = db.Column(db.Integer, primary_key=True)
    tripto = db.Column(db.String(25), nullable=True)
    dod = db.Column(db.String(12), nullable=True)
    doa = db.Column(db.String(12), nullable=True)
    approval = db.Column(db.String(10), nullable=True)


class Death_record(db.Model):
    aadhar_no = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(25), nullable=False)
    phone_no = db.Column(db.Integer, nullable=False)
    address = db.Column(db.String(80), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    dateofreg = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(40), nullable=False)


class Admin(db.Model):
    aadhar_no = db.Column(db.Integer, primary_key=True)
    password = db.Column(db.String(12), nullable=False)
    date = db.Column(db.String(12), nullable=True)


class Status(db.Model):
    aadhar_no = db.Column(db.Integer, primary_key=True)
    stat = db.Column(db.String(15), nullable=True)
    # date = db.Column(db.String(12), nullable=True)


class News(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=True)
    description = db.Column(db.String(150), nullable=True)
    content = db.Column(db.String(1000), nullable=True)
    date = db.Column(db.String(12), nullable=True)


@app.route("/")
def home():
    obj = News.query.all()
    obj_list = []

    for items in obj:
        a = ((str(datetime.now() - items.date).split(":"))[0])
        if int(a[-2:]) >= 12 or len(a) > 2:
            datas = News.query.filter_by(sno=items.sno).first()
            db.session.delete(datas)
            db.session.commit()
        obj_list.append(items.title)
    geti = []
    i = 0
    for item in l:
        if item not in obj_list:
            geti.append(i)
        i += 1
    for it in geti:
        title = l[it]
        description = d[it]
        content = k[it]
        entry = News(title=title, description=description, content=content)
        db.session.add(entry)
        db.session.commit()
    return render_template('index.html', tt=obj)


@app.route("/citizen")
def citizen():
    data = Citizen.query.all()
    return render_template('citizen.html', datas=data)


@app.route("/post/<string:kkk>")
def Post(kkk):
    obj=datas = News.query.filter_by(sno=kkk).first()
    return render_template('post.html', obj=obj)


@app.route("/death")
def death():
    data = Death_record.query.all()
    return render_template('death.html', datas=data)


@app.route("/visa")
def visa():
    data = Visa.query.all()
    return render_template('visa.html', datas=data)


@app.route("/dl")
def dl():
    data = News.query.all()
    return render_template('dl.html', datas=data)


@app.route("/passport/<string:aadhar_no>")
def passport(aadhar_no):
    data = Passport.query.filter_by(aadhar_no=aadhar_no)
    return render_template('passport.html', datas=data, aadhar_no=aadhar_no)


@app.route("/status/<string:aadhar_no>")
def status(aadhar_no):
    data = Status.query.filter_by(aadhar_no=aadhar_no).first()
    return render_template('status.html', data=data)


@app.route("/apply/<string:aadhar_no>", methods=['GET', 'POST'])
def apply(aadhar_no):
    if request.method == 'POST':
        tripto = request.form.get('place')
        dod = request.form.get('dod')
        doa = request.form.get('doa')
        entry = Visa(aadhar_no=aadhar_no, tripto=tripto, dod=dod, doa=doa, approval='under view')
        kk = Visa.query.all()
        r = 0
        for items in kk:
            if aadhar_no == items.aadhar_no:
                r += 1
                return render_template('apply.html', aadhar_no=aadhar_no)
        if r == 0:
            db.session.add(entry)
            db.session.commit()
            return render_template("login.html")

    return render_template('apply.html', aadhar_no=aadhar_no)


@app.route("/delete/<string:aadhar_no>")
def delete(aadhar_no):
    datas = Citizen.query.filter_by(aadhar_no=aadhar_no).first()
    db.session.delete(datas)
    db.session.commit()
    # return render_template('citizen.html', datas=data)
    return render_template('staff.html')


@app.route("/editvisa/<string:aadhar_no>", methods=['GET', 'POST'])
def editvisa(aadhar_no):
    if request.method == 'POST':
        u_u = request.form.get('statusedit')
        data = Visa.query.filter_by(aadhar_no=aadhar_no).first()
        data.approval = u_u
        db.session.commit()
        return render_template('staff.html')
    return render_template('editvisa.html', aadhar_no=aadhar_no)


@app.route("/deletenews/<string:sno>")
def deletenews(sno):
    datas = News.query.filter_by(sno=sno).first()
    db.session.delete(datas)
    db.session.commit()
    return render_template('staff.html')


@app.route("/stafflogin", methods=['GET', 'POST'])
def stafflogin():
    if request.method == 'POST':
        sid = request.form.get('username')
        pwdd = (request.form.get('password')).strip()
        if sid == 'AADHAAR_STAFF' and pwdd == 'myaadhaarmypride':
            session['staff'] = sid
            return render_template('staff.html')
    return render_template('stafflogin.html')


@app.route("/editphone", methods=['GET', 'POST'])
def phone_edit():
    if request.method == 'POST':
        u_name = request.form.get('username')
        pwd = (request.form.get('password')).strip()
        npn = request.form.get('new_phone')
        # print(u_name,pwd,npn)
        admin_name = db.session.query(Admin).order_by(Admin.aadhar_no)
        for items in admin_name:
            if items.aadhar_no == int(u_name) and items.password == pwd:
                jj = db.session.query(Citizen).order_by(Citizen.aadhar_no)
                session['user'] = items.aadhar_no
                for data in jj:
                    if data.aadhar_no == int(u_name):
                        # print(data)
                        data.phone_no = npn
                        db.session.commit()
                        return redirect('/login')
    # print("yes")
    return render_template("editphone.html")


@app.route("/editpass", methods=['GET', 'POST'])
def pass_edit():
    if request.method == 'POST':
        u_name = request.form.get('username')
        pwd = (request.form.get('password')).strip()
        npd = request.form.get('new_pass')
        admin_name = db.session.query(Admin).order_by(Admin.aadhar_no)
        for items in admin_name:
            if items.aadhar_no == int(u_name) and items.password == pwd:
                session['user'] = items.aadhar_no
                items.password = npd
                db.session.commit()
                return redirect('/login')
    return render_template("editpass.html")


@app.route("/editaddress", methods=['GET', 'POST'])
def address_edit():
    if request.method == 'POST':
        u_name = request.form.get('username')
        pwd = (request.form.get('password')).strip()
        nad = request.form.get('new_address')
        admin_name = db.session.query(Admin).order_by(Admin.aadhar_no)
        for items in admin_name:
            if items.aadhar_no == int(u_name) and items.password == pwd:
                jj = db.session.query(Citizen).order_by(Citizen.aadhar_no)
                session['user'] = items.aadhar_no
                for data in jj:
                    if data.aadhar_no == int(u_name):
                        data.address = nad
                        db.session.commit()
                        return redirect('login.html')
    return render_template("editaddress.html")


@app.route("/about")
def about():
    return render_template('about.html')


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/')


@app.route("/logoutstaff")
def logoutstaff():
    session.pop('staff')
    return redirect('/')


@app.route("/login", methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        u_name = request.form.get('username')
        pwd = (request.form.get('password')).strip()
        admin_name = db.session.query(Admin).order_by(Admin.aadhar_no)
        for items in admin_name:
            if items.aadhar_no == int(u_name) and items.password == pwd:
                jj = db.session.query(Citizen).order_by(Citizen.aadhar_no)
                session['user'] = items.aadhar_no
                for data in jj:
                    if data.aadhar_no == int(u_name):
                        # print(data)
                        return render_template('dashboard.html', variable=items, data=data)
    return render_template('login.html')


@app.route("/signup", methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        '''Add entry to the database'''
        a = int((random.random()) * (10 ** 8))
        name = (request.form.get('name')).lower()
        email = request.form.get('email')
        phone_no = request.form.get('phone_no')
        address = request.form.get('address')
        entry = Citizen(name=name, phone_no=phone_no, address=address, date=datetime.now(), email=email)
        db.session.add(entry)
        obj = db.session.query(Citizen).order_by(Citizen.aadhar_no.desc()).first()
        entry1 = Admin(aadhar_no=obj.aadhar_no, password=a, date=datetime.now())
        db.session.add(entry1)
        db.session.commit()
        mail.send_message("new entry in database", sender="projectcs257@gmail.com", recipients=[email],
                          body=f"your aadhar number is {obj.aadhar_no} \n your password is {a}")
    return render_template('signup.html')


app.run(debug=True)

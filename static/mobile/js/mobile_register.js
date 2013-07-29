first_name = document.register_form.first_name;
last_name = document.register_form.last_name;
email = document.register_form.reg_email;
password = document.register_form.reg_password;
re_password = document.register_form.reg_re_password;
errors = 0;

// background of input upon error
function xcolor(x){
	x.style.color = "#FF3333";
	errors += 1;
}
// background upon focus
function ncolor(n){
	n.style.color = "#FFFFFF";
}

function validate(){
	errors = 0;
	// first_name
	f = first_name.value;
	if(f.length==0){
		xcolor(first_name);
	}
	// last_name
	l = last_name.value;
	if(l.length==0){
		xcolor(last_name);
	}
	//email
	e = email.value;
	if(e.indexOf('@') == -1){
		xcolor(email);
	}
	//password verification
	p = password.value;
	rp = re_password.value;
	if(p.length<6 || p!=rp){
		xcolor(password);
		xcolor(re_password);
	}
	// form submit
	if(errors == 0){
		document.register_form.submit();
	}
}

first_name.onfocus = function(){ ncolor(first_name); }
last_name.onfocus = function(){ ncolor(last_name); }
email.onfocus = function(){ ncolor(email); }
password.onfocus = function(){ ncolor(password); }
re_password.onfocus = function(){ ncolor(re_password); }

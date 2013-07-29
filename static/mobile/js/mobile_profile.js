first_name = document.profile_form.first_name;
last_name = document.profile_form.last_name;
email = document.profile_form.email;
password = document.profile_form.password;
new_password = document.profile_form.new_password;
re_new_password = document.profile_form.re_new_password;
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
	np = new_password.value;
	rnp = re_new_password.value;
	if( (np.length<6&&np.length>0) || np!=rnp){
		xcolor(new_password);
		xcolor(re_new_password);
	}
	// form submit
	if(errors == 0){
		document.profile_form.submit();
	}
}
first_name.onfocus = function(){ ncolor(first_name); }
last_name.onfocus = function(){ ncolor(last_name); }
email.onfocus = function(){ ncolor(email); }
password.onfocus = function(){ ncolor(password); }
new_password.onfocus = function(){ ncolor(new_password); }
re_new_password.onfocus = function(){ ncolor(re_new_password); }

package_name = document.upload_form.package_name;
apk_name = document.upload_form.apk_name;
license = document.upload_form.license;
website = document.upload_form.website;
source_code = document.upload_form.source_code;
issue_tracker = document.upload_form.issue;
summary = document.upload_form.summary;
description = document.upload_form.description;
changelog = document.upload_form.changelog;
screenshot1 = document.upload_form.screenshot1;
screenshot2 = document.upload_form.screenshot2;
screenshot3 = document.upload_form.screenshot3;
screenshots = document.getElementById('screenshots');
apk = document.upload_form.apk;
errors = 0;
// background of input upon error
function xcolor(x){
	x.style.background = "#FF3333";
	errors += 1;
}
// background upon focus
function ncolor(n){
	n.style.background = "none"
}
function check_image(i){
	val = 0;
	if(i == "png" || i=="jpg" || i=="jpeg" || i=="gif"){
		val = 1;
	}
	return(val);
}
function validate(){
	errors = 0;
	// package_name
	p = package_name.value.split('.');
	if(p.length!=3){
		xcolor(package_name);
	}
	// apk_name
	a = apk_name.value;
	if(a.length==0){
		xcolor(apk_name);
	}
	// source_code empty
	s = source_code.value;
	if(s.length==0){
		xcolor(source_code);
	}
	//summary empty
	u = summary.value;
	if(u.length==0){
		xcolor(summary);
	}
	// description empty
	d = description.value;
	if(d.length==0){
		xcolor(description);
	}
	screen_count = 0;
	s1 = screenshot1.value.split('.').pop();
	s2 = screenshot2.value.split('.').pop();
	s3 = screenshot3.value.split('.').pop();
	if(check_image(s1)){
		screen_count += 1;	
	}
	if(check_image(s2)){
		screen_count += 1;	
	}
	if(check_image(s3)){
		screen_count += 1;	
	}
	if(screen_count<2)
		screenshots.style.color = "#FF0000";
	else
		screenshots.style.color = "#000000";
	// apk file verification
	ext = apk.value.split('.').pop();
	if(ext != "apk"){
		xcolor(apk);
	}
	// form submit
	if(errors == 0){
		document.upload_form.submit();
	}
}// validate func. ends
package_name.onfocus = function(){ ncolor(package_name); }
apk_name.onfocus = function(){ ncolor(apk_name); }
source_code.onfocus = function(){ ncolor(source_code); }
summary.onfocus = function(){ ncolor(summary); }
description.onfocus = function(){ ncolor(description); }
apk.onchange = function(){ ncolor(apk); }

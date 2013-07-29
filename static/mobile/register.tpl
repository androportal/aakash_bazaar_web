	%include ./static/mobile/header.tpl	
	<div data-role="page" id="register">
		<div data-role="header" data-theme="a">
			<h1>Register</h1>
			<a href="/" data-icon="arrow-l">Back</a>
			<a href="#" data-icon="delete" data-iconpos="right">Close</a>
		</div> <!-- header -->

		<div data-role="content">
			<form action="/register" method="POST" name="register_form">
				<label for="text-basic">First Name</label>
				<input type="text" name="first_name">
				<label for="text-basic">Last Name</label>
				<input type="text" name="last_name">
				<label for="text-basic">Email</label>
				<input type="text" name="reg_email">
				<label for="password">Password</label>
				<input type="password" name="reg_password">
				<label for="password">Retype Password</label>
				<input type="password" name="reg_re_password">
				<input type="button" value="Register" onclick="validate()">
			</form>
		</div> <!-- content -->
	</div> <!-- page #register -->
	<script type="text/javascript" src="/static/mobile/js/mobile_register.js"></script>
	%include ./static/mobile/footer.tpl

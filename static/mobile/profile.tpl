	%include ./static/mobile/header.tpl
	<div data-role="page" id="profile">
		<script type="text/javascript" src="/static/mobile/js/mobile_profile.js"></script>
		<div data-role="header" data-theme="a" data-position="fixed">
			<h1>Profile</h1>
			<a href="/dashboard" data-icon="arrow-l">Back</a>
			<a href="#" data-icon="delete" data-iconpos="right">Close</a>
		</div> <!-- header -->
		
		<div data-role="content">
			%if message:
				<h3 align="center">Changes saved.</h3>
			%end
			<form action="/profile" method="POST" name="profile_form">
				<label for="first_name">First Name</label>
				<input type="text" name="first_name" value="{{ first_name }}"> <br>
				<label for="last_name">Last Name</label>
				<input type="text" name="last_name" value="{{ last_name }}"> <br>
				<label for="email">Email</label>
				<input type="text" name="email" value="{{ email }}"> <br>
				<label for="password">Password</label>
				<input type="password" name="password" value="{{ password }}"> <br>
				<label for="new_password">New Password</label>
				<input type="password" name="new_password"> <br>
				<label for="re_new_password">Retype New Password</label>
				<input type="password" name="re_new_password"> <br>
				<input type="button" value="Save Changes" onclick="validate()">
			</form>
		</div> <!-- content -->
	</div> <!-- page #profile -->
	%include ./static/mobile/footer.tpl

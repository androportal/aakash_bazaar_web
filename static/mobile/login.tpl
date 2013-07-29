	%include ./static/mobile/header.tpl
	<div data-role="page" id="login">
		<div data-role="header" data-theme="a" data-position="fixed">
			<h1>Login</h1>
			<a href="/" data-icon="arrow-l">Back</a>
			<a href="#" data-icon="delete" data-iconpos="right">Close</a>
		</div> <!-- header -->
		
		<div data-role="content">
			%if message:
				<h3 align="center">{{ message }} </h3>
			%end
			<form action="/login" method="POST">
				<label for="email">Email</label>
				<input type="text" name="email"> <br>
				<label for="password">Password</label>
				<input type="password" name="password"> <br>
				<input type="submit" value="Login">
			</form>
		</div> <!-- content -->		
	</div> <!-- page #login -->
	%include ./static/mobile/footer.tpl

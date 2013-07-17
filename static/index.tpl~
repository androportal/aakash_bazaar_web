	%include ./static/header-index.tpl
	<div id="jumbotron">
		<div id="content-wrapper">
			<div id="main-content" class="row-fluid">
				<div class="span5">
					<h2>Login with your <br>registered account</h2>
					<form action="/login" method="POST">
						<input type="email" placeholder="Email" name="email" class="span10"><br>
						<input type="password" placeholder="Password" name="password" class="span10"><br>
						<input type="submit" value="Login" class="btn btn-primary btn-large span10">
					</form>
				</div>
				<div class="span6 hidden-phone pull-right">
					<h2>Dont have an bazaar account yet ?</h2>
					<form action="/register" method="POST" name="reg_form">
						<div class="controls controls-row">
						<input type="text" placeholder="First Name" name="first_name" class="span3">
						<input type="text" placeholder="Last Name" name="last_name" class="span3">
						<input type="text" placeholder="Email" name="reg_email" class="span6">
						</div>
						<div class="controls controls-row">
						<input type="password" placeholder="Password" name="reg_password" class="span6">
						<input type="password" placeholder="Retype Password" name="reg_re_password" class="span6">
						</div>
						<input type="button" value="Register Now" class="btn btn-inverse btn-large span12" onclick='validate()'>
					</form>
				</div>
				<div class="clearfix"></div>
			</div><!-- ./row-fluid-->
		</div><!-- ./content-wrapper -->
	</div> <!-- ./jumbotron -->
	<script type="text/javascript" src="/static/js/validate_index.js"></script>
	%include ./static/footer.tpl

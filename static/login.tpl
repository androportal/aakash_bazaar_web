	%include ./static/header-index.tpl
	<div id="page-wrapper">
		<div id="page">
			<center>
			<h3 align=>Login to your account</h3> <br>
			<div class="row-fluid">
				<div class="span3 hidden-phone"></div>
				%if message:
					<div class="alert alert-danger span6">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						{{ message }}
					</div>
				%end
				<div class="clearfix"></div>
				<form action="/login" method="POST">
						<input type="text" placeholder="Email" name="email" class="span6"><br>
						<input type="password" placeholder="Password" name="password" class="span6"><br>
						<input type="submit" value="Login" class="btn btn-primary btn-large span6">
				</form>
			</div>
			</center>
		</div> <!-- ./page -->
	</div><!-- ./page-wrapper -->
	%include ./static/footer.tpl

	%include ./static/header-index.tpl
	<div id="page-wrapper">
		<div id="page">
			<h3>Aakash Bazaar Registration</h3>
			<div class="row-fluid">
				%if message:
					<div class="alert alert-danger span8">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						User Already Exists.
					</div>
				%end
				<div class="clearfix"></div>
				<form action="/register" method="POST" name="register_form">
				<label>First Name *</label>
				<input type="text" name="first_name" class="span8">
				<label>Last Name *</label>
				<input type="text" name="last_name" class="span8">
				<label>Email *</label>
				<input type="text" name="reg_email" class="span8">
				<label>Password * <small>(Atlest 6 characters)</small></label>
				<input type="password" name="reg_password" class="span8">
				<label>Retype Password *</label>
				<input type="password" name="reg_re_password" class="span8"><br>
				<input type="button" value="Create Account" class="btn btn-success btn-large span4" onclick='validate()'>
				</form>
			</div>
		</div> <!-- ./page -->
	</div><!-- ./page-wrapper -->
	<script type="text/javascript" src="/static/js/validate_register.js"></script>
	%include ./static/footer.tpl

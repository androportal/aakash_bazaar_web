	%include ./static/header.tpl
	<div id="page-wrapper">
		<div id="page">
			<h3>User Profile</h3>
			<div class="row-fluid">
				%if message=='done':
					<div class="alert alert-success span8">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						Profile changes saved successfully.
					</div>
				%end
				<div class="clearfix"></div>
				<form action="/profile" method="POST" name="profile_form">
					<label>First Name</label>
					<input type="text" value="{{ first_name }}" placeholder="First Name" name="first_name" class="span8">
					<label>Last Name</label>
					<input type="text" value="{{ last_name }}" placeholder="Last Name" name="last_name" class="span8">
					<label>Email</label>
					<input type="text" value="{{ email }}" placeholder="Email" name="email" class="span8">
					<h5>Password Section</h5>
					<label>Old Password</label>
					<input type="password" value="{{ password }}" placeholder="Password" name="password" class="span8">
					<label>New Password <small>(Leave blank if unchanged)</small></label>
					<input type="password" name="new_password" class="span8">
					<label>Retype New Password <small>(Leave blank if unchanged)</small></label>
					<input type="password" name="re_new_password" class="span8"> <br><br>
					<input type="button" value="Save Changes" class="btn btn-success btn-large span4" onclick="validate()">
				</form>
			</div>
		</div> <!-- ./page -->
	</div><!-- ./page-wrapper -->
	<script type="text/javascript" src="/static/js/validate_profile.js"></script>
	%include ./static/footer.tpl

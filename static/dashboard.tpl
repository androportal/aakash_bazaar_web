	%include ./static/header.tpl
	<div id="page-wrapper">
		<div id="page">
			<div class="row-fluid">
				<div class="span8">
				<h4><u>Welcome to the Aakash Bazaar Dashboard</u></h4>
				<ul>
					<li>You can now upload your application <a href="/upload">here</a>.</li>
					<li>All applications will be reviewed by our team.</li>
					<li>Currently you have uploaded <b>{{ count }}</b> applications.</li>
				</ul>
				<br>
				%if message == 'up':
					<div class="alert alert-success span11">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						Application Successfully Uploaded.
					</div>
				%end
				%if count >0:
					<table class="table table-condensed table-hover table-bordered">
					<th>#</th>
					<th>Package Name</th>
					<th>Apk Name</th>
					<th>Category</th>
					%for i in range(0,count):
						<tr>
							<td>{{ i+1 }}</td>
							<td>{{ package[i] }}</td>
							<td>{{ apk[i] }}</td>
							<td>{{ category[i] }}</td>
						</tr>
					%end
					</table>
				%end
			</div>

			<div class="span4 hidden-phone">
			<h4><u>External Links</u></h4>
				<ul>
					<li><a href="http://aakashlabs.org/">Aakash Labs</a></li>
					<li><a href="http://www.it.iitb.ac.in/AakashApps/repo/">GitHub (androportal)</a></li>
					<li><a href="http://aakashlabs.org/docs/">Developer Docs</a></li>
					<li><a href="http://www.it.iitb.ac.in/AakashApps/repo/">Downloads</a></li>
					<li><a href="http://www.youtube.com/user/theaakashtablet">Youtube Feed</a></li>
				</ul>
			</div>
			</div class="clearfix"></div>
		</div> <!-- ./page -->
	</div><!-- ./page-wrapper -->
	%include ./static/footer.tpl

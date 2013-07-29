	%include ./static/mobile/header.tpl
	<div data-role="page" id="dashboard">
		<div data-role="header">
			<h1> User: {{ email }} </h1>
			<a href="#left-panel" data-icon="arrow-l">Menu</a>
			<a href="#" data-icon="delete" data-iconpos="right">Close</a>
		</div> <!-- header -->
		
		<div data-role="content">
			%if count >0:
					<table data-role="table" data-mode="reflow" class="ui-responsive table-stroke">
					<thead>
						<tr>
						<th>#</th>
						<th>Package Name</th>
						<th>Apk Name</th>
						<th>Category</th>
						</tr>
					</thead>
					<tbody>
					%for i in range(0,count):
						<tr>
							<th>{{ i+1 }}</th>
							<td>{{ package[i] }}</td>
							<td>{{ apk[i] }}</td>
							<td>{{ category[i] }}</td>
						</tr>
					%end
					</tbody>
					</table>
				%end
		</div> <!-- content -->
		
		<div data-role="panel" data-swipe-close="true" id="left-panel" data-display="overlay" data-position="left" data-theme="a">
			<ul data-role="listview" data-theme="a">
				<li data-icon="delete"><a href="#left-panel">Close Menu</a></li>
				<li data-icon="plus"><a href="/upload" data-transition="slide">Upload</a></li>
				<li data-icon="info"><a href="/profile">Profile</a></li>
				<li data-icon="minus"><a href="logout">Logout</a></li>
			</ul>
		</div> <!-- panel -->
	
	</div> <!-- page -->
	%include ./static/mobile/footer.tpl

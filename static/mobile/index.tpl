	%include ./static/mobile/header.tpl
	<div data-role="page" id="home">
		<div data-role="header" data-theme="a" data-position="fixed">
			<h1>Aakash Bazaar</h1>
			<a href="#left-panel" data-icon="arrow-l">Menu</a>
			<a href="#" data-icon="delete" data-iconpos="right">Close</a>
		</div> <!-- header -->
		
		<div data-role="content">
			<h2 align="center">Login with your registered account.</h2>
			<form action="login" method="POST">
				<label for="email">Email</label>
				<input type="text" name="email"> <br>
				<label for="password">Password</label>
				<input type="password" name="password"> <br>
				<input type="submit" value="Login">
			</form>
		</div> <!-- content -->
			
		<div data-role="panel" data-swipe-close="true" id="left-panel" data-display="overlay" data-position="left" data-theme="a">
				<ul data-role="listview" data-theme="a">
					<li data-icon="delete"><a href="#left-panel">Close Menu</a></li>
					<li data-icon="plus"><a href="/register">Register</a></li>
					<li data-icon="info"><a href="/about">About</a></li>
					<li data-icon="grid"><a href="/contact">Contact</a></li>
					<li data-icon="forward"><a href="#">Share</a></li>
				</ul>
		</div> <!-- panel -->
		
	</div> <!-- page #home -->
	%include ./static/mobile/footer-index.tpl

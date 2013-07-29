	%include ./static/mobile/header.tpl
	<div data-role="page" id="upload">
		<script type="text/javascript" src="/static/mobile/js/mobile_upload.js"></script>
		<div data-role="header" data-theme="a" data-position="fixed">
			<h1>Upload</h1>
			<a href="/dashboard" data-icon="arrow-l">Back</a>
			<a href="#" data-icon="delete" data-iconpos="right">Close</a>
		</div> <!-- header -->
		
		<div data-role="content">
			<form action="/upload" method="POST" enctype="multipart/form-data" name="upload_form" data-ajax="false">
				<label for="package_name">Package Name <span id="error"></span></label>
				<input type="text" name="package_name"> <br>
				<label for="apk_name">APK Name</label>
				<input type="text" name="apk_name"> <br>
				<label for="category">Application Category</label>
				<select name="category">
					<option value="Business Tools">Business Tools</option>
					<option value="Education">Education</option>
					<option value="Entertainment">Entertainment</option>
					<option value="Games">Games</option>
					<option value="Lifestyle">Lifestyle</option>
					<option value="News & Weather">News &amp; Weather</option>
					<option value="Productivity">Productivity</option>
					<option value="Social & Communication">Social &amp; Communication</option>
					<option value="Utilities">Utilities</option>
				</select> <br>
				<label for="license">Licence</label>
				<select name="license">
					<option value="GNU GPLv2">GNU GPLv3</option>
					<option value="GNU GPLv2"">GNU GPLv2</option>
				</select> <br>
				<h3><u>Application Links</u></h3>
				<label for="website">Website</label>
				<input type="text" name="website"> <br>
				<label for="source_code">Source Code</label>
				<input type="text" name="source_code"> <br>
				<label for="issue_tracker">Issue Tracker</label>
				<input type="text" name="issue_tracker"> <br>
				<h3><u>A little bit more</u></h3>
				<label for="summary">Summary *</label>
				<input type="text" name="summary"> <br>
				<label for="description">Description *</label>
				<input type="text" name="description"><br>
				<label for="changelog">Changelog</label>
				<input type="text" name="changelog"> <br>
				<h3><u>Files Upload</u></h3>
				<label for="apk">Upoad APK</label>
				<input type="file" name="apk"> <br>
				<label for="screenshot1">Screenshot 1</label>
				<input type="file" name="screenshot1"> <br>
				<label for="screenshot2">Screenshot 2</label>
				<input type="file" name="screenshot2"> <br>
				<label for="screenshot3">Screenshot 3</label>
				<input type="file" name="screenshot3"> <br>
				<input type="button" value="Submit Form" onclick="validate()">
			</form>
		</div> <!-- content -->
	</div> <!-- page #upload -->
	%include ./static/mobile/footer.tpl

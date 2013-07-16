	%include ./static/header.tpl
	<div id="page-wrapper">
		<div id="page">
			<h3>Application Upload Form</h3>
			<p><small>All fields marked with * are compulsary</small></p>
			<div class="row-fluid">
				<form action="/upload" method="POST" enctype="multipart/form-data" name="upload_form">
					<label>Package Name *</label>
					<input type="text" name="package_name" class="span8">
					<label>Name of APK *</label>
					<input type="text" name="apk_name" class="span8">
					<label>Application Category *</label>
					<select name="category" class="span8">
						<option value="Business Tools">Business Tools</option>
						<option value="Education">Education</option>
						<option value="Entertainment">Entertainment</option>
						<option value="Games">Games</option>
						<option value="Lifestyle">Lifestyle</option>
						<option value="News & Weather">News &amp; Weather</option>
						<option value="Productivity">Productivity</option>
						<option value="Social & Communication">Social &amp; Communication</option>
						<option value="Utilities">Utilities</option>
					</select>
					<label>License *</label>
					<select name="license" class="span8">
						<option value="GNU GPLv3">GNU GPLv3</option>
						<option value="GNU GPLv2">GNU GPLv2</option>
					</select>
					<h4><u>Application Links</u></h4>
					<label>Website</label>
					<input type="text" name="website" class="span8">
					<label>Source Code *</label>
					<input type="text" name="source_code" class="span8">
					<label>Issue Tracker</label>
					<input type="text" name="issue_tracker" class="span8">
					<h4><u>A little bit more.</u></h4>
					<label>Summary *</label>
					<textarea name="summary" class="span9"></textarea>
					<label>Description *</label>
					<textarea name="description" class="span9"></textarea>
					<label>Changelog</label>
					<textarea name="changelog" class="span9"></textarea><br>
					<h4>Upload Section *</h4>
					<div class="imp span9">
					<label>Screenshots <small id="screenshots">(Atleast 2 screenshots are required.)</small></label>
					<div class="controls controls-row">
					<input type="file" name="screenshot1"><br><br>
					<input type="file" name="screenshot2"><br><br>
					<input type="file" name="screenshot3">
					</div> <br><br>
					<label><b>Upload Your Application (.apk)</b></label>
					<div class="controls controls-row">
					<input type="file" name="apk" class="span6"> <div class="visible-phone"> <br><br> </div>
					<div class="span1"></div>
					<input type="button" value="Submit Application" class="btn btn-inverse span5" onclick='validate()'>
					</div>
					</div><!-- ./imp -->
				</form>
			</div>

		</div> <!-- ./page -->
	</div><!-- ./page-wrapper -->
	<script type="text/javascript" src="/static/js/validate_upload.js"></script>
	%include ./static/footer.tpl

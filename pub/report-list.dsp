<!DOCTYPE html>
<html>
	<head>
		<title>Report List</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css"/>
		<link rel="stylesheet" type="text/css" href="wxcloudreadinessanalyzer.css"/>
		<script>
			function checkButton() {
				checked = false;
				checkboxes = document.getElementsByName('files');
				for(let checkbox of checkboxes){
					if (checkbox.checked) {
						checked = true;
						break;
					}
				}
				toggleButton(checked);
			}
			function toggle(source) {
				checkboxes = document.getElementsByName('files');
				for(let checkbox of checkboxes){
					checkbox.checked = source.checked;
				}
				toggleButton(source.checked);
			}
			function toggleButton(checked){
				button = document.getElementsByName('delButton')[0];
				if (checked){
					button.disabled = false;
				} else {
					button.disabled = true;
			    }
			}
		</script>
	</head>
    <body class="body">
	%ifvar action equals('delete')%
		%invoke WxCloudReadinessAnalyzer.ui:deleteReports%
			%ifvar succeeded -notempty%
				<p class="message">The following files were successfully deleted: %nl%
				%loop succeeded%%value succeeded%%loopsep ', '%%endloop%</p>
			%endif%
			%ifvar failed%
				<p class="error">The following files could not be deleted: <p>
				%loop failed%%value failed%%loopsep ', '%%endloop%</p>
			%endif%
		%endinvoke%
	%endif%
	<form name="testform" method="post" action="report-list.dsp" target="body">
		<table width="100%">
			<tbody>
				<tr>
					<td>
						<table class="tableView" cellpadding="2"> 
							<tbody>
								<tr>
									<td class="heading" colspan="2">WxCloudReadinessAnalyzer Reports &nbsp;</td>
									%invoke WxCloudReadinessAnalyzer.ui:listReports%
									%ifvar numFiles equals('0')%
									<tr>
										<td class="td" class="oddcol-l">Reports directory is empty.</td>
									</tr>
									%else%
									<tr class="subheading">
										<th class="oddcol"><input title="Select / Unselect all" type="checkbox" onclick="toggle(this);"/></th>
										<th class="evencol-l">File name</th>
									</tr>
									%loop fileList%
									<tr>
										<th class="oddcol"><input type="checkbox" name="files" value="%value fileList%" onclick="checkButton();"></th><td class="evencol-l"><a href="reports/%value fileList%" download>%value fileList%</a></td>
									</tr>
									%endloop%
									<tr>
										<td class="action" colspan="2"><input name="action" type="hidden" value="delete"><input name="delButton" class="button2" type="submit" disabled="true" value="Delete Selected Reports" onclick="return confirm('Are you sure you want to delete the selected file(s)?');"></td>
									</tr>
									%endif%
								</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>
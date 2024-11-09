<!DOCTYPE html>
<html>
	<head>
		<title>Package Dependencies Report</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css"/>
		<script>
		function validateAndToggle(){
			msg.style.display = 'inline';
		}
		</script>
	</head>
	<body>
		<form name="testform" method="post" action="/invoke/WxCloudReadinessAnalyzer.report:createPackageDependenciesReport" target="body" onSubmit="validateAndToggle()">
			<table width="100%">
				<tbody>
					<tr>
						<td>
							<table class="tableView" cellpadding="2">
								<tbody>
									<tr>
										<td class="heading" colspan="2">Custom Services that Depend on a Specific Package &nbsp;&nbsp;</td>
									</tr>
									<!-- - - - Inputs Section - - - -->
									<tr>
										<td class="evenrow">
											<label for="packageName">* Package to find dependents of &nbsp;&nbsp;</label>
										</td>
										<td class="evenrow-l">
											<select list="packageNames" name="packageName" id="packageName" required />
											%invoke WxCloudReadinessAnalyzer.util:listAllPackages%
											<datalist id="packageNames">
												<option value="" selected disabled>Select package...</option>
												%loop packageNames%
												<option value="%value packageNames%">%value packageNames%</option>
												%endloop%
											</datalist>
										</td>
									</tr>
									<tr>
										<td class="oddrow">
											<i><label for="dependentPkgNameFilter">Dependent Package Name Filter (regex) &nbsp;&nbsp;</label></i>
										</td>
										<td class="oddrow-l">
											<input name="dependentPkgNameFilter" id="dependentPkgNameFilter"/>
										</td>
									</tr>
									<!--
									<tr>
										<td class="evenrow">
											<label for="ignoreSystemPackages">Ignore System Packages &nbsp;&nbsp;</label>
										</td>
										<td class="evenrow-l">
											<select name="ignoreSystemPackages" id="ignoreSystemPackages">
												<option value="true" selected>Yes</option>
												<option value="false">No</option>
											</select>
										</td>
									</tr>
									//-->
									<tr>
										<td class="action" colspan="2"><input class="button2" type="submit" value="Create Report" /></td>
									</tr>
									<tr>
										<td colspan="2" class="message" style="display:none;" id="msg">Creating report. Please wait... <img src="images/loading.gif" style="valign='middle'"/></td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>
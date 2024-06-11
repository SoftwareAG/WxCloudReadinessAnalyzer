<!DOCTYPE html>
<html>
	<head>
		<title>Java Service Dependencies Report</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css"/>
	</head>
	<body>
		<form name="testform" method="post" action="/invoke/WxCloudReadinessAnalyzer.report:createJavaServiceDependenciesReport" target="body">
			<table width="100%">
				<tbody>
					<tr>
						<td>
							<table class="tableView" cellpadding="2">
								<tbody>
									<tr>
										<td class="heading" colspan="2">Custom Services Using Custom Java Services &nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td class="oddrow">
											<i><label for="packageNameFilter">Package Name Filter (regex) &nbsp;&nbsp;</label></i>
										</td>
										<td class="oddrow-l">
											<input name="packageNameFilter" id="packageNameFilter" value=""/>
										</td>
									</tr>
									</tr>
										<td class="action" colspan="2"><input class="button2" type="submit" value="Create Report" onClick="msg.style.display = 'inline';"/></td>
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
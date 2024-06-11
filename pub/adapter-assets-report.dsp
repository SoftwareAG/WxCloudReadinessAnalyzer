<!DOCTYPE html>
<html>
	<head>
		<title>Incompatible Adapter Assets Report</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css"/>
	</head>
	<body>
		<form name="testform" method="post" action="/invoke/WxCloudReadinessAnalyzer.report:createAdapterCompatibilityReport" target="body">
			<table width="100%">
				<tbody>
					<tr>
						<td>
							<table class="tableView" cellpadding="2">
								<tbody>
									<tr>
										<td class="heading" colspan="2">Incompatible Custom Adapter Connections, Services, Listeners and Notifications &nbsp;&nbsp;</td>
									</tr>
									%invoke WxCloudReadinessAnalyzer.adapters:listAdapters%
									%ifvar registeredAdaptersList -notempty%
									<!-- - - - Inputs Section - - - -->
									<tr>
										<td class="evenrow">
											<label for="adapter"><i>Optional: Select specific adapter to check dependents &nbsp;&nbsp;</i></label>
										</td>
										<td class="evenrow-l">
											<select name="adapter" id="adapter">
												<option value="all" selected>All registered adapters&nbsp;&nbsp;</option>
												%loop registeredAdaptersList%
												<option value="%value adapterTypeName%">%value adapterDisplayName%&nbsp;&nbsp;</option>
												%endloop%
											</select>
										</td>
									</tr>
									<tr>
										<td class="action" colspan="2"><input class="button2" type="submit" value="Create Report" onClick="msg.style.display = 'inline';"/></td>
									</tr>
									<tr>
										<td colspan="2" class="message" style="display:none;" id="msg">Creating report. Please wait... <img src="images/loading.gif" style="valign='middle'"/></td>
									</tr>
									%else%
									<tr>
										<td class="evenrow-l" colspan="2">No registered adapters found.</td>
									</tr>
									%endif%
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
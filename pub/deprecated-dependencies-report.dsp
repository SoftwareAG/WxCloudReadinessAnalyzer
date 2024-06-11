<!DOCTYPE html>
<html>
	<head>
		<title>Deprecated Service Dependencies Report</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css"/>
	</head>
	<body>
		<form name="testform" method="post" action="/invoke/WxCloudReadinessAnalyzer.report:createDeprecatedDependenciesReport" target="body">
			<table width="100%">
				<tbody>
					<tr>
						<td>
							<table class="tableView" cellpadding="2">
								<tbody>
									<tr>
										<td class="heading" colspan="2">Custom Services Using Deprecated Built-in Services &nbsp;&nbsp;</td>
									</tr>
									<!-- - - - Inputs Section - - - -->
									<tr>
										<td class="evenrow">
											<i><label for="packageNameFilter">Package Name Filter (regex) &nbsp;&nbsp;</label></i>

										</td>
										<td class="oddrow-l">
											<input name="packageNameFilter" id="packageNameFilter" value="">
											</td>
										</tr>
										<script>swapRows();</script>
										<td class="action" colspan="2"><input class="button2" type="submit" value="Create Report"/></td>
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
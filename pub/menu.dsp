<html>
<head>
<link rel="stylesheet" type="text/css" href="webMethods.css"/>
 <link rel="stylesheet" TYPE="text/css" HREF="webMethods-wM-AdminUI-DELITE.css"/>
%ifvar webMethods-wM-AdminUI%
  <link rel="stylesheet" TYPE="text/css" HREF="webMethods-wM-AdminUI-DELITE.css"/>
  <script>webMethods_wM_AdminUI = 'true';</script>
%endif%
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<meta http-equiv="Expires" content="-1">
</head>

%invoke WxCloudReadinessAnalyzer.ui:mainMenu%
<body class="menu">
<table class="menuTable" width="100%" cellspacing="2" cellpadding="2" border="2" id="mTable">
%scope buttonUrls%
%loop sections%
    <tr>
		<td class="menusection-expanded">%value text%</td>
		%loop submenu%
			%ifvar url -notempty%
				<tr>
					<td class="menuitem"><a href="%value url%" target="body">%value text%</a></td>
				</tr>
			%endif%
		%endloop%
	</tr>
%endloop%
%endscope%
</table>
</body>
</html>
